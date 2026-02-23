// ignore_for_file: avoid_print
//
// Figma 섹션(또는 프레임)의 자식 노드 ID 목록을 조회합니다.
// 토큰: 환경변수 FIGMA_ACCESS_TOKEN 또는 프로젝트 루트 .env 파일의 FIGMA_ACCESS_TOKEN=xxx
// 예:  dart run scripts/figma_list_section_children.dart XCDfITElnlYCooopNPxPeV 696:7778
//
// Figma Personal Access Token: Figma 설정 → Account → Personal access tokens
// https://www.figma.com/developers/api#access-tokens

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
    print('Usage: dart run scripts/figma_list_section_children.dart <file_key> <node_id>');
    print('Set FIGMA_ACCESS_TOKEN in environment or in .env at project root.');
    exit(1);
  }

  final token = _loadToken();
  if (token == null || token.isEmpty) {
    print('Error: FIGMA_ACCESS_TOKEN not set. Set env var or add FIGMA_ACCESS_TOKEN=xxx to .env');
    exit(1);
  }

  final fileKey = args[0];
  final nodeId = args[1];

  final encodedId = Uri.encodeComponent(nodeId);
  final url = Uri.parse('https://api.figma.com/v1/files/$fileKey/nodes?ids=$encodedId');

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
      print('No nodes returned.');
      exit(0);
    }

    final nodeData = nodes[nodeId] as Map<String, dynamic>?;
    if (nodeData == null) {
      print('Node $nodeId not found in response.');
      exit(1);
    }

    final doc = nodeData['document'] as Map<String, dynamic>?;
    if (doc == null) {
      print('No document in node.');
      exit(1);
    }

    final children = doc['children'] as List<dynamic>? ?? [];
    if (children.isEmpty) {
      print('No children (section is empty or node has no direct children).');
      exit(0);
    }

    // JSON 배열로 출력 (에이전트/다른 도구에서 파싱하기 좋게)
    final list = <Map<String, String>>[];
    for (final c in children) {
      final map = c as Map<String, dynamic>;
      final id = map['id'] as String? ?? '';
      final name = map['name'] as String? ?? '';
      final type = map['type'] as String? ?? '';
      list.add({'id': id, 'name': name, 'type': type});
    }

    print(jsonEncode(list));
  } finally {
    client.close();
  }
}
