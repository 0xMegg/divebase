# Figma 2차 화면 – 노드 ID 매핑

Figma 파일: [Dana's](https://www.figma.com/design/XCDfITElnlYCooopNPxPeV/Dana-s)  
섹션 노드: `696:7778` (2차 화면)

## 섹션 링크만으로 안의 페이지 노드 찾기

**섹션 URL만 주었을 때** 안의 모든 프레임(페이지) 노드 ID를 자동으로 가져오려면 프로젝트 스크립트를 사용합니다.

1. [Figma Personal access token](https://www.figma.com/developers/api#access-tokens) 발급 (Figma 설정 → Account → Personal access tokens).
2. 터미널에서:
   ```bash
   export FIGMA_ACCESS_TOKEN="your_token"
   dart run scripts/figma_list_section_children.dart XCDfITElnlYCooopNPxPeV 696:7778
   ```
3. 출력되는 JSON 배열에 각 자식 노드의 `id`, `name`, `type`이 포함됩니다.  
   에이전트는 이 목록으로 각 노드를 MCP `analyze_full_screen(fileId, nodeId)`에 넣어 화면별로 분석·구현할 수 있습니다.

URL에서 추출: `https://www.figma.com/design/{file_key}/...?node-id=696-7778` → file_key=`XCDfITElnlYCooopNPxPeV`, node_id=`696:7778` (하이픈을 콜론으로).

---

개별 프레임의 nodeId를 수동으로 쓰고 싶다면: Figma에서 해당 프레임을 선택한 뒤 URL의 `node-id=XXX-YYYY`를 `XXX:YYYY` 형식으로 적어 두세요.

| # | 화면 이름 | Node ID | 라우트 경로 |
|---|----------|---------|-------------|
| 1 | 로그인&가입 | | /login |
| 2 | Main | | /home |
| 3 | Title | | (공통 헤더) |
| 4–8 | Title (x5) | | |
| 9 | 서비스이용약권 | | /terms |
| 10 | 로그인/Alert/처리실패 | | (다이얼로그) |
| 11 | 로그인/Modal/서비스이용동의 | | /login/consent |
| 12 | 로그인/Alert/사용불가 | | (다이얼로그) |
| 13 | 마이페이지/고객지원/회원탈퇴/Alert/진행여부 | | (다이얼로그) |
| 14 | 홈/다이빙로그/Alert/진행여부 | | (다이얼로그) |
| 15 | 가입/Alert/사용불가 | | (다이얼로그) |
| 16 | 로그인/Alert/가입유도 | | (다이얼로그) |
| 17 | 가입/Alert/처리실패 | | (다이얼로그) |
| 18 | 마이페이지/다이빙 정보존재 | | /mypage |
| 19 | 마이페이지/Default | | /mypage |
| 20 | 홈/Empty_r3 | | /home |
| 21 | 홈/다이빙로그/조회 | | /home/logs |
| 22 | 홈/다이빙로그/수정/모두펼치기 | | /home/logs/:id/edit |
| 23 | 홈/다이빙로그/수정/Default | | /home/logs/:id |
| 24 | 로그 등록/수쿠버다이빙/Step1 | | /log/scuba/1 |
| 25 | 로그 등록/프리다이빙/Step1 | | /log/free/1 |
| 26 | 로그 등록/옵션선택 | | /log/option |
| 27–33 | 로그 등록/수쿠버·프리 Step2–7 | | /log/scuba/2–7, /log/free/2–7 |
| 34–37 | Bottom Sheets (Date/Time/서치 단일·다중) | | (모달) |
| 38–39 | 로그 등록/완료 (스쿠버·프리) | | /log/complete |
| 40–47 | 마이페이지 (정보상세, 기본정보 수정, 다이빙정보 수정 등) | | /mypage/* |
| 48–49 | 마이페이지/고객지원, 회원탈퇴 | | /mypage/support, /mypage/withdraw |
| 50 | 로그인&가입/인증팝업 | | /login/verify |
| 51–66 | Note, Title 기타 | | (공통/참고) |

MCP 사용 예: `analyze_full_screen(fileId: "XCDfITElnlYCooopNPxPeV", nodeId: "XXX:YYYY")`
