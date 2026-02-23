# 스크립트

## figma_list_section_children.dart

Figma **섹션(또는 프레임)의 직계 자식 노드** 목록을 Figma API로 조회합니다.  
섹션 링크만 있을 때 안의 페이지(프레임) 노드 ID를 찾는 데 사용합니다.

### 필요 조건

- [Figma Personal access token](https://www.figma.com/developers/api#access-tokens) (Figma → 설정 → Account → Personal access tokens)

### 사용법

```bash
export FIGMA_ACCESS_TOKEN="figd_xxxx..."
dart run scripts/figma_list_section_children.dart <file_key> <node_id>
```

예 (Dana's 2차 화면 섹션):

```bash
export FIGMA_ACCESS_TOKEN="figd_xxxx..."
dart run scripts/figma_list_section_children.dart XCDfITElnlYCooopNPxPeV 696:7778
```

### 출력

stdout에 JSON 배열이 출력됩니다. 각 항목: `id`, `name`, `type`.

```json
[{"id":"696:7779","name":"로그인&가입","type":"FRAME"},{"id":"696:7780","name":"Main","type":"FRAME"},...]
```

이 `id`를 Figma Flutter MCP의 `analyze_full_screen` 또는 `generate_flutter_implementation`에 `nodeId`로 넘기면 해당 화면을 분석·구현할 수 있습니다.
