// ignore_for_file: avoid_print
//
// Figma 노드 한 개의 문서 트리(자식 재귀)를 JSON으로 출력.
// 사용: dart run scripts/figma_get_node_tree.dart <file_key> <node_id> [--depth 5]
// 토큰: .env 의 FIGMA_ACCESS_TOKEN

import 'dart:convert';
import 'dart:io';

String? _loadToken() {
  final env = Platform.environment['FIGMA_ACCESS_TOKEN'];
  if (env != null && env.isNotEmpty) return env;
  final envFile = File('.env');
  if (!envFile.existsSync()) return null;
  for (final line in envFile.readAsLinesSync()) {
    final s = line.trim();
    if (s.isEmpty || s.startsWith('#')) continue;
    final idx = s.indexOf('=');
    if (idx <= 0) continue;
    final key = s.substring(0, idx).trim();
    final value = s.substring(idx + 1).trim();
    if (key == 'FIGMA_ACCESS_TOKEN' && value.isNotEmpty) return value;
  }
  return null;
}

void main(List<String> args) async {
  if (args.length < 2) {
    print('Usage: dart run scripts/figma_get_node_tree.dart <file_key> <node_id> [--depth 5]');
    exit(1);
  }
  final fileKey = args[0];
  final nodeId = args[1];
  int depth = 2;
  for (var i = 2; i < args.length - 1; i++) {
    if (args[i] == '--depth' && int.tryParse(args[i + 1]) != null) {
      depth = int.parse(args[i + 1]);
      break;
    }
  }
  final token = _loadToken();
  if (token == null || token.isEmpty) {
    print('Error: FIGMA_ACCESS_TOKEN not set (env or .env)');
    exit(1);
  }
  final encodedId = Uri.encodeComponent(nodeId);
  final url = Uri.parse('https://api.figma.com/v1/files/$fileKey/nodes?ids=$encodedId&depth=$depth');
  final client = HttpClient();
  try {
    final request = await client.getUrl(url);
    request.headers.set('X-Figma-Token', token);
    final response = await request.close();
    final body = await response.transform(utf8.decoder).join();
    if (response.statusCode != 200) {
      print('API error ${response.statusCode}: $body');
      exit(1);
    }
    final data = jsonDecode(body) as Map<String, dynamic>;
    final nodes = data['nodes'] as Map<String, dynamic>?;
    if (nodes == null || nodes.isEmpty) {
      print('No nodes');
      exit(1);
    }
    final nodeData = nodes[nodeId] as Map<String, dynamic>?;
    if (nodeData == null) {
      print('Node $nodeId not found');
      exit(1);
    }
    final doc = nodeData['document'] as Map<String, dynamic>?;
    if (doc == null) {
      print('No document');
      exit(1);
    }
    print(const JsonEncoder.withIndent('  ').convert(doc));
  } finally {
    client.close();
  }
}
