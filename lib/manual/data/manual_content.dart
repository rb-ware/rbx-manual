import 'package:flutter/widgets.dart';

import '../models/manual_content.dart';
import 'manual_content_en.dart' as en;

// Build-time language selection. Default to Korean.
const String kAppLang = String.fromEnvironment('APP_LANG', defaultValue: 'ko');

// Keep the same symbol name used throughout the app.
const manualSectionContents =
    kAppLang == 'en' ? en.manualSectionContentsEn : manualSectionContentsKo;

// Korean content embedded here as default
const manualSectionContentsKo = <ManualSectionContent>[
  ManualSectionContent(
    entryId: '1-program-main-menu',
    blocks: [
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/rbx-home.png',
        maxWidth: 600,
        caption: 'RB-X 메인 화면',
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(0.7, 0.15)),
          ManualImageMarker(label: '2', alignment: Alignment(-0.25, 0.1)),
          ManualImageMarker(label: '3', alignment: Alignment(-0, -0.97)),
          ManualImageMarker(label: '4', alignment: Alignment(-0.94, 0.14)),
        ],
      ),
      ManualContentBlock.paragraph('RB-X UI 구성은 크게 4가지로 분류됩니다.'),
      ManualContentBlock.bullets([
        '1. Jog Control - 로봇을 직접적으로 컨트롤하는 영역입니다.',
        '2. Program View - 티칭중인 프로그램의 내용을 표시하고 속성을 볼 수 있는 영역입니다.',
        '3. Title & Status Bar - 현재 App의 버전과 FTP 연결을 확인하고, 상태 메시지가 팝업되는 영역입니다. 우측 끝에는 용접기와 모드가 표시됩니다.',
        '4. Left Side Bar Menu - Connect, Setup, Extension, Tool 버튼으로 구성되어 있고, 하단에는 연결된 용접기의 테스트를 위한 가스체크, 인칭, 역인칭 버튼이 있습니다.',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '2-robot-connection',
    blocks: [
      ManualContentBlock.heading('RB-X 초기 연결'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/rbx-setup.png',
        maxWidth: 600,
        caption: 'RB-X 셋업 화면',
        markers: [
          ManualImageMarker(label: '4', alignment: Alignment(-0.76, -0.3)),
          ManualImageMarker(label: '5', alignment: Alignment(-0.025, 0.25)),
          ManualImageMarker(label: '6', alignment: Alignment(-0.025, -0.3)),
          ManualImageMarker(label: '7', alignment: Alignment(-0.025, -0.1)),
        ],
      ),
      ManualContentBlock.paragraph('RB-X 초기 연결 방법입니다.'),
      ManualContentBlock.bullets([
        '1. 태블릿 와이파이와 로봇 제어박스가 동일한 네트워크에 있는지 먼저 확인합니다.',
        '2. RB-X 앱을 실행한 뒤 초기 화면 좌측의 Setup 버튼을 터치합니다.',
        '3. System Setup 버튼을 선택합니다.',
        '4. Select Robot Model을 RB_U로 설정합니다. (현재 판매 버전은 RB_U이며, 다른 버전은 로봇 버전에 맞게 선택)',
        '5. Select Language에서 사용할 언어를 지정합니다.',
        '6. Robot IP에 로봇의 IP 주소를 입력합니다. (기본값 192.168.0.100)',
        '7. Welder Model을 선택합니다. (기본값 Analog)',
        '8. Connect 버튼을 누르면 연결을 시도합니다.',
        '9. 연결이 되지 않는다면 IP와 와이파이 네트워크 설정을 다시 확인 후 재시도합니다.',
        '10. 연결이 완료되면 티칭 가능한 상태가 됩니다.',
      ]),
      ManualContentBlock.note(
          'System Setup 단계는 연결 전 반드시 확인해야 하는 항목입니다. 모델과 언어, IP, 용접기 설정이 모두 정확해야 안정적으로 통신할 수 있습니다.'),
    ],
  ),
  ManualSectionContent(
    entryId: '3-1-joystick-control',
    blocks: [
      ManualContentBlock.annotatedImage('assets/rbx-screens/jog-control.png',
          caption: 'Jog Control 화면', maxWidth: 250),
      ManualContentBlock.paragraph(
        'Jog Control 영역을 통해 직접 버튼을 이용해서 로봇을 컨트롤을 할 수 있습니다.',
      ),
      ManualContentBlock.paragraph(
        '로봇의 메인 커넥터 방향의 반대편에서 로봇과 마주보고 서서 조작시 베이스 좌표계 X, Y, Z와 로봇의 이동 방향이 일치하게 됩니다.',
      ),
      ManualContentBlock.heading('제어 방식'),
      ManualContentBlock.paragraph('Jog Control은 두 가지 방식으로 로봇을 이동시킬 수 있습니다.'),
      ManualContentBlock.heading('1. Smooth'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/rbx-jog-smooth.png',
        caption: 'smooth 모드',
        maxWidth: 300,
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(-1, -0.5)),
        ],
      ),
      ManualContentBlock.bullets([
        '조그 버튼을 누르고 있는 동안 해당 축 방향으로 부드럽게 이동합니다.',
      ]),
      ManualContentBlock.heading('2. Pitch'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/rbx-jog-pitch.png',
        caption: 'pitch 모드',
        maxWidth: 300,
        markers: [
          ManualImageMarker(label: '2', alignment: Alignment(-1, -0.5)),
        ],
      ),
      ManualContentBlock.bullets([
        'Dist. 필드에 이동 거리를 입력하고 조그 버튼을 누르면 입력한 거리(mm)만큼 이동합니다.',
        'Set 버튼을 누르면 3개의 프리셋 값이 순차적으로 전환됩니다.',
      ]),
      ManualContentBlock.image(
        'assets/rbx-screens/rbx-jog-pitch-set.png',
        caption: 'Pitch 모드 프리셋 설정',
        maxWidth: 250,
      ),
      ManualContentBlock.bullets([
        '프리셋 값을 변경하려면 Set 버튼을 길게 눌러 편집한 뒤 Apply를 눌러 저장합니다.',
      ]),
      ManualContentBlock.heading('3. 좌표계 설정'),
      ManualContentBlock.image(
        'assets/rbx-screens/rbx-jog-smooth.png',
        caption: '좌표계 선택',
        maxWidth: 300,
      ),
      ManualContentBlock.paragraph('3가지 선택 가능한 좌표계 옵션을 지원합니다.'),
      ManualContentBlock.bullets([
        'Base: 좌표계가 로봇의 베이스 기준으로 움직입니다.',
        'TCP: 좌표계가 로봇의 TCP(툴 끝단) 기준으로 움직이며, 사용 전 TCP 세팅이 필요합니다.',
        'Joint: 로봇의 6개 관절을 각각 독립적으로 제어합니다.',
      ]),
      ManualContentBlock.heading('4. 로봇 컨트롤러'),
      ManualContentBlock.image(
        'assets/rbx-screens/rbx-jog-middle.png',
        caption: '로봇 컨트롤러',
        maxWidth: 300,
      ),
      ManualContentBlock.paragraph(
        '로봇이 설치되었다면 로봇 커넥터 연결부의 반대 방향에서 마주보고 컨트롤하면 현재 컨트롤러의 방향대로 움직입니다(Base 좌표계 기준).',
      ),
      ManualContentBlock.paragraph(
        '베이스 기준으로 Z 축은 위·아래, X 축은 좌·우, Y 축은 앞·뒤 방향으로 이동하며 RX, RY, RZ 버튼은 각 축을 기준으로 회전합니다.',
      ),
      ManualContentBlock.heading('5. 조그 컨트롤 하단 버튼'),
      ManualContentBlock.image(
        'assets/rbx-screens/rbx-jog-bottom.png',
        caption: '조그 하단부',
        maxWidth: 300,
      ),
      ManualContentBlock.bullets([
        'Play: 프로그램을 실행합니다.',
        'Stop/Pause: 실행 중에는 Pause로 표시되며 누르면 일시 정지됩니다. 일시 정지 상태에서는 다시 Stop 버튼이 활성화되어 정지시킬 수 있습니다.',
        'Move: 현재 선택된 Move 포인트 위치로 로봇을 이동합니다.',
        'Speed(+/-): 프로그램 실행 속도를 조절합니다.',
        'No_Arc: No_Arc를 활성화하면 용접 아크 없이 로봇 움직임만 실행합니다.',
        'Custom Start: 활성화 후 실행하면 선택된 라인부터 시작합니다.',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '3-2-program-view',
    blocks: [
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/rbx-program-view.png',
        caption: '프로그램 뷰 구성 요소',
        maxWidth: 400,
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(-0.7, -1)),
          ManualImageMarker(label: '2', alignment: Alignment(0.3, -1)),
          ManualImageMarker(label: '3', alignment: Alignment(-0.8, -0.5)),
          ManualImageMarker(label: '4', alignment: Alignment(-0.8, 0.8)),
          ManualImageMarker(label: '5', alignment: Alignment(0.8, 0.8)),
        ],
      ),
      ManualContentBlock.heading('1. Input File Name'),
      ManualContentBlock.paragraph(
        'Program 우측의 흰색 텍스트 필드에 파일명을 입력합니다. 띄어쓰기, 숫자로 시작하는 이름, 언더바를 제외한 특수문자는 사용할 수 없습니다.',
      ),
      ManualContentBlock.heading('2. Open · Save · New 버튼'),
      ManualContentBlock.bullets([
        'Open: 기존에 저장된 파일을 불러옵니다.',
        'Save: 현재 입력한 파일명을 기준으로 작업 내용을 저장합니다.',
        'New: 새로운 프로그램 파일 작성을 시작합니다.',
      ]),
      ManualContentBlock.heading('3. Side Menu Buttons'),
      ManualContentBlock.bullets([
        'Undo: 직전에 수행한 작업을 취소합니다.',
        'Redo: Undo로 취소한 작업을 다시 복원합니다.',
        'Copy: 선택한 항목을 복사합니다.',
        'Paste: 복사 또는 잘라낸 항목을 현재 위치에 붙여 넣습니다.',
        'Cut: 선택한 항목을 잘라냅니다.',
        'Move L: 시작점과 끝점을 잇는 직선 경로로 이동합니다.',
        'Move C: 두 개 이상의 포인트를 기준으로 계산된 곡선을 따라 이동합니다.',
        'Move J: 로봇의 6개 관절 중심으로 가장 효율적인 경로로 이동합니다.',
        'Weld Start: 용접 아크를 시작하는 명령입니다.',
        'Weld End: 용접 아크를 종료하는 명령입니다.',
      ]),
      ManualContentBlock.heading('4. Switch 하위 메뉴'),
      ManualContentBlock.paragraph(
        "사이드 메뉴의 'Switch' 버튼을 누르면 추가 기능 버튼이 나타납니다.",
      ),
      ManualContentBlock.bullets([
        'Delete: 선택한 명령이나 줄을 삭제합니다.',
        'Multi: 초록색으로 활성화되면 여러 명령을 동시에 선택할 수 있습니다.',
        'Skip: 선택된 명령을 비활성화하여 실행을 건너뜁니다. (Move C는 Skip 시 오류가 발생합니다.)',
        'Wait: 설정된 시간 또는 조건이 충족될 때까지 동작을 일시 정지합니다. Time Out은 지정한 시간이 지나면 조건과 관계없이 다음 명령으로 이동합니다.',
        'Memo: 주석이나 메모를 입력해 작업 의도를 남깁니다.',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '4-1-system-settings',
    blocks: [
      ManualContentBlock.heading('System Setup 개요'),
      ManualContentBlock.image(
        'assets/rbx-screens/rbx-setup.png',
        caption: 'System Setup 화면',
        maxWidth: 600,
      ),
      ManualContentBlock.paragraph(
        'System Setup 화면에서 로봇과 애플리케이션의 기본 연결 정보를 설정합니다.',
      ),
      ManualContentBlock.heading('Robot Model'),
      ManualContentBlock.paragraph(
        '로봇과의 연결을 위해 해당 로봇의 모델을 선택합니다. 기본값은 RB_U로 설정되어 있습니다.',
      ),
      ManualContentBlock.heading('Language'),
      ManualContentBlock.paragraph(
        '애플리케이션에서 사용할 언어를 선택합니다. 이 매뉴얼은 English 기준으로 작성되었습니다.',
      ),
      ManualContentBlock.heading('Robot IP'),
      ManualContentBlock.paragraph(
        '연결할 로봇의 IP 주소를 입력합니다. 기본 출고 시 IP는 192.168.0.100으로 설정되어 있습니다.',
      ),
      ManualContentBlock.heading('Welder Model'),
      ManualContentBlock.paragraph(
        '로봇과 통신할 용접기 모델을 선택합니다. 해당 설정은 용접 프로토콜 및 제어 신호 호환을 위해 필수입니다. 기본 출고 시 Analog 모드로 설정되어 있으며, 현재 사용 가능한 모델은 Analog, Kemppi 입니다.',
      ),
      ManualContentBlock.heading('Enable Data Transfer'),
      ManualContentBlock.paragraph(
        '용접데이터 전송기능을 켜거나 끌 수 있습니다. (특정 업체를 위해 추가된 기능이며 일반적으로는 OFF로 설정합니다.)',
      ),
      ManualContentBlock.heading('Mini PC IP'),
      ManualContentBlock.paragraph(
        'Data Transfer 기능 혹은 LASER용접모드를 사용하기 위해 별도의 Mini PC가 필요하고 이 Mini PC의 IP를 설정하는 메뉴입니다. 기본값으로 사용하는 것을 권장합니다. (기본값 192.168.0.210)',
      ),
      ManualContentBlock.heading('Use Digital Channel for Tool Flange'),
      ManualContentBlock.paragraph(
        '구형 로봇의 경우 로봇 툴플렌지 커넥터에 연결이 불가능하여 제어박스의 Din 신호에 연결하여 RB-Ring을 사용하는데 이때 이 기능을 활성화하여 설정된 채널로 사용할 수 있다. (설정 시 기존 툴플렌지 신호 사용은 비활성화된다.)',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '4-2-utility',
    blocks: [
      ManualContentBlock.heading('Utility 화면 개요'),
      ManualContentBlock.image(
        'assets/rbx-screens/rbx-utility.png',
        caption: 'Utility 화면',
        maxWidth: 450,
      ),
      ManualContentBlock.paragraph(
        'Utility 화면에서는 로봇을 기본 자세로 이동하거나 포장 자세로 전환하고, 비상 상황에서 관절을 해제하는 등 보조 기능을 제공합니다.',
      ),
      ManualContentBlock.heading('Basic Posture'),
      ManualContentBlock.paragraph(
        '버튼을 누르고 있는 동안 로봇을 기본 자세로 이동시킵니다.',
      ),
      ManualContentBlock.note(
        '주의: 로봇 주변에 사람이나 장비가 있을 경우 충돌 위험이 있으므로 반드시 주변을 확인한 후 실행하십시오.',
      ),
      ManualContentBlock.heading('Packing Posture'),
      ManualContentBlock.paragraph(
        '버튼을 누르고 있는 동안 로봇을 포장 자세로 움직입니다. RB Series U-Version을 선택한 뒤 사용하는 것을 권장합니다.',
      ),
      ManualContentBlock.note(
        '주의: 로봇 주변에 사람이나 장비가 있을 경우 충돌 위험이 있으므로 반드시 주변을 확인한 후 실행하십시오.',
      ),
      ManualContentBlock.heading('Release Joint'),
      ManualContentBlock.paragraph(
        '로봇의 관절을 해제하여 수동으로 움직일 수 있도록 합니다.',
      ),
      ManualContentBlock.note(
        '주의: 이 기능은 로봇에 이상이 발생했을 경우에만 사용하며, 일반적인 상황에서는 사용하지 마십시오. 반드시 대리점이나 전문 기술지원팀에 문의 후 안내에 따라 조작해야 합니다.',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '4-3-tcp-settings',
    blocks: [
      ManualContentBlock.paragraph(
        'TCP 설정은 로봇 토치의 끝점 위치를 정밀하게 보정해 작업 정확도를 높여주는 과정입니다.',
      ),
      ManualContentBlock.heading('1. Auto (자동 TCP 설정)'),
      ManualContentBlock.image(
        'assets/rbx-screens/rbx-tcpset-auto1.png',
        caption: '자동 TCP 설정 자세 등록',
        maxWidth: 350,
      ),
      ManualContentBlock.paragraph(
        '로봇의 토치 와이어 끝단이 하나의 점에 정확히 닿도록 하는 4가지 자세를 등록하여 자동 TCP 설정을 수행합니다. 각 자세는 서로 충분히 다른 방향을 유지할수록 계산 정확도가 높아집니다.',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/rbx-tcpset-auto2.png',
        caption: '자동 TCP 설정 Activate 단계',
        maxWidth: 420,
      ),
      ManualContentBlock.bullets([
        'Activate를 체크하면 4가지 자세를 Get 할 수 있는 버튼이 활성화됩니다.',
        '직접교시와 컨트롤을 이용해 동일한 한 점을 향하는 4가지 자세를 각각 Get 합니다.',
        '4가지 자세 등록을 모두 완료하면 화면 우측 상단의 Apply 버튼을 눌러 자동 TCP 설정을 실행합니다.',
      ]),
      ManualContentBlock.note(
        '자동 설정이 실패 메시지를 표시하는 경우 각 자세가 충분히 정밀하지 않은 것이므로, 자세를 다시 맞추고 재시도하십시오.',
      ),
      ManualContentBlock.heading('2. Manual (수동 TCP 설정)'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/rbx-tcpset-manual.png',
        caption: '수동 TCP 설정 화면',
        maxWidth: 600,
        markers: [
          ManualImageMarker(label: '2', alignment: Alignment(0.4, -0.85)),
        ],
      ),
      ManualContentBlock.paragraph(
        '수동 TCP 설정은 직접 수동으로 TCP 값과 툴의 물리 정보를 입력해 보정하는 방식입니다.',
      ),
      ManualContentBlock.heading('Payload Settings'),
      ManualContentBlock.paragraph(
        '툴의 무게와 무게중심 위치를 입력합니다. Auto 방식으로 TCP를 설정하더라도 Payload 정보는 별도로 입력해야 합니다.',
      ),
      ManualContentBlock.heading('End Effector Center Position'),
      ManualContentBlock.paragraph(
        '툴의 TCP에 맞는 6축 값을 입력합니다. X, Y, Z 값은 Auto 설정 시 자동으로 채워지지만 RX, RY, RZ 값은 반드시 수동으로 조정해야 합니다.',
      ),
      ManualContentBlock.paragraph(
        '용접 토치 제조사에서 TCP 정보가 제공되는 경우 해당 값을 그대로 입력하고, 제공되지 않는 경우에는 직접 치수를 측정하여 입력해야 합니다.',
      ),
      ManualContentBlock.note(
        '로봇 종류에 따라 각 축의 방향이 다를 수 있으므로 화면 왼쪽의 축 방향 안내를 참고해 올바른 +, - 값을 입력하십시오.',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '4-4-gripper-settings',
    blocks: [
      ManualContentBlock.heading('1. Start'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/rbx-analog-set-start.png',
        caption: 'Analog Welder Start 설정',
        maxWidth: 450,
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(-1, -0.85)),
        ],
      ),
      ManualContentBlock.bullets([
        'Pre Wait (sec): 로봇이 Weld Start 지점에 도달한 후, 아크 발생 전까지 대기하는 시간입니다.',
        'Arc Standby (sec): 로봇이 용접 명령을 내린 후, WCR 신호가 들어올 때까지 기다리는 시간입니다.',
        '지정된 시간이 되어도 WCR 신호를 받지 못한 경우 용접과 프로그램 실행이 중단됩니다.',
        'Post Wait (sec): 아크가 발생된 후, 로봇이 다음 포인트로 출발하기 전 지정된 시간만큼 대기하는 시간입니다.',
        'Speed (mm/s): 용접 진행 속도(mm/s)를 입력합니다.',
        'Volt. Offset (V): 용접 전압(Volt)을 설정하는 두 가지 옵션 중 선택합니다. (Curr Offset, User-defined)',
        'Curr. (A): 설정 전류 값(A)입니다. 용접 강도에 직접적으로 영향을 미치는 항목입니다.',
        'Volt. (V): 설정 전압 값(V)입니다. Curr Offset 선택 시에는 보정 값만 입력하고, User-defined 선택 시에는 실제 출력 전압 값을 직접 입력합니다.',
      ]),
      ManualContentBlock.heading('2. End'),
      ManualContentBlock.image(
        'assets/rbx-screens/rbx-analog-set-end.png',
        caption: 'Analog Welder End 설정',
        maxWidth: 450,
      ),
      ManualContentBlock.bullets([
        'Pre Wait (sec): 로봇이 Weld End 지점에 도달한 후 아크를 종료하기 전에 대기하는 시간입니다.',
        'Volt. Offset (V): 용접 전압(Volt)을 설정하는 두 가지 옵션 중 선택합니다. (Curr Offset, User-defined)',
        'Crater Time (sec): 용접 끝 지점에서 다른 전류와 전압을 사용해 입력한 Crater Time 시간 동안 추가 용접을 진행합니다.',
        'Curr. (A): Crater Time 구간에서 적용할 전류 값입니다.',
        'Volt. (V): Crater Time 구간에서의 전압 값입니다. Curr Offset 선택 시에는 보정 값만 입력하고, User-defined 선택 시에는 실제 출력 전압 값을 직접 입력합니다.',
        'Post Wait (sec): 아크 종료 후 로봇이 다음 동작으로 이동하기 전 대기하는 시간입니다.',
      ]),
      ManualContentBlock.heading('3. Welder'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/rbx-analog-set-welder.png',
        caption: 'Analog Welder 채널 설정',
        maxWidth: 700,
        markers: [
          ManualImageMarker(label: '3', alignment: Alignment(0.5, -0.9)),
        ],
      ),
      ManualContentBlock.bullets([
        'Arc On Ch.: 아크 시작(용접 시작) 신호를 보내는 채널입니다.',
        'Arc Standby Ch.: WCR 신호를 연결하는 채널입니다.',
        'Gas Check Ch.: 가스를 체크하는 수동 조작 채널입니다.',
        'Inching Ch.: 와이어를 전진시키는 수동 조작 채널입니다.',
        'Reverse Inch. Ch.: 와이어를 후퇴시키는 수동 조작 채널입니다.',
      ]),
      ManualContentBlock.bullets([
        'Curr. Signal Range: 전류 신호에 사용되는 아날로그 전압 범위를 지정합니다.',
        'Current Ch.: 사용할 전류 값을 용접기로 보내는 채널을 설정합니다.',
        'Current Range: 사용할 전류 값의 범위를 설정합니다. 지정한 범위에 따라 출력 전압이 자동으로 조정됩니다.',
        'Voltage Ch.: 사용할 전압 값을 용접기로 보내는 채널을 설정합니다.',
        'Voltage Range: 사용할 전압 값의 범위를 설정합니다. 지정한 범위에 따라 출력 전압이 자동으로 조정됩니다.',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '4-6-data-transfer',
    blocks: [
      ManualContentBlock.heading('데이터 전송'),
      ManualContentBlock.paragraph(
        '데이터 전송 기능은 로봇이 진행한 용접 프로그램의 데이터를 특정 서버로 전송하는 기능입니다.',
      ),
      ManualContentBlock.note(
        '데이터를 받는 서버는 제공되지 않으며 고객사에서 별도로 준비해야 합니다.',
      ),
      ManualContentBlock.heading('전송되는 데이터'),
      ManualContentBlock.bullets([
        '문자열 1 (프로그램이 재생 완료되었을 때): complete|A|B|C|D|E|F',
        '문자열 2 (프로그램이 재생 중에 종료되었을 때): stopplay|A|B|C|D|E|F',
      ]),
      ManualContentBlock.bullets([
        'A: 재생한 파일명',
        'B: 프로그램이 재생하는데 소요된 시간(런타임)',
        'C: 프로그램 안에서 용접을 진행한 총 시간(노아크 실행일 경우 no로 표시됨)',
        'D: 용접 구간 안에서 실측 전류값(아날로그 입력 0번)을 0.5초 단위로 수집하여 평균낸 값 ×100',
        'E: 용접 구간 안에서 실측 전압값(아날로그 입력 1번)을 0.5초 단위로 수집하여 평균낸 값 ×10',
        'F: 프로그램 실행 횟수(파일명과 관계없이 총 실행 횟수를 누적)',
      ]),
      ManualContentBlock.paragraph('예)'),
      ManualContentBlock.bullets([
        'complete|test|0:00:09.581577|6.69388|300.0|20.0|37',
      ]),
      ManualContentBlock.bullets([
        '실행완료여부 | 파일명 | 전체실행시간 | 용접실행시간 | 전류측정값 평균 | 전압측정값 평균 | 총 실행횟수',
      ]),
      ManualContentBlock.heading('데이터 전송 기능 설정'),
      ManualContentBlock.image(
        'assets/rbx-screens/systemset-data-transfer.png',
        caption: 'System Setup - Enable Data Transfer',
        maxWidth: 600,
      ),
      ManualContentBlock.bullets([
        '1. 이 기능은 Analog 모드에서만 지원됩니다.',
        '2. 설정 > 시스템 설정에서 아래쪽의 Enable Data Transfer 기능을 On 해주세요.',
        '3. 데이터 전송 역할을 담당하는 Mini PC IP 기본값은 192.168.0.210이며, 제공되는 Mini PC도 동일하게 IP가 세팅되어 출고됩니다.',
        '4. 데이터를 받는 서버는 제공되지 않으며 고객사에서 직접 준비해야 합니다. IP 192.168.0.14, Port 9999를 사용하여 UDP 소켓 서버로 수신해야 합니다.',
        '5. 네트워크는 192.168.0.x00x 대역을 사용해야 합니다.',
      ]),
      ManualContentBlock.heading('데이터 전송 기능 실행'),
      ManualContentBlock.image(
        'assets/rbx-screens/data-transfer-execute.png',
        caption: '데이터 전송 실행 예시',
        maxWidth: 400,
      ),
      ManualContentBlock.bullets([
        '1. 데이터 전송 기능이 설정되어 있다면 용접 프로그램을 실행만 하면 자동으로 데이터가 전송됩니다.',
        '2. 데이터를 전송하는 시점은 프로그램이 종료되는 시점이며, 위의 이미지와 같은 데이터를 UDP 소켓 서버로 전송합니다. (이미지의 IP는 테스트용이며 실제로는 192.168.0.14를 사용합니다.)',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '5-1-weaving',
    blocks: [
      ManualContentBlock.paragraph(
        '용접 시 로봇 토치가 좌우 또는 상하로 반복적으로 흔들리며 이동해 용접 비드를 균일하게 형성하는 동작입니다.',
      ),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/rbx-weaving.png',
        caption: 'Weaving 설정 화면',
        maxWidth: 520,
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(-0.62, -1.03)),
          ManualImageMarker(label: '2', alignment: Alignment(-0.45, -0.2)),
          ManualImageMarker(label: '3', alignment: Alignment(-1, 0.05)),
          ManualImageMarker(label: '4', alignment: Alignment(-1, 0.55)),
        ],
      ),
      ManualContentBlock.bullets([
        '1. Weaving Shape: 위빙의 모양을 설정합니다. 지원 형태는 Trapezoidal, Sine Wave, Triangle, C-Wave, Circle 입니다.',
        '2. Range(Line Number) 설정: 선택한 위빙을 적용할 프로그램 라인 번호 구간을 지정합니다. 지정 시 구간 앞에는 Weaving Start, 뒤에는 Weaving End 명령이 자동으로 추가됩니다.',
        '3. 위빙 파라미터 입력: 화면 상단 그림의 각 파라미터 설명을 참고해 L1~Swing 항목 값을 입력합니다.',
        '4. Set-Point1 / Set-Point2 설정: 로봇을 원하는 위치로 이동한 뒤 [Get] 버튼으로 좌표를 등록합니다. 좌표 확인이 필요하면 [Move] 버튼을 길게 눌러 해당 위치로 이동하고, [Swap] 버튼을 누르면 두 좌표가 서로 바뀝니다.',
        '5. Apply: 설정을 확인한 뒤 화면 우측 상단 Apply 버튼을 눌러 적용을 완료합니다.',
      ]),
      ManualContentBlock.note(
        '주의: 위빙 기능은 반드시 용접 구간 내에 위치해야 올바르게 동작합니다.',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '5-2-program-call',
    blocks: [
      ManualContentBlock.paragraph(
        '기존에 저장된 프로그램을 현재 스텝의 하위 프로그램으로 불러오는 기능입니다.\n(이 명령은 현재 등록만 가능하고 수정은 불가능합니다.)',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '5-3-shift',
    blocks: [
      ManualContentBlock.paragraph(
        'Shift는 등록된 위치 좌표(포인트)를 일괄적으로 이동(보정)하는 기능입니다.',
      ),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/rbx-shift.png',
        caption: 'Shift 설정 화면',
        maxWidth: 500,
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(-1, -1.07)),
          ManualImageMarker(label: '2', alignment: Alignment(-0.98, -0.5)),
          ManualImageMarker(label: '3', alignment: Alignment(-0.98, 0.05)),
        ],
      ),
      ManualContentBlock.paragraph('아래는 사용법입니다.'),
      ManualContentBlock.bullets([
        '1. Range: Start 포인트와 End 포인트를 지정해 Shift를 적용할 라인 범위를 선택합니다.',
        '2. Shift Dist.: X, Y, Z 방향으로 이동시킬 거리를 직접 입력합니다.',
        '3. Base / Move Point: 거리를 계산하기 어렵다면 Base Point(현재 위치)와 Move Point(목표 위치)를 각각 [Get] 버튼으로 등록하고 [Calc] 버튼을 눌러 Shift Dist. 값을 자동으로 계산합니다.',
        '4. Shift Dist. 값이 준비되면 화면 우측 상단 Apply 버튼을 눌러 적용합니다.',
        '5. Insert: 계산된 Shift 값을 새로운 포인트로 생성해 기존 스텝을 유지한 채 보정된 위치를 새로운 스텝으로 추가합니다.',
        '6. Modify: 기존 스텝에 Shift 값을 덮어써서 바로 적용합니다.',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '5-4-jump',
    blocks: [
      ManualContentBlock.paragraph(
        'Jump는 프로그램 흐름을 특정 라인(Line) 또는 레이블(Label)로 건너뛰는 제어 명령어입니다. 반복 구조를 구현할 때 활용할 수 있습니다.',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/rbx-jump.png',
        caption: 'Jump 명령 설정',
        maxWidth: 260,
      ),
      ManualContentBlock.paragraph(
        'Jump 명령으로 반복을 구성하려면 Here 주소와 To 주소를 반복 범위의 상·하단에 배치합니다.',
      ),
      ManualContentBlock.bullets([
        'Here 주소: 반복을 시작할 최상단 라인에 배치합니다.',
        'To 주소: 반복을 종료할 최하단 라인에 배치합니다.',
      ]),
      ManualContentBlock.note(
        '점프문이 포함된 프로그램에서 사용자 지정 시작을 사용하는 경우, 시작 라인 위치에 따라 점프가 동작하지 않을 수 있습니다.',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '5-5-da-output',
    blocks: [
      ManualContentBlock.paragraph(
        'D/A Output은 아날로그 아웃풋 신호와 디지털 아웃풋 신호를 스텝에 추가할 수 있는 기능입니다.',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/extension-da-output.png',
        caption: 'D/A Output 설정 화면',
        maxWidth: 380,
      ),
      ManualContentBlock.heading('디지털 출력 (Digital Output)'),
      ManualContentBlock.bullets([
        '초록색 버튼 영역을 눌러 신호 상태를 전환합니다. 초록색은 TRUE(출력 ON), 빨간색은 FALSE(출력 OFF)를 의미합니다.',
        '원하는 신호들을 설정한 뒤 [Apply] 버튼을 눌러 적용합니다.',
      ]),
      ManualContentBlock.heading('아날로그 출력 (Analog Output)'),
      ManualContentBlock.bullets([
        '0~10V 범위에서 출력 전압 값을 직접 입력하거나 +/- 버튼으로 조정합니다.',
        '왼쪽에서 사용할 채널(0~3번)을 선택하면 초록색으로 활성화됩니다.',
        '값을 설정한 뒤 [Apply] 버튼을 눌러 완료합니다.',
      ]),
      ManualContentBlock.heading('설정 항목 예시'),
      ManualContentBlock.bullets([
        'Digital Output: 출력 번호와 ON/OFF 상태 선택',
        'Analog Output: 출력 채널과 전압 값(V)',
        'Enter your memo: 등록될 명령에 대한 참고 메모 입력 (선택 사항)',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '5-6-welding-condition',
    blocks: [
      ManualContentBlock.image(
        'assets/rbx-screens/batch-weld-mod.png',
        maxWidth: 600,
        caption: 'Batch Weld Mod 화면',
      ),
      ManualContentBlock.paragraph(
        '이 기능은 프로그램에 등록된 여러 Weld Start와 Weld End 명령의 용접 조건 속성을 한 번에 설정할 수 있도록 해줍니다.',
      ),
      ManualContentBlock.paragraph(
        '적용하려는 범위를 Range로 지정하고, Start 또는 End에 사용할 조건 값을 입력한 뒤 [Apply] 버튼을 누르면 선택된 범위 내의 모든 Weld Start 및 Weld End 명령이 설정한 조건으로 일괄 변경됩니다.',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '5-7-welding-change',
    blocks: [
      ManualContentBlock.paragraph(
        '용접 중 조건 변경 기능은 용접이 진행되는 도중 실시간으로 와이어 송급 속도와 세부 조정 값을 변경할 수 있도록 돕는 도구입니다. (현 버전에서는 Kemppi 용접 모드에서만 동작하며, 추후 업데이트가 예정되어 있습니다.)',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/extension-weld-adjust.png',
        caption: 'Weld-Adjust 설정 화면',
        maxWidth: 520,
      ),
      ManualContentBlock.bullets([
        'Memory Add: 적용할 용접기 메모리 채널 번호를 입력합니다.',
        'Feed Speed (m/min): 와이어 송급 속도를 설정합니다.',
        'Fine Tune: ±10.0 범위에서 용접 전압 값을 미세 조정합니다.',
        'Robot Speed (%): 로봇 속도를 -100 ~ 100% 범위에서 조절합니다.',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '5-8-appendix',
    blocks: [
      ManualContentBlock.paragraph(
        '부가축 기능은 로보티코에서 제공하는 부가축(레일)을 제어하기 위한 메뉴입니다.',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/extension-ext-axis.png',
        caption: '부가축 제어 화면',
        maxWidth: 300,
      ),
      ManualContentBlock.bullets([
        'Mode: 프로그램을 순차적으로 진행하는 Step-by-Step 모드를 설정합니다.',
        'Position: 이동할 목표 위치(mm)를 입력합니다.',
        'Current Position: 부가축의 현재 위치(mm)를 표시합니다.',
        'Speed: 부가축을 이동시킬 속도를 범위 내 값으로 지정합니다.',
        'Get: 현재 위치(Current Position)를 목표 위치(Position)로 복사합니다.',
        'Move: 누르고 있는 동안 목표 위치로 설정한 속도로 이동합니다.',
        'Jog Control: X-/X+ 버튼으로 부가축을 수동 조작하며, 설정된 속도로 이동합니다.',
        'Apply: 현재 입력된 설정을 프로그램 스텝에 추가합니다. 상위 명령이 완료된 뒤 부가축 이동을 수행한 후 하위 명령이 실행됩니다.',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '5-9-multipass',
    blocks: [
      ManualContentBlock.note(
        '주의사항\n이 기능은 현재 개발 중이며 오작동할 수 있습니다. (현재 이 기능만 사용할 수 있습니다.)\n용접 명령과 함께 사용하지 않으면 가속/감속 오류가 발생할 수 있으므로 용접 명령을 함께 삽입하여 확인하는 것이 좋습니다.\n다음 슬라이드에 설명된 방법 외에는 사용하지 않는 것이 좋습니다.',
      ),
      ManualContentBlock.heading('사용방법'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/extension-multipass.png',
        caption: 'Multi Pass setup screen',
        maxWidth: 600,
        markers: [
          ManualImageMarker(label: '3', alignment: Alignment(-0.7, -0.85)),
          ManualImageMarker(label: '4', alignment: Alignment(-1, -0.1)),
          ManualImageMarker(label: '5', alignment: Alignment(-1, 0.4)),
        ],
      ),
      ManualContentBlock.bullets([
        '1. 오른쪽 상단 이미지와 같이 직선 용접을 가르치고, 3점 직선 용접을 가르칩니다.',
        '2. 확장 메뉴 -> 멀티패스를 클릭하여 멀티패스 메뉴로 들어갑니다.',
        '3. 범위(라인 번호)에 적용할 범위를 결정하고 가져오기 버튼(Get)을 클릭합니다. (용접 포인트가 아닌 지점은 범위에 포함되지 않습니다.)',
      ]),
      ManualContentBlock.image(
        'assets/rbx-screens/extension-multipass-pout-example.png',
        maxWidth: 250,
      ),
      ManualContentBlock.bullets([
        '4. 로봇을 원하는 방향으로 움직여 P1 Pass를 기반으로 다중 경로를 만들고 Apply 버튼을 클릭하여 적용합니다. 녹색 점이 표시되면 녹색 선을 통과하고, 빨간색 점이 표시되면 빨간색 선을 통과합니다.',
        '5. Pass 1 항목에 원하는 길이를 입력합니다. 다중 경로를 추가하려면 녹색 사각형 상자의 버튼( Pass 추가 )을 클릭하여 추가합니다. 예: Y 10, Z 0',
        '6. 모든 작업이 완료되면 화면 스텝에 Multi Pass 스텝이 생성됩니다.',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '6-1-rblog-download',
    blocks: [
      ManualContentBlock.paragraph(
        'RB-Log 다운로드 기능은 로봇 컨트롤 박스에 기록된 로봇 로그를 내려받을 수 있도록 지원합니다.',
      ),
      ManualContentBlock.paragraph(
        '로그 파일은 화면에서 직접 확인할 수 없으며, 안드로이드 기기의 download > rbware > RCR Log 경로에 저장됩니다.',
      ),
      ManualContentBlock.bullets([
        'Get 버튼을 눌러 로그를 다운로드합니다.',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '6-2-io-tester',
    blocks: [
      ManualContentBlock.paragraph(
        'I/O 테스터는 로봇과 연결된 디지털 입출력 신호의 상태를 확인하거나 직접 제어할 수 있는 도구입니다.',
      ),
      ManualContentBlock.paragraph(
        'J/O 테스터를 실행하면 메인 화면 우측의 조그 컨트롤 영역이 I/O 표시 영역으로 전환되어 실시간으로 I/O 상태를 모니터링할 수 있습니다.',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/tool-ioteste-input.png',
        caption: 'I/O 테스터 입력 탭 화면',
        maxWidth: 300,
      ),
      ManualContentBlock.bullets([
        'Input 탭: 외부 센서나 장비에서 들어오는 입력 신호의 상태를 확인합니다.',
        'Output 탭: 로봇에서 외부로 나가는 출력 신호를 직접 ON/OFF로 제어할 수 있습니다.',
      ]),
      ManualContentBlock.image(
        'assets/rbx-screens/tool-iotester-output.png',
        caption: 'I/O 테스터 출력 탭 화면',
        maxWidth: 300,
      ),
      ManualContentBlock.bullets([
        '1. 출력할 채널(예: 2, 3, 4, 5번)을 클릭하면 주황색으로 활성화됩니다.',
        '2. [On] 버튼을 누르면 선택한 출력이 작동합니다.',
        '3. [Off] 버튼을 누르면 모든 채널이 일괄 OFF 됩니다.',
      ]),
      ManualContentBlock.paragraph(
        'Analog Output은 On/Off 제어 외에 0~10V 범위의 출력 전압 값을 직접 설정하여 사용할 수 있습니다.',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '6-3-program-scheduler',
    blocks: [
      ManualContentBlock.paragraph(
        '프로그램 스케줄러는 최대 4개의 WSL 프로그램을 버튼에 등록해두고 버튼 클릭만으로 실행할 수 있도록 돕는 기능입니다.',
      ),
      ManualContentBlock.heading('주요 기능'),
      ManualContentBlock.bullets([
        '최대 4개의 WSL 프로그램을 P1~P4 버튼에 할당할 수 있습니다 (필요 시 1개만 등록해도 됩니다).',
        '외부 스위치를 원하는 채널에 연결하여 실행/예약 버튼으로 활용할 수 있습니다.',
        '정지 중일 때 P1~P4 외부 스위치 버튼을 누르면 해당 프로그램이 즉시 실행됩니다.',
        '실행 중일 때 P1~P4 외부 스위치 버튼을 누르면 해당 프로그램이 예약 상태로 등록됩니다.',
      ]),
      ManualContentBlock.note(
        'P1, P2, P3 버튼을 순서대로 눌러 예약하면 P1이 종료된 뒤 P2, 이어서 P3가 자동으로 실행됩니다.',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/tool-scheduler-button-map.png',
        maxWidth: 400,
      ),
      ManualContentBlock.paragraph(
        'LED Ch.을 설정하면 Dout신호에 LED를 연결하여 P1-P4프로그램의 실행 및 예약 상태를 LED로 표시할 수 있습니다(실행중- 점멸, 예약중-점등)',
      ),
      ManualContentBlock.heading('사용 방법'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/tool-scheduler.png',
        caption: '프로그램 스케줄러 화면',
        maxWidth: 600,
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(0.65, -0.65)),
          ManualImageMarker(label: '2', alignment: Alignment(0.7, 0.7)),
          ManualImageMarker(label: '3', alignment: Alignment(-0.25, 0.9)),
        ],
      ),
      ManualContentBlock.bullets([
        '1. [Load] 버튼을 눌러 실행할 WSL 파일을 최대 4개까지 등록합니다.',
        '2. [Configuration Buttons]를 눌러 외부 스위치를 원하는 채널에 할당합니다.',
        '3. 화면 하단의 빨간색 [Upload and Start] 버튼을 눌러 설정을 적용하고 실행을 준비합니다.',
      ]),
      ManualContentBlock.paragraph(
        '이후 외부 스위치 버튼을 눌러 연결된 I/O Din 신호가 들어오면 등록된 프로그램이 순차적으로 실행 또는 예약되며, 일시정지 버튼으로 실행을 일시정지하거나 재개할 수 있습니다.',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '7-linear-teaching',
    blocks: [
      ManualContentBlock.heading('Move L - 직선 이동 명령의 동작 방식'),
      ManualContentBlock.paragraph(
        'Move L 명령은 직선 경로로 목표 지점까지 이동하는 명령이며, 두 개 이상 연속으로 등록했을 때 해당 포인트가 용접 구간(Weld Section)에 속하는지 여부에 따라 로봇의 움직임 특성이 달라집니다.\n',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/movel_steps_outofarc.png',
        caption: 'Move L 명령이 용접구간 밖에서 연속될 때의 경로',
        maxWidth: 520,
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/movel_outof_arc.png',
        // caption: '일반 이동 구간에서의 Move L 실행 화면',
      ),
      ManualContentBlock.paragraph(
        '용접 구간이 아닌 일반 이동 구간에서는 각 포인트에 정확히 도착해 잠시 정지한 후 다음 위치로 이동합니다. 따라서 경유 지점마다 순간적으로 멈췄다가 다시 출발하게 되며, 일반 티칭용 경유점이나 이동 안전 확보 목적에 적합합니다.\n\n',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/movel_steps_inarc.png',
        caption: 'Move L 명령이 용접구간 내에서 연속될 때의 경로',
        maxWidth: 520,
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/movel_in_arc.png',
        // caption: '용접구간에서의 Move L 실행 화면',
      ),
      ManualContentBlock.paragraph(
        '용접 구간(Weld Section) 내에서는 포인트 사이를 일정한 속도로 부드럽게 연속 이동하며 자동 블렌딩(blending)이 적용됩니다. 중간 포인트는 경유만 하고 정지하지 않으므로, 용접 비드를 균일하게 유지하면서 매끄러운 움직임을 제공합니다.',
      ),
      ManualContentBlock.note(
        '용접구간 중 특정 포인트에서 잠시 정지해야 한다면 해당 포인트 바로 아래에 Wait 0.1 등 짧은 대기 명령을 추가해 일시 정지를 구현할 수 있습니다.',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '8-arc-teaching',
    blocks: [
      ManualContentBlock.heading('Move C - 곡선 이동 명령의 동작 방식'),
      ManualContentBlock.paragraph(
        'Move C 명령은 두 점 사이를 원호 형태로 연결하는 곡선 이동 명령이며, 안정적인 용접을 위해 용접 구간 내부에서만 사용하기를 권장합니다.',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/moveC-example.png',
        caption: 'Move C 곡선 이동 예시',
        maxWidth: 250,
      ),
      ManualContentBlock.heading('사용 방법'),
      ManualContentBlock.bullets([
        '1. 곡선 이동의 시작점은 Move L 명령으로 등록합니다.',
        '2. 곡선 경로를 따라갈 포인트는 모두 Move C 명령으로 등록합니다.',
        '3. Weld Start 명령은 시작점 바로 아래에 삽입합니다.',
        '4. Weld End 명령은 마지막 Move C 명령 바로 아래에 위치시킵니다.',
      ]),
      ManualContentBlock.note(
        '곡선 경로를 구성할 때는 시작점과 끝점을 포함해 최소 4개의 포인트가 필요합니다. 예) L-C-C-C / E E / L-C-C-C-C',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '9-1-welder-kemppi-mig',
    blocks: [
      ManualContentBlock.heading('Kemppi (MIG)'),
      ManualContentBlock.note(
        '주의사항\n\n용접기와 로봇은 동일한 네트워크(주소), 라우터에 연결되어야 합니다.\n캠피 용접기를 사용할 때 연결이 간혹 끊어지는 경우가 발생할 수 있는데 이런 경우에는 캠피 용접기의 전원을 꺼준 후 다시 켜서 부팅된 후 연결하면 다시 연결이 됩니다.',
      ),
      ManualContentBlock.heading('설정방법'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/kemppi-systemset.png',
        maxWidth: 600,
        caption: 'Kemppi 용접기 설정(System Set)',
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(-1, -0.7)),
          ManualImageMarker(label: '2', alignment: Alignment(-0.4, -0.1)),
          ManualImageMarker(label: '2', alignment: Alignment(0.3, -0.1)),
          ManualImageMarker(label: '3', alignment: Alignment(0.55, 0.72)),
        ],
      ),
      ManualContentBlock.bullets([
        '1. Setup -> System Set',
        '2. Welding Type -> MIG, Welder Model -> Kemppi',
        '3. Scroll down -> Apply(적용 버튼을 눌러야만 수정한 내용이 적용됨)',
        '4. Welding Set을 누릅니다.',
        '5. Welding Set 페이지에서 시작 및 끝 페이지를 원하는 값으로 설정합니다.',
      ]),
      ManualContentBlock.heading('Welding Set 설정 방법'),
      ManualContentBlock.bullets([
        '1. Start',
      ]),
      ManualContentBlock.image(
        'assets/rbx-screens/kemppi-welder-start.png',
        maxWidth: 400,
        caption: 'Kemppi Welding Set - Start',
      ),
      ManualContentBlock.bullets([
        'Pre Wait(sec) - 로봇이 용접 시작점에 도착 후 아크 발생시키기 전 대기시간',
        'Arc Stanby(sec) - 아크가 발생할 때까지의 대기 시간(일반적으로 3초로 설정할 것을 권장)',
        'Post Wait(sec) - 아크가 발생한 후에 이 시간만큼 대기 후 로봇이 이동을 시작',
        'Method - 용접 방법을 설정(아래 설명 계속)',
        'Memory - 사용하려는 용접기 메모리 채널을 입력',
        'Feed Speed(m/min) - 용접기의 와이어 송급 속도를 입력',
        'Volt.(V) - 용접 전압 값을 설정',
        'Robot Speed(mm/s) - 용접 섹션에서 로봇 속도를 설정',
        'dynamics - 용접 아크 응답을 제어(높음 = 더 빠름, 더 낮음 = 더 부드러움).',
      ]),
      ManualContentBlock.heading('Method(용접 방법)'),
      ManualContentBlock.paragraph(
        'Kemppi 용접기 용접명령에는 세 가지 방법이 있습니다.',
      ),
      ManualContentBlock.heading('1. Mem w/ Adj.'),
      ManualContentBlock.image(
        'assets/rbx-screens/kemppi-mem-w-adj.png',
        maxWidth: 300,
      ),
      ManualContentBlock.paragraph(
        '메모리에 저장된 조건을 기본으로 하며 Fine tune, Feed Speed, Dynamic 등의 값을 조절할 수 있음',
      ),
      ManualContentBlock.heading('2. Mem w/o Adj.'),
      ManualContentBlock.image(
        'assets/rbx-screens/kemppi-mem-wo-adj.png',
        maxWidth: 300,
      ),
      ManualContentBlock.paragraph(
        '메모리에 저장된 조건대로만 사용하며 Robot Speed 외의 값은 UI에서 조절할 수 없음',
      ),
      ManualContentBlock.heading('3. Manual'),
      ManualContentBlock.image(
        'assets/rbx-screens/kemppi-manual.png',
        maxWidth: 300,
      ),
      ManualContentBlock.paragraph(
        '사용자가 직접 모든 값을 입력하여 설정',
      ),
      ManualContentBlock.bullets([
        '2. End',
      ]),
      ManualContentBlock.image(
        'assets/rbx-screens/kemppi-welder-end.png',
        maxWidth: 400,
        caption: 'Kemppi Welding Set - End',
      ),
      ManualContentBlock.bullets([
        'Pre Wait(sec) - 로봇이 용접 중 용접종료 지점에 도착한 후 아크를 종료하기 전에 대기하는 시간',
      ]),
      ManualContentBlock.heading('간단한 직선 용접의 예'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/kemppi-example.png',
        maxWidth: 520,
        caption: '직선 용접 예시(명령 구성)',
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(-1, -1)),
          ManualImageMarker(label: '2', alignment: Alignment(-1, -0.4)),
          ManualImageMarker(label: '3', alignment: Alignment(-1, 0.25)),
          ManualImageMarker(label: '4', alignment: Alignment(-1, 0.9)),
        ],
      ),
      ManualContentBlock.bullets([
        '1. 용접 시작 전 시작점',
        '2. 용접 시작',
        '3. 용접 종료 전 끝점',
        '4. 용접 종료',
      ]),
      ManualContentBlock.note(
        '용접 시작 스탭과 용접 종료 스탭이 한쌍으로 있어야 합니다. 명령이 누락된 경우 오류가 발생합니다.',
      ),
      ManualContentBlock.heading('용접 중 조건변경기능'),
      ManualContentBlock.paragraph(
        '이 기능은 용접이 진행되는 도중에 실시간으로 와이어 송급 속도와 세부 조정 값을 변경할 수 있도록 도와줍니다.',
      ),
      ManualContentBlock.note(
        '(현 버전에서는 Kemppi 용접 모드에서만 동작합니다. 추후 업데이트 예정)',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/kemppi-weld-adjust.png',
        maxWidth: 450,
        caption: 'Weld-Adjust(용접 중 조건 변경)',
      ),
      ManualContentBlock.bullets([
        'Memory Add : 적용할 용접기 메모리 채널 번호',
        'Feed Speed (m/min) : 와이어 송급 속도 설정',
        'Fine Tune : 미세 조정 값 설정으로, ±10.0 범위 내에서 용접 전압 값을 보정',
        'Robot Speed(%) : 로봇의 스피드를 -100 ~ 100(%) 의 비율로 변경',
      ]),
      ManualContentBlock.bullets([
        '예) 기존 스피드가 5mm/s이고 100%인 경우 10mm/s로 변경',
        '예) 기존 스피드가 5mm/s이고 50%인 경우 7.5mm/s로 변경',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '9-2-welder-weco-mig',
    blocks: [
      ManualContentBlock.heading('WECO (MIG)'),
      ManualContentBlock.note(
        '주의사항\n\n1. 이 기능은 현재 개발 중이며 문제를 일으킬 수 있습니다.\n2. 일부 기능이 작동하지 않을 수 있으며, 궁금한 점이 있으면 CS팀에 문의하시기 바랍니다.',
      ),
      ManualContentBlock.heading('설정방법'),
      ManualContentBlock.image(
        'assets/rbx-screens/weco-systemset.png',
        maxWidth: 600,
        caption: 'WECO 용접기 설정(System Set)',
      ),
      ManualContentBlock.bullets([
        '1. 용접기에 연결하려면, MIG 설정, 올바른 로봇 모델(일반적으로 RB_U) 및 용접기 모델을 적절한 유형의 WECO에 적용합니다.\n(용접기, 로봇, 태블릿은 동일한 네트워크 환경에 있어야 합니다. 그리고 192.168.0.X 범위의 IP 주소를 사용해야 합니다.)',
        '2. 설정을 완료했다면 아래로 스크롤하여 Apply(적용) 버튼을 누릅니다.\n(적용 버튼을 누르지 않으면 이전 설정으로 회귀됩니다.)',
      ]),
      ManualContentBlock.heading('Welding Set 설정 방법'),
      ManualContentBlock.image(
        'assets/rbx-screens/weco-welder-start.png',
        maxWidth: 400,
        caption: 'Weco Welding Set - Start',
      ),
      ManualContentBlock.paragraph(
        '3. 다음으로 용접기의 설정을 바꿔줍니다.\nSet -> Welding Set를 누릅니다. 그러면 시작 페이지가 나타납니다. 여기에 표시된 대로 원하는 값으로 설정합니다.',
      ),
      ManualContentBlock.note(
        '주의. Arc Stanby(초)를 수정하는건 권장하지않습니다.',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/weco-welder-jobmode.png',
        maxWidth: 200,
        caption: 'Work Mode - JobMode',
      ),
      ManualContentBlock.paragraph(
        '3-1. None 모드와 달리 JobMode는 용접기에 저장된 값을 검색합니다.\n\n그리고 다른 모드의 경우 공백에 적절한 값을 다음과 같이 넣어야 합니다.\n\n오른쪽 사진에 나와 있습니다. (사진에 표시된 값은 테스트값이므로 권장값은 아닙니다.)\n\n그리고 하단에 doublePulsed, kdeepon 기능은 동시에 사용할 수 없습니다.',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/weco-welder-end.png',
        maxWidth: 400,
        caption: 'Weco Welding Set - End',
      ),
      ManualContentBlock.paragraph(
        '4. 다음은 용접 설정 종료 페이지입니다. 원하는 값을 입력할 수 있습니다.\n\n(용접기 페이지에는 현재 기능이 없습니다.)',
      ),
      ManualContentBlock.heading('직선 용접 예시'),
      ManualContentBlock.image(
        'assets/rbx-screens/weco-example.png',
        maxWidth: 520,
        caption: '직선 용접 예시(명령 구성)',
      ),
      ManualContentBlock.paragraph(
        '5. 설정이 완료되면 직선 용접을 예로 들어 설명해 드리겠습니다.\n직선 용접의 기본 단계입니다. 시작점 -> 용접 시작 -> 끝점 -> 용접 끝\n여기까지 왔다면 Weco 용접기를 사용하는 데 문제가 없습니다.\n(단, 설정을 조정하면서 테스트해야 합니다.)',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '9-3-welder-imt-laser',
    blocks: [
      ManualContentBlock.heading('IMT (Laser)'),
      ManualContentBlock.note(
        '주의사항\n\n용접기와 PC, 로봇은 동일한 네트워크(주소), 공유기에 연결돼야 합니다.\n반드시 IMT 송급기를 사용해야 합니다.\n연결 후 작동확인을 위해 인칭, 역인칭 기능을 2~3회 정도 체크 후 사용할 것을 권장합니다.',
      ),
      ManualContentBlock.heading('설정방법'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/imt-systemset.png',
        maxWidth: 600,
        caption: 'IMT 용접기 설정(System Set)',
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(-0.58, -0.14)),
          ManualImageMarker(label: '2', alignment: Alignment(0.55, -0.14)),
          ManualImageMarker(label: '3', alignment: Alignment(0.82, 0.82)),
        ],
      ),
      ManualContentBlock.bullets([
        '1. Setup -> System Set',
        '2. Welding Type - LASER, Welder Model -> IMT',
        '3. Scroll down Apply(Apply 버튼을 눌러야만 수정한 내용이 적용됨)',
        '4. Welding Set을 누릅니다.',
        '5. Welding Set 페이지에서 시작 및 끝 페이지를 원하는 값으로 설정합니다.',
      ]),
      ManualContentBlock.heading('Welding Set 설정 방법'),
      ManualContentBlock.bullets([
        '1. Start',
      ]),
      ManualContentBlock.image(
        'assets/rbx-screens/imt-welder-start.png',
        maxWidth: 600,
        caption: 'IMT Welding Set - Start',
      ),
      ManualContentBlock.bullets([
        'Use Wire - 와이어 송급의 사용여부를 설정합니다.',
        'Wire Align - 와이어 정렬기능의 사용여부를 설정합니다.',
        'Pre wait (sec) - 아크 발생 전 대기시간입니다.',
        'Laser Power (%) - 레이저 용접 강도를 설정합니다.',
        'Wire Wait (sec) - 레이저가 켜지고 나서 이 시간만큼 대기 후 와이어가 송급됩니다.',
        'Feed Speed (%) - 용접 중에 와이어의 송급속도를 설정합니다.',
        'Post wait (sec) - 아크 및 와이어 송급 시작 후 이 시간만큼 대기 후 로봇이 이동을 시작합니다.',
        'Robot Speed (mm/s) - 용접구간에서의 로봇의 속도를 설정합니다.',
      ]),
      ManualContentBlock.bullets([
        '2. End',
      ]),
      ManualContentBlock.image(
        'assets/rbx-screens/imt-welder-end.png',
        maxWidth: 600,
        caption: 'IMT Welding Set - End',
      ),
      ManualContentBlock.bullets([
        'Pre Wait (sec) - 로봇이 용접종료 지점에 도착한 후 아크를 종료하기 전, 대기하는 시간',
        'Laser Power (%) - 크레이터 구간에서의 레이저 파워를 결정합니다.',
        'Crater Fill (sec) - 크레이터 시간을 설정합니다.',
        'Post wait (sec) - 아크가 꺼지고 이 시간만큼 로봇이 대기후, 다음 스탭을 수행합니다.',
      ]),
      ManualContentBlock.bullets([
        '3. Welder',
      ]),
      ManualContentBlock.image(
        'assets/rbx-screens/imt-welder-welder.png',
        maxWidth: 600,
        caption: 'IMT Welding Set - Welder',
      ),
      ManualContentBlock.bullets([
        'Arc On Ch. - 아크온 신호를 할당합니다. (D.out)',
        'Gas Check Ch. - 가스 신호를 할당합니다. (D.out)',
        'Relay On Ch. - 릴레이 신호를 할당합니다. (D.out)(와이어 정렬기능을 사용할 때 필요한 신호입니다.)',
        'Relay Input Ch. - 릴레이 인풋 신호를 할당합니다. (D.in)(와이어 정렬기능을 사용할 때 필요한 신호입니다.)',
        'Back Speed, Back Time - 역인칭 속도를 설정하고 Back time만큼 역인칭 합니다. (용접 종료시 수행됩니다.)',
        'Fwd Speed, Fwd Time - 인칭 속도를 설정하고 Fwd time만큼 인칭 합니다. (용접 종료시 역인칭 후 수행됩니다.)',
      ]),
      ManualContentBlock.heading('전류/전압 채널 설정'),
      ManualContentBlock.image(
        'assets/rbx-screens/imt-welder-curr-ch.png',
        maxWidth: 420,
        caption: 'Current channel settings',
      ),
      ManualContentBlock.bullets([
        'Curr. Signal Range - 전류값 조절을 위해 사용할 제어박스 출력(A.out) 범위를 설정합니다. (일반적으로 10V를 사용합니다.)',
        'Current Ch. - 전류값 채널을 설정합니다. (A.out)',
        'Current Range - 용접명령에서 사용할 전류값의 범위를 설정합니다.',
        '설정한 범위에 비례하여 0~10V의 전압이 출력됩니다.',
      ]),
      ManualContentBlock.bullets([
        '예) 10V 사용시 범위를 0-100 설정하고 용접명령에 50을 사용하면 5V의 전압이 출력됩니다.',
      ]),
      ManualContentBlock.image(
        'assets/rbx-screens/imt-welder-volt-ch.png',
        maxWidth: 420,
        caption: 'Voltage channel settings',
      ),
      ManualContentBlock.bullets([
        'Volt. Signal Range - 전압값 조절을 위해 사용할 제어박스 출력(A.out) 범위를 설정합니다. (일반적으로 10V를 사용합니다.)',
        'Voltage Ch. - 전압값의 채널을 설정합니다. (A.out)',
        'Voltage Range - 전압값의 범위를 설정합니다.',
        '(위에 설명된 전류값 범위와 동일하게 작동합니다.)',
      ]),
      ManualContentBlock.heading('간단한 직선 용접의 예'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/imt-example.png',
        maxWidth: 520,
        caption: '직선 용접 예시(명령 구성)',
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(-1, -1)),
          ManualImageMarker(label: '2', alignment: Alignment(-1, -0.4)),
          ManualImageMarker(label: '3', alignment: Alignment(-1, 0.25)),
          ManualImageMarker(label: '4', alignment: Alignment(-1, 0.9)),
        ],
      ),
      ManualContentBlock.bullets([
        '1. 용접 시작 전 시작점',
        '2. 용접 시작',
        '3. 용접 종료 전 끝점',
        '4. 용접 종료',
      ]),
      ManualContentBlock.note(
        '용접 시작 스탭과 용접 종료 스탭이 한쌍으로 있어야 합니다. 명령이 누락된 경우 오류가 발생합니다.',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '9-4-welder-maven-laser',
    blocks: [
      ManualContentBlock.heading('Maven (Laser)'),
      ManualContentBlock.note(
        '주의사항\n\n용접기와 PC, 로봇은 동일한 네트워크(주소), 공유기에 연결돼야 합니다.\n반드시 Maven 용접기를 사용해야 하며 송급기는 별도로 제어박스에 연결해서 용접기 설정에서 신호를 할당해야합니다.\n연결 후 작동확인을 위해 가스체크 기능을 2~3회 정도 체크하는 것을 권장합니다.',
      ),
      ManualContentBlock.heading('설정방법'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/maven-systemset.png',
        maxWidth: 600,
        caption: 'Maven 용접기 설정(System Set)',
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(-0.62, -0.14)),
          ManualImageMarker(label: '2', alignment: Alignment(0.5, -0.14)),
          ManualImageMarker(label: '3', alignment: Alignment(0.85, 0.82)),
        ],
      ),
      ManualContentBlock.bullets([
        '1. Setup -> System Set',
        '2. Welding Type -> LASER, Welder Model -> MAVEN',
        '3. Apply(Apply 버튼을 눌러야만 수정한 내용이 적용됨)',
        '4. Welding Set을 누릅니다.',
        '5. Welding Set 페이지에서 시작 및 끝 페이지를 원하는 값으로 설정합니다.',
      ]),
      ManualContentBlock.heading('Welding Set 설정 방법'),
      ManualContentBlock.bullets([
        '1. Start',
      ]),
      ManualContentBlock.image(
        'assets/rbx-screens/maven-welder-start.png',
        maxWidth: 600,
        caption: 'Maven Welding Set - Start',
      ),
      ManualContentBlock.bullets([
        'Use Wire - 와이어 송급의 사용여부를 설정합니다.',
        'Wire Align - 와이어 정렬기능의 사용여부를 설정합니다.',
        'Pre flow (sec) - 아크 발생전 초기가스 분출 시간입니다.',
        'Laser Power (%) - 레이저 용접 강도를 설정합니다.',
        'Wire Wait (sec) - 레이저가 켜지고나서 이시간만큼 대기후 와이어가 송급됩니다.',
        'Feed Speed (%) - 용접 중에 와이어의 송급속도를 결정합니다.',
        'Post flow (sec) - 아크, 와이어가 송급된 후 이 시간만큼 대기후 로봇이 이동을 시작합니다.',
        'Robot Speed (mm/s) - 용접구간에서의 로봇의 속도를 설정합니다.',
      ]),
      ManualContentBlock.bullets([
        '2. End',
      ]),
      ManualContentBlock.image(
        'assets/rbx-screens/maven-welder-end.png',
        maxWidth: 600,
        caption: 'Maven Welding Set - End',
      ),
      ManualContentBlock.bullets([
        'Pre flow (sec) - 로봇이 용접종료 지점에 도착한 후 아크를 종료하기 전, 대기하는 시간',
        'Laser Power (%) - 크레이터를 설정했을때의 레이저 파워를 결정합니다.',
        'Crater Fill (sec) - 크레이터 시간을 설정합니다.',
        'Post flow (sec) - 아크가 꺼지고 이 시간만큼 가스를 분출하며 로봇이 대기후, 다음 스탭을 수행합니다.',
      ]),
      ManualContentBlock.bullets([
        '3. Welder',
      ]),
      ManualContentBlock.image(
        'assets/rbx-screens/maven-welder-welder.png',
        maxWidth: 600,
        caption: 'Maven Welding Set - Welder',
      ),
      ManualContentBlock.bullets([
        'Arc On Ch. - 아크온 신호를 할당합니다. (D.out)',
        'Gas Ch. - 가스 신호를 할당합니다. (D.out)',
        'Inching Ch. - 와이어 인칭 신호를 할당합니다. (D.out)',
        'Reverse Inching Ch. - 와이어 역인칭 신호를 할당합니다. (D.out)',
        'Relay On Ch. - 릴레이 신호를 할당합니다. (D.out)(와이어 정렬기능을 사용할 때 필요한 신호입니다.)',
        'Relay Input Ch. - 릴레이 신호를 할당합니다. (D.out)(와이어 정렬기능을 사용할 때 필요한 신호입니다.)',
        'Auto Feed Ch. - 자동 송급 신호를 할당합니다. (D.out)',
      ]),
      ManualContentBlock.heading('레이저 파워/송급기 채널 설정'),
      ManualContentBlock.image(
        'assets/rbx-screens/maven-welder-laserpowerrange.png',
        maxWidth: 420,
        caption: 'Laser Power range settings',
      ),
      ManualContentBlock.bullets([
        'Laser Power Range - 레이저 파워의 조절을 위해 사용될 제어박스 출력(A.out) 범위를 설정합니다. (일반적으로 10V를 사용합니다.)',
        'Laser Power Ch. - 레이저 파워 채널을 설정합니다. (A.out)',
        'Laser Power Range - 용접명령에서 사용할 레이저 파워의 범위를 설정합니다. 설정한 범위에 비례하여 0~10V의 전압이 출력됩니다.',
        '예) 10V사용시 범위를 0-100 설정하고 용접명령에 50을 사용하면 5V의 전압이 출력됩니다.',
      ]),
      ManualContentBlock.image(
        'assets/rbx-screens/maven-welder-feederspeedrange.png',
        maxWidth: 420,
        caption: 'Feeder speed range settings',
      ),
      ManualContentBlock.bullets([
        'Feeder Speed Range - 송급기 속도 범위를 설정합니다.',
        'Feeder Speed Ch. - 송급기 속도 채널을 설정합니다. (A.out)',
        'Feeder Speed Range - 송급기 속도의 범위를 설정합니다.(위에 설명된 레이저 파워 범위와 동일하게 작동합니다.)',
      ]),
      ManualContentBlock.heading('티칭 방법'),
      ManualContentBlock.heading('간단한 직선용접의 예.'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/maven-example.png',
        maxWidth: 520,
        caption: '직선 용접 예시(명령 구성)',
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(-1, -1)),
          ManualImageMarker(label: '2', alignment: Alignment(-1, -0.4)),
          ManualImageMarker(label: '3', alignment: Alignment(-1, 0.25)),
          ManualImageMarker(label: '4', alignment: Alignment(-1, 0.9)),
        ],
      ),
      ManualContentBlock.bullets([
        '1. 용접 시작 전 시작점',
        '2. 용접 시작',
        '3. 용접 종료 전 끝점',
        '4. 용접 종료',
      ]),
      ManualContentBlock.note(
        '용접 시작 스탭과 용접 종료 스탭이 한쌍으로 있어야 합니다. 명령이 누락된 경우 오류가 발생합니다.',
      ),
    ],
  ),
];
