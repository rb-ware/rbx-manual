import '../models/manual_section.dart';

const manualTocEn = <ManualEntry>[
  ManualEntry(
    id: '1-program-main-menu',
    title: '1. Program buttons and menus (main screen)',
  ),
  ManualEntry(
    id: '2-robot-connection',
    title: '2. Robot connection and execution',
  ),
  ManualEntry(
    id: '3-main-screen',
    title: '3. Main screen description',
    children: [
      ManualEntry(
        id: '3-1-joystick-control',
        title: '3-1. Jog Control',
      ),
      ManualEntry(
        id: '3-2-program-view',
        title: '3-2. Program View',
      ),
    ],
  ),
  ManualEntry(
    id: '4-settings-menu',
    title: '4. Settings menu',
    children: [
      ManualEntry(
        id: '4-1-system-settings',
        title: '4-1. System Settings',
      ),
      ManualEntry(
        id: '4-2-utility',
        title: '4-2. Utilities',
      ),
      ManualEntry(
        id: '4-3-tcp-settings',
        title: '4-3. TCP Settings',
      ),
      ManualEntry(
        id: '4-4-gripper-settings',
        title: '4-4. Setting up the welding machine (Analog Welder)',
      ),
      ManualEntry(
        id: '4-6-data-transfer',
        title: '4-6. Data Transfer',
      ),
    ],
  ),
  ManualEntry(
    id: '5-expansion-menu',
    title: '5. Extension Menu',
    children: [
      ManualEntry(id: '5-1-weaving', title: '5-1. Weaving'),
      ManualEntry(id: '5-2-program-call', title: '5-2. Program Call'),
      ManualEntry(id: '5-3-shift', title: '5-3. Shift'),
      ManualEntry(id: '5-4-jump', title: '5-4. Jump'),
      ManualEntry(id: '5-5-da-output', title: '5-5. D/A Output'),
      ManualEntry(id: '5-6-welding-condition', title: '5-6. Batch Weld Mod'),
      ManualEntry(id: '5-7-welding-change', title: '5-7. Weld Adjust'),
      ManualEntry(id: '5-8-appendix', title: '5-8. Ext. Axis'),
      ManualEntry(id: '5-9-multipass', title: '5-9. Multi Pass'),
    ],
  ),
  ManualEntry(
    id: '6-tools',
    title: '6. Tool',
    children: [
      ManualEntry(id: '6-1-rblog-download', title: '6-1. Download RB-Log'),
      ManualEntry(id: '6-2-io-tester', title: '6-2. I/O Tester'),
      ManualEntry(id: '6-3-program-scheduler', title: '6-3. Program Scheduler'),
    ],
  ),
  ManualEntry(
    id: '7-linear-teaching',
    title: '7. Move L Teaching Method',
  ),
  ManualEntry(
    id: '8-arc-teaching',
    title: '8. Move C Teaching Method',
  ),
  ManualEntry(
    id: '9-welder',
    title: '9. Welder',
    children: [
      ManualEntry(id: '9-1-welder-kemppi-mig', title: '9-1. Kemppi (MIG)'),
      ManualEntry(id: '9-2-welder-weco-mig', title: '9-2. WECO (MIG)'),
      ManualEntry(id: '9-3-welder-imt-laser', title: '9-3. IMT (Laser)'),
      ManualEntry(id: '9-4-welder-maven-laser', title: '9-4. Maven (Laser)'),
    ],
  ),
];
