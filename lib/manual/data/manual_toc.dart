import '../models/manual_section.dart';

const manualToc = <ManualEntry>[
  ManualEntry(
    id: '1-program-main-menu',
    title: '1. 프로그램 버튼 및 메뉴(메인 화면)',
  ),
  ManualEntry(
    id: '2-robot-connection',
    title: '2. 로봇연결 및 실행',
  ),
  ManualEntry(
    id: '3-main-screen',
    title: '3. 메인 화면 설명',
    children: [
      ManualEntry(
        id: '3-1-joystick-control',
        title: '3-1. 조그 컨트롤',
      ),
      ManualEntry(
        id: '3-2-program-view',
        title: '3-2. 프로그램 뷰',
      ),
    ],
  ),
  ManualEntry(
    id: '4-settings-menu',
    title: '4. 설정 메뉴',
    children: [
      ManualEntry(
        id: '4-1-system-settings',
        title: '4-1. 시스템 설정',
      ),
      ManualEntry(
        id: '4-2-utility',
        title: '4-2. 유틸리티',
      ),
      ManualEntry(
        id: '4-3-tcp-settings',
        title: '4-3. TCP 설정',
      ),
      ManualEntry(
        id: '4-4-gripper-settings',
        title: '4-4. 용접기 설정',
      ),
    ],
  ),
  ManualEntry(
    id: '5-expansion-menu',
    title: '5. 확장 메뉴',
    children: [
      ManualEntry(id: '5-1-weaving', title: '5-1. 위빙'),
      ManualEntry(id: '5-2-program-call', title: '5-2. 프로그램 콜'),
      ManualEntry(id: '5-3-shift', title: '5-3. 시프트'),
      ManualEntry(id: '5-4-jump', title: '5-4. 점프'),
      ManualEntry(id: '5-5-da-output', title: '5-5. D/A Output'),
      ManualEntry(id: '5-6-welding-condition', title: '5-6. 용접 조건 일괄적용'),
      ManualEntry(id: '5-7-welding-change', title: '5-7. 용접 중 조건 변경기능'),
      ManualEntry(id: '5-8-appendix', title: '5-8. 부가축'),
    ],
  ),
  ManualEntry(
    id: '6-tools',
    title: '6. Tool',
    children: [
      ManualEntry(id: '6-1-rblog-download', title: '6-1. RB-Log 다운로드'),
      ManualEntry(id: '6-2-io-tester', title: '6-2. I/O 테스터'),
      ManualEntry(id: '6-3-program-scheduler', title: '6-3. 프로그램 스케줄러'),
    ],
  ),
  ManualEntry(
    id: '7-linear-teaching',
    title: '7. 직선 티칭 방법',
  ),
  ManualEntry(
    id: '8-arc-teaching',
    title: '8. 곡선 티칭 방법',
  ),
];
