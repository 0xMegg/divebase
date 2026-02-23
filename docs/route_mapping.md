# 2차 화면 – 라우트 매핑 검증

## 구현된 라우트 (GoRouter)

| 경로 | 화면 | 비고 |
|------|------|------|
| /login | LoginScreen | 로그인&가입 |
| /login/consent | LoginConsentScreen | 서비스이용동의 모달 |
| /login/verify | LoginVerifyScreen | 인증팝업 |
| /terms | TermsScreen | 서비스이용약권 |
| / | redirect → /home | |
| /home | HomeScreen | Main, 홈/Empty |
| /home/logs | LogListScreen | 홈/다이빙로그/조회 |
| /home/logs/:id | LogDetailScreen | 홈/다이빙로그/수정/Default |
| /log/option | LogOptionScreen | 로그 등록/옵션선택 |
| /log/scuba/:step | LogStepScreen | 로그 등록/수쿠버 Step1–7 |
| /log/free/:step | LogStepScreen | 로그 등록/프리 Step1–7 |
| /log/complete | LogCompleteScreen | 로그 등록/완료 |
| /mypage | MyPageScreen | 마이페이지/Default |
| /mypage/edit | MypageEditScreen | 기본정보 수정 |
| /mypage/support | MypageSupportScreen | 고객지원 |
| /mypage/withdraw | MypageWithdrawScreen | 회원탈퇴 |

## Alert/Modal (다이얼로그)

- 로그인/Alert/처리실패, 사용불가, 가입유도 → `showAppAlert()`
- 가입/Alert/사용불가, 처리실패 → `showAppAlert()`
- 마이페이지/회원탈퇴/Alert/진행여부 → MypageWithdrawScreen 내 `showAppAlert()`
- 홈/다이빙로그/Alert/진행여부 → (삭제 확인 시) `showAppAlert()`
- Bottom Sheets (Date/Time/서치) → `showAppBottomSheet()`

## 네비게이션 흐름

1. **앱 시작** → /login → (로그인) → /home
2. **홈** → 로그 목록 → /home/logs | 로그 등록 → /log/option → /log/scuba|free/1..7 → /log/complete → /home
3. **마이페이지** → /mypage/edit | /mypage/support | /mypage/withdraw
4. **하단 탭** → 홈(/home), 다이빙로그(/home/logs), 마이페이지(/mypage)

## 검증

- [x] 로그인 → 홈 이동
- [x] 홈 ↔ 로그 목록 ↔ 로그 상세 (경로 존재)
- [x] 로그 등록 플로우: option → scuba/free 1–7 → complete → home
- [x] 마이페이지 서브: edit, support, withdraw
- [x] ShellRoute 하단 탭 인덱스와 경로 일치
