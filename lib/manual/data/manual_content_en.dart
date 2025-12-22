import '../models/manual_content.dart';
import 'package:flutter/widgets.dart';

// English placeholders; user will fill content later.

// Korean content embedded here as default
const manualSectionContentsEn = <ManualSectionContent>[
  ManualSectionContent(
    entryId: '1-program-main-menu',
    blocks: [
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/rbx-home.png',
        maxWidth: 600,
        caption: 'RB-X main screen',
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(0.7, 0.15)),
          ManualImageMarker(label: '2', alignment: Alignment(-0.25, 0.1)),
          ManualImageMarker(label: '3', alignment: Alignment(-0, -0.97)),
          ManualImageMarker(label: '4', alignment: Alignment(-0.94, 0.14)),
        ],
      ),
      ManualContentBlock.paragraph(
          'The RB-X UI configuration can be broadly categorized into four categories.'),
      ManualContentBlock.bullets([
        '1. jog Control - This is the area where you directly control the robot.​',
        '2. Program View - This is the area where you can see it.',
        '3. Title & Status Bar - Check the current version of the app and the FTP connection',
        '4. Left Side Bar Menu - Left Side bar menu - Connect, Setup, Extension, Tool buttons It is composed. At the bottom is a connected welding machine for testing There are gas check, inching, and reverse inching buttons.',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '2-robot-connection',
    blocks: [
      ManualContentBlock.heading('RB-X initial connection'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/rbx-setup.png',
        maxWidth: 600,
        caption: 'RB-X setup screen',
        markers: [
          ManualImageMarker(label: '4', alignment: Alignment(-0.76, -0.3)),
          ManualImageMarker(label: '5', alignment: Alignment(-0.025, 0.25)),
          ManualImageMarker(label: '6', alignment: Alignment(-0.025, -0.3)),
          ManualImageMarker(label: '7', alignment: Alignment(-0.025, -0.1)),
        ],
      ),
      ManualContentBlock.paragraph('RB-X initial connection method.'),
      ManualContentBlock.bullets([
        '1. First, check whether the tablet Wi-Fi and the robots control box are in the same network environment.',
        '2. If you have checked, turn on the RB-X app.',
        '3. Touch the Setup button on the left side of the initial screen.​',
        '4. Set the Select Robot Model to RB_U.(The robot version currently on sale is the U version, so you can select RB_U.) Except for the U version, you can choose according to the version of the robot.)',
        '5. Select the language you want to use in Select Language.',
        '6. For Robot IP, enter the IP of the robot. (The default setting is 192.168.0.100.)',
        '7. Finally, select the Welder Model.​(The default setting is Analog.)',
        '8. Click the Connect button and the connection will be connected with a connection success message. (If you can\'t connect, check the IP address and Wi-Fi network connection again, set it appropriately, and then connect again.)',
        '9. The connection is complete and you will be in a teachable state.',
      ]),
      ManualContentBlock.note(
          'The System Setup step must be checked before connecting. The model, language, IP, and welder settings must all be correct for stable communication.'),
    ],
  ),
  ManualSectionContent(
    entryId: '3-1-joystick-control',
    blocks: [
      ManualContentBlock.annotatedImage('assets/rbx-screens/jog-control.png',
          caption: 'Jog Control screen', maxWidth: 250),
      ManualContentBlock.paragraph(
        'You can control the robot directly using buttons through the Jog Control area.',
      ),
      ManualContentBlock.paragraph(
        'When standing facing the robot on the opposite side of the robot\'s main connector direction, the base coordinate system X, Y, and Z and the robot\'s direction of movement will match.',
      ),
      ManualContentBlock.heading('Control Method'),
      ManualContentBlock.paragraph(
          'The control method is separated into two types.'),
      ManualContentBlock.heading('1. Smooth'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/rbx-jog-smooth.png',
        caption: 'smooth mode',
        maxWidth: 300,
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(-1, -0.5)),
        ],
      ),
      ManualContentBlock.bullets([
        'When holding down the jog button, the robot moves smoothly in the direction of the corresponding axis.',
      ]),
      ManualContentBlock.heading('2. Pitch'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/rbx-jog-pitch.png',
        caption: 'Pitch mode',
        maxWidth: 300,
        markers: [
          ManualImageMarker(label: '2', alignment: Alignment(-1, -0.5)),
        ],
      ),
      ManualContentBlock.bullets([
        'Dist.. Enter a value for the desired distance and press the jog button to move the robot in that direction by the value (mm) you entered.',
        'Press the Set button to switch between the three preset values and display them',
      ]),
      ManualContentBlock.image(
        'assets/rbx-screens/rbx-jog-pitch-set.png',
        caption: 'Pitch mode preset settings',
        maxWidth: 250,
      ),
      ManualContentBlock.bullets([
        'You can modify the preset settings by pressing and holding the Set button. Enter the value and press Apply to save it.',
      ]),
      ManualContentBlock.heading('3. Coordinate system settings'),
      ManualContentBlock.image(
        'assets/rbx-screens/rbx-jog-smooth.png',
        caption: 'Select coordinate system',
        maxWidth: 300,
      ),
      ManualContentBlock.paragraph(
          'It supports 3 selectable coordinate system options.'),
      ManualContentBlock.bullets([
        'Base: The coordinate system moves based on the robot\'s base.',
        'TCP:  The coordinate system will move based on the robot\'s TCP (End of the Robot Tool) standard.​(You must set up and use TCP before using the TCP coordinate system.)',
        'Joint:  It is a coordinate system that moves each of the six joints of the robot separately.',
      ]),
      ManualContentBlock.heading('4. Robot controller'),
      ManualContentBlock.image(
        'assets/rbx-screens/rbx-jog-middle.png',
        caption: 'Robot controller',
        maxWidth: 300,
      ),
      ManualContentBlock.paragraph(
        'If the robot is installed, it will face the robot connector connection in the opposite direction (see the figure on the right) and move in the direction of the current controller when controlling. (Based on the Base coordinate system)',
      ),
      ManualContentBlock.paragraph(
        'Based on the base, the Z direction is up and down, the X direction is left and right, ​and the Y direction is front and back. It will move in the direction.​The RX, RY, and RZ buttons rotate relative to the X,Y,Z axis, which means each direction.',
      ),
      ManualContentBlock.heading('5. Jog control bottom buttons'),
      ManualContentBlock.image(
        'assets/rbx-screens/rbx-jog-bottom.png',
        caption: 'Jog bottom area',
        maxWidth: 300,
      ),
      ManualContentBlock.bullets([
        'Play: Launch the program.',
        'Stop/Pause: When running, the button switches to [Pause], and when pressed, it pauses. In the pause state, the [Stop] button is activated again to stop it',
        'Move: Moves the robot to the position of the currently selected Move point.',
        'Speed(+/-): Regulates the speed of program execution.',
        'No_Arc: When the No_Arc is activated and executed, only the robot\'s movements are executed, without generating a welding arc. ',
        'Custom Start: When you activate and run Custom Start, it will start with the selected line.',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '3-2-program-view',
    blocks: [
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/rbx-program-view.png',
        caption: 'Program view components',
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
        'Enter the file name in the white text field to the right of Program. Special characters except for spacing, numbers in the first letter, and underbar (_) cannot be used as file names.',
      ),
      ManualContentBlock.heading('2. Open · Save · New buttons'),
      ManualContentBlock.bullets([
        'Open: Import an existing saved file.',
        'Save: Save your work based on the file name you currently entered.',
        'New: Start a new file.',
      ]),
      ManualContentBlock.heading('3. Side Menu Buttons'),
      ManualContentBlock.bullets([
        'Undo: Cancel the action you did just before',
        'Redo: Restore the job you canceled with Undo.',
        'Copy: Copy the selected items.',
        'Paste: Paste the copied or cut item into the current location.',
        'Cut: Cut out the selected item.',
        'Move L: It goes on a straight path past the start and end points. It is used when precise linear movement is required',
        'Move C: Move along a curve calculated based on two or more points. Used for arc or curve movement',
        'Move J: It moves around the robot\'s six joints and takes the path that is most comfortable for the robot',
        'Weld Start: Command to start welding arc.',
        'Weld End: It is an order to terminate the welding arc.',
      ]),
      ManualContentBlock.heading('4. Switch submenu'),
      ManualContentBlock.paragraph(
        "When you click the 'Switch' button at the bottom of the side menu button, the following additional function buttons will appear:.",
      ),
      ManualContentBlock.bullets([
        'Delete: Deletes the selected command or line.',
        'Multi: When this button is activated in green, you can select several commands at the same time.',
        'Skip: Disable the selected command. Use it when you want to skip a specific line without running it. (It is normal for the Move C line to get an error when playing when Skip.)',
        'Wait: Wait for the specified time or condition to be met before resuming the job. Time Out will move to the next command without regard to the condition after the set time.',
        'Memo: You can enter comments or notes. It is used to add explanations to help workers understand.',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '4-1-system-settings',
    blocks: [
      ManualContentBlock.heading('System Setup overview'),
      ManualContentBlock.image(
        'assets/rbx-screens/rbx-setup.png',
        caption: 'System Setup screen',
        maxWidth: 600,
      ),
      ManualContentBlock.paragraph(
        'In the System Setup screen, configure the basic connection information between the robot and the application.',
      ),
      ManualContentBlock.heading('Robot Model'),
      ManualContentBlock.paragraph(
        'Select the model of that robot to connect with it. (Default: Set to RB_U)',
      ),
      ManualContentBlock.heading('Language'),
      ManualContentBlock.paragraph(
        'Select the language you want to use in your application. (This manual is written in English.)',
      ),
      ManualContentBlock.heading('Robot IP'),
      ManualContentBlock.paragraph(
        'Enter the IP address of the robot you want to connect to.​(The default factory IP is set to 192.168.0.100)',
      ),
      ManualContentBlock.heading('Welder Model'),
      ManualContentBlock.paragraph(
        'Select the welding machine model to communicate with the robot. This setup is mandatory for welding protocol and control signal compatibility.',
      ),
      ManualContentBlock.heading('Enable Data Transfer'),
      ManualContentBlock.paragraph(
        'The welding data transfer function can be turned on or off. (It is added for a specific company and is usually set to OFF.)',
      ),
      ManualContentBlock.heading('Mini PC IP'),
      ManualContentBlock.paragraph(
        'A separate Mini PC is required to use the Data Transfer function or LASER welding mode, and this menu sets the IP of the Mini PC. It is recommended to use it as default (192.168.0.210).',
      ),
      ManualContentBlock.heading('Use Digital Channel for Tool Flange'),
      ManualContentBlock.paragraph(
        'For older robots, it is impossible to connect to the robot tool flange connector, so RB-Ring is used by connecting to the Din signal in the control box. This function can be activated and used as the set channel. (The use of the existing tool flange signal is disabled during setup.)',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '4-2-utility',
    blocks: [
      ManualContentBlock.heading('Utility screen overview'),
      ManualContentBlock.image(
        'assets/rbx-screens/rbx-utility.png',
        caption: 'Utility screen',
        maxWidth: 450,
      ),
      ManualContentBlock.paragraph(
        'In the Utility screen, you can move the robot to the basic posture, switch to the packing posture, release joints in emergencies, and use other auxiliary functions.',
      ),
      ManualContentBlock.heading('Basic Posture'),
      ManualContentBlock.paragraph(
        'While holding the button, move the robot into its default position.',
      ),
      ManualContentBlock.note(
        'Caution: If there are people or equipment around the robot, there is a risk of collision.Be sure to check your surroundings before running.',
      ),
      ManualContentBlock.heading('Packing Posture'),
      ManualContentBlock.paragraph(
        'While holding the button, move the robot into a packing position.(We recommend using the RB Series U-Version after selecting it.).)',
      ),
      ManualContentBlock.note(
        ' Caution: If there are people or equipment around the robot, there is a risk of collision.Be sure to check your surroundings before running.',
      ),
      ManualContentBlock.heading('Release Joint'),
      ManualContentBlock.paragraph(
        'Release Joint : Release the robot\'s joints so that it can move manually.',
      ),
      ManualContentBlock.note(
        'Caution: This function should only be used if something goes wrong with the robot, and under normal circumstances Do not use. You must contact your dealer or professional technical support team and follow the instructions to operate.',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '4-3-tcp-settings',
    blocks: [
      ManualContentBlock.paragraph(
        'TCP settings precisely calibrate the robot torch tip position to improve work accuracy.',
      ),
      ManualContentBlock.heading('1. Auto (Set up automatic TCP)'),
      ManualContentBlock.image(
        'assets/rbx-screens/rbx-tcpset-auto1.png',
        caption: 'Register poses for automatic TCP setup',
        maxWidth: 350,
      ),
      ManualContentBlock.paragraph(
        'You can register four postures that allow the robot\'s torch wire end to touch a single point to set up automatic TCP. The more different each pose is, the better.',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/rbx-tcpset-auto2.png',
        caption: 'Automatic TCP setup: Activate step',
        maxWidth: 420,
      ),
      ManualContentBlock.bullets([
        'When you check Activate, you will see a button to get 4 poses.',
        'you can use direct lessons and jog controls to get 4 postures facing a point.',
        'Once all four are completed, press the Apply button in the upper right corner to proceed with the TCP automatic setup.',
      ]),
      ManualContentBlock.note(
        'If you see a success message, it\'s done, and if you see a failure message, it\'s because each of the four priests wasn\'t precise, so you have to try again to get it precise again.',
      ),
      ManualContentBlock.heading('2. Manual (Manual TCP setup)'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/rbx-tcpset-manual.png',
        caption: 'Manual TCP setup screen',
        maxWidth: 600,
        markers: [
          ManualImageMarker(label: '2', alignment: Alignment(0.4, -0.85)),
        ],
      ),
      ManualContentBlock.paragraph(
        'This is a method of manually entering TCP settings.',
      ),
      ManualContentBlock.heading('Payload Settings'),
      ManualContentBlock.paragraph(
        'Payload Settings enters the weight of the tool and the position of the center of gravity. (This value must be entered separately even if TCP is set to Auto.)',
      ),
      ManualContentBlock.heading('End Effector Center Position'),
      ManualContentBlock.paragraph(
        'The End Effector Center Position enters a 6-axis value that matches the tool\'s TCP. (X, Y, and Z values are automatically entered when TCP is set to Auto, but RX, RY, RZ values must be manually adjusted.)',
      ),
      ManualContentBlock.paragraph(
        'If the welding torch manufacturer provides you with this information, you can enter the corresponding value, otherwise you will have to measure and enter the dimensions yourself. ',
      ),
      ManualContentBlock.note(
        'Since the axis direction is different depending on the type of robot, you need to refer to the picture on the left and grasp the information according to the direction of the axis.',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '4-4-gripper-settings',
    blocks: [
      ManualContentBlock.heading('1. Start'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/rbx-analog-set-start.png',
        caption: 'Analog Welder Start settings',
        maxWidth: 450,
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(-1, -0.85)),
        ],
      ),
      ManualContentBlock.bullets([
        'Pre Wait (sec): After the robot reaches the Weld Start point, it waits before the arc occurs.',
        'Arc Standby (sec): After the robot gives a welding command, it waits for the WCR signal to come in.',
        'If the WCR signal is not received by time, welding and program execution will be stopped.',
        'Post Wait (sec): The amount of time the robot waits for a specified amount of time before departing for the next point after an arc occurs.',
        'Speed (mm/s): Enter the welding progress speed (mm/s)',
        'Volt. Offset (V): Enter the welding progress speed (mm/s)',
        'Curr. (A): The set current value (A). These are items that directly affect the weld strength.',
        'Volt. (V): Choose between two options to set the welding voltage (Volt). (Curr Offset, User-defined)',
      ]),
      ManualContentBlock.heading('2. End'),
      ManualContentBlock.image(
        'assets/rbx-screens/rbx-analog-set-end.png',
        caption: 'Analog Welder End settings',
        maxWidth: 450,
      ),
      ManualContentBlock.bullets([
        'Pre Wait (sec): This is the amount of time the robot waits before ending the arc after reaching the Weld End point.',
        'Volt. Offset (V): Choose between two options to set the welding voltage (Volt). (Curr Offset, User-defined)',
        'Crater Time (sec): Proceeds with further welding during the Crater Time time entered using different currents and voltages at the weld end point.',
        'Curr. (A): The current value to be applied in the Crater Time section.',
        'Volt. (V): The voltage value in the Crater Time period. When Curr Offset is selected: only the calibration value is entered, and when User-defined is selected, the actual output voltage value is entered directly.',
        'Post Wait (sec): After the arc ends, the time the robot waits before moving to the next action.',
      ]),
      ManualContentBlock.heading('3. Welder'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/rbx-analog-set-welder.png',
        caption: 'Analog Welder channel settings',
        maxWidth: 700,
        markers: [
          ManualImageMarker(label: '3', alignment: Alignment(0.5, -0.9)),
        ],
      ),
      ManualContentBlock.bullets([
        'Arc On Ch.: It is a channel that sends the arc start (welding start) signal.',
        'Arc Standby Ch.: This is the channel that connects the WCR signal.',
        'Gas Check Ch.: This is a manual operation channel that checks gas.This is a manual operation channel that checks gas.',
        'Inching Ch.: This is a manual manipulation channel that advances the wire',
        'Reverse Inch. Ch.: This is a manual operation channel to retract the wire.',
      ]),
      ManualContentBlock.bullets([
        'Curr. Signal Range: Specifies the range of analog voltages used for the current signal.',
        'Current Ch.: Sets the channel to send the current value to be used to the welder.',
        'Current Range: Sets the range of current values to be used. The output voltage is automatically adjusted according to the set range',
        'Voltage Ch.: Sets the channel to send the voltage value to be used to the welder.',
        'Voltage Range: Sets the range of voltage values to be used. The output voltage is automatically adjusted according to the set range.',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '4-6-data-transfer',
    blocks: [
      ManualContentBlock.heading('Data Transfer'),
      ManualContentBlock.paragraph(
        'The Data Transfer feature sends data of a welding program conducted by a robot to a specific server.​',
      ),
      ManualContentBlock.note(
        'The server receiving the data is not provided and must be prepared separately by the customer.',
      ),
      ManualContentBlock.heading('Transferred data'),
      ManualContentBlock.bullets([
        'String 1 (When the program has finished playing): complete|A|B|C|D|E|F',
        'String 2 (when a program is stopped during playback): stopplay|A|B|C|D|E|F',
      ]),
      ManualContentBlock.bullets([
        'A: File name that was played',
        'B: Program runtime (total elapsed time)',
        'C: Total welding time inside the program (shown as "no" when run with No_Arc)',
        'D: Average measured current inside the welding section (Analog input 0), sampled every 0.5 s, averaged, then ×100',
        'E: Average measured voltage inside the welding section (Analog input 1), sampled every 0.5 s, averaged, then ×10',
        'F: Total program run count (accumulated count, independent of file name)',
      ]),
      ManualContentBlock.paragraph('Example'),
      ManualContentBlock.bullets([
        'complete|test|0:00:09.581577|6.69388|300.0|20.0|37',
      ]),
      ManualContentBlock.bullets([
        'Completion status | File name | Total runtime | Welding time | Avg. current | Avg. voltage | Total run count',
      ]),
      ManualContentBlock.heading('Data Transfer setup'),
      ManualContentBlock.image(
        'assets/rbx-screens/systemset-data-transfer.png',
        caption: 'System Setup - Enable Data Transfer',
        maxWidth: 600,
      ),
      ManualContentBlock.bullets([
        '1. This feature is supported only in Analog mode.',
        '2. Go to Settings > System Settings, then turn on Enable Data Transfer near the bottom.',
        '3. The default IP of the Mini PC that handles data transfer is 192.168.0.210. The provided Mini PC is shipped with the same IP setting.',
        '4. The receiving server is not provided. The customer must prepare a UDP socket server to receive the data using IP 192.168.0.14 and port 9999.',
        '5. The network must use the 192.168.0.x00x address range.',
      ]),
      ManualContentBlock.heading('Data Transfer execution'),
      ManualContentBlock.image(
        'assets/rbx-screens/data-transfer-execute.png',
        caption: 'Data Transfer execution example',
        maxWidth: 400,
      ),
      ManualContentBlock.bullets([
        '1. If Data Transfer is enabled, data is automatically sent just by running a welding program.',
        '2. Data is sent when the program ends, and the string shown in the image is transmitted to the UDP socket server. (The IP shown in the image is for testing; in actual use, 192.168.0.14 is used.)',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '5-1-weaving',
    blocks: [
      ManualContentBlock.paragraph(
        'It refers to the action of the robot\'s torch repeatedly shaking left and right or up and down during welding.',
      ),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/rbx-weaving.png',
        caption: 'Weaving settings screen',
        maxWidth: 520,
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(-0.62, -1.03)),
          ManualImageMarker(label: '2', alignment: Alignment(-0.45, -0.2)),
          ManualImageMarker(label: '3', alignment: Alignment(-1, 0.05)),
          ManualImageMarker(label: '4', alignment: Alignment(-1, 0.55)),
        ],
      ),
      ManualContentBlock.bullets([
        '1. Weaving Shape: Set the shape of the weaving.(Support Mode : Trapezoidal, Sine Wave, Triangle, C-Wave, Circle',
        '2. Set Range (specify Line Number): Sets the line number interval to which the selected weaving will be applied. (The Weaving1 Start command is registered before the selected section and the Weaving1 End command is registered after the selected section.)',
        '3. Enter Weaving Parameter: Enter the values of L1 ~ Swing items, referring to the description of each parameter in the figure above.',
        '4. Set Set-Point1 / Set-Point2: After moving the robot to the desired location, press the [Get] button to register the coordinates. \nIf you want to check the coordinates, you can press and hold the [Move] button to move to that location. Pressing the Swap button will swap the positions of Set-Point1 and Set-Point2.',
        '5. Apply: Finally, after confirming, press Apply in the top right corner to complete the application',
      ]),
      ManualContentBlock.note(
        'Caution : The weaving function must be located in the welding section to operate correctly.',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '5-2-program-call',
    blocks: [
      ManualContentBlock.paragraph(
        'This function loads an existing saved program as a subprogram of the current step.\n(This order is currently only available for registration and cannot be modified.)',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '5-3-shift',
    blocks: [
      ManualContentBlock.paragraph(
        'This is a function that moves (corrects) the registered location coordinates (points) in batches. Below is the usage.',
      ),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/rbx-shift.png',
        caption: 'Shift settings screen',
        maxWidth: 500,
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(-1, -1.07)),
          ManualImageMarker(label: '2', alignment: Alignment(-0.98, -0.5)),
          ManualImageMarker(label: '3', alignment: Alignment(-0.98, 0.05)),
        ],
      ),
      ManualContentBlock.paragraph('How to use:'),
      ManualContentBlock.bullets([
        '1. Range: Specify the Start and End points to select the line range to which you want to apply the Shift.',
        '2. Shift Dist.: Directly enter the distance you want to move in the X, Y, and Z directions.',
        '3. Base / Move Point: Use it if it is difficult to calculate the distance yourself. Position the current location = Base Point, the target location you want to move = Move Point, and press the [Get] button to register the location. When you press the Shift Dist. button, the value is automatically calculated & entered.',
        '4. When the value is entered in Shift Dist., press the Apply button in the upper right corner to apply it.',
        '5. Insert: Create the calculated Shift value as a new point, leaving the existing staff as it is,Add the calibrated position as a new tab.',
        '6. Modify: Overwrites the Shift value on the existing staff and applies it.',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '5-4-jump',
    blocks: [
      ManualContentBlock.paragraph(
        'A control command that skips the flow of a program to a specific line or label.\n(It can be used for implementing iterative structures.)',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/rbx-jump.png',
        caption: 'Jump command setup',
        maxWidth: 260,
      ),
      ManualContentBlock.paragraph(
        'To implement an iteration using a Jump command, you can set the Here and To addresses at the top and bottom of the range you want to repeat.',
      ),
      ManualContentBlock.bullets([
        'Here address: Position it on the top line where you want to start the iteration.',
        'To address: Position it on the bottom line to end the loop.',
      ]),
      ManualContentBlock.note(
        'However, if you use a custom start in a program that contains a jump statement, the jump statement may not work depending on where the start line is.',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '5-5-da-output',
    blocks: [
      ManualContentBlock.paragraph(
        'Analog output signals and digital output signals are added to the step.',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/extension-da-output.png',
        caption: 'D/A Output setup screen',
        maxWidth: 380,
      ),
      ManualContentBlock.heading('Digital Output'),
      ManualContentBlock.bullets([
        'You can click on the green button area to switch the signal state.',
        'Green -> TRUE (Output ON)',
        'Red -> FALSE (Output OFF)',
        'Set the desired signals and press the [Apply] button to apply them.',
      ]),
      ManualContentBlock.heading('Analog Output'),
      ManualContentBlock.bullets([
        'Regulates the analog output voltage value (0~10V). Input the value to be output directly on the right side or adjust it with the +/- button.',
        'Select the channel you want to use (0~3) on the left and it will activate in green.',
        'After setting, press the [Apply] button to finish.',
      ]),
      ManualContentBlock.heading('Example'),
      ManualContentBlock.bullets([
        'Digital Output: Select output number and ON/OFF',
        'Analog Output: Output channel and voltage value (V)',
        'Enter your memo: Enter the note you want to refer to in the command to be registered. (You do not need to enter it.)',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '5-6-welding-condition',
    blocks: [
      ManualContentBlock.image(
        'assets/rbx-screens/batch-weld-mod.png',
        maxWidth: 600,
        caption: 'Batch Weld Mod Screen',
      ),
      ManualContentBlock.paragraph(
        'This function allows you to set the weld condition properties of multiple Weld Start and Weld End commands in the program at once.',
      ),
      ManualContentBlock.paragraph(
        'If you specify a Range, enter the set value of Start or End, and press the [Apply] button, all the property values of the Weld Start and Weld End commands in that range will be applied to the set conditions.',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '5-7-welding-change',
    blocks: [
      ManualContentBlock.paragraph(
        'This feature helps to change the wire feed rate and fine-tuning values in real-time during the welding process.\n(In the current version, it only works in Kemppi welding mode. Will be updated later.)',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/extension-weld-adjust.png',
        caption: 'Weld-Adjust setup screen',
        maxWidth: 520,
      ),
      ManualContentBlock.bullets([
        'Memory Add: Enter the welding machine memory channel number to which you want to apply.',
        'Feed Speed (m/min): Wire feed rate setting.',
        'Fine Tune: With the fine-tuned value setting, the welding voltage value is calibrated within the range of ±10.0.',
        'Robot Speed (%): Change the speed of the robot at a rate of -100 ~ 100 (%).',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '5-8-appendix',
    blocks: [
      ManualContentBlock.paragraph(
        'This feature uses the side cattle (rails) provided by Robotico.',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/extension-ext-axis.png',
        caption: 'Auxiliary axis control screen',
        maxWidth: 300,
      ),
      ManualContentBlock.bullets([
        'Mode: There is currently only one mode (Step-by-Step).',
        'Position: Enter the position value (mm) of the target auxiliary axle (rail).',
        'Current Position: Displays the actual position value (mm) of the auxiliary livestock (rail). If you do not receive information because it is not connected to the auxiliary axle (rail), a red exclamation mark will appear as shown on the right.',
        'Speed: The speed at which the auxiliary livestock (rail) will be moved. Enter the required speed value within the range.',
        'Get: When this button is pressed, the position of the current axis (rail) (the value of the Current Position) is applied to the target position (the value of the Position) to be moved.',
        'Move: Holding this button will move you to the Speed you set to the target position (the value of Position).',
        'Jog Control: By holding down the X-, X+ buttons, you can manually operate the auxiliary axle (rail) in both directions. Move to the speed of the Speed value you set.',
        'Apply: Pressing this button adds the Move Rail command to the program tab. When a command is added, the parent command is completed, and the sub-command is executed after the sub-command (rail) is moved.',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '5-9-multipass',
    blocks: [
      ManualContentBlock.note(
        'Precautions\nThis feature is currently being developed and may malfunction.\nCurrently, only straight welding is possible when using this feature.\nWe recommend inserting the welding command together to check, as acceleration/deceleration errors may occur if it is not used with the welding command.\nIt is not recommended to use it in any way other than the one described in the following slides.',
      ),
      ManualContentBlock.heading('How to use'),
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
        '1. Teach the straight welding and the three-point straight welding as shown in the upper right image.',
        '2. Click Extension menu -> Multi Pass to enter the Multi Pass menu.',
        '3. Determine the range to apply to the Range (Line Number) and click the Get button. (Non-welding points are not included in the scope.)',
      ]),
      ManualContentBlock.image(
        'assets/rbx-screens/extension-multipass-pout-example.png',
        maxWidth: 250,
      ),
      ManualContentBlock.bullets([
        '4. Move the robot in the desired direction to create a multipath based on the P1 pass, and click the Apply button to apply it. If you get a green dot, you go through the green line; if you get a red dot, you go through the red line.',
        '5. Enter the desired length in the Pass 1 entry. To add a multipath, click the button in the green square box to add it. Example: Y 10, Z 0.',
        '6. After all operations are completed, a Multi Pass step is created on the screen.',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '6-1-rblog-download',
    blocks: [
      ManualContentBlock.paragraph(
        'This is a function that allows you to download the log of the robot recorded in the robot control box.',
      ),
      ManualContentBlock.paragraph(
        'Logs cannot be viewed directly on the screen, but are stored within the Downloads folder > RCR_Log folder of the tablet.',
      ),
      ManualContentBlock.bullets([
        'Press the Get button to download it.',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '6-2-io-tester',
    blocks: [
      ManualContentBlock.paragraph(
        'It is a function that allows you to check or control the status of the digital input and output signals connected to the robot.',
      ),
      ManualContentBlock.paragraph(
        'When the I/O tester is run, the jog control area on the right side of the main screen switches to the I/O display area.',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/tool-ioteste-input.png',
        caption: 'I/O tester input tab screen',
        maxWidth: 300,
      ),
      ManualContentBlock.bullets([
        'Input tab: Check the status of incoming input signals from external sensors or equipment.',
        'Output tab: Direct ON/OFF control of the output signal from the robot to the outside.',
      ]),
      ManualContentBlock.image(
        'assets/rbx-screens/tool-iotester-output.png',
        caption: 'I/O tester output tab screen',
        maxWidth: 300,
      ),
      ManualContentBlock.bullets([
        'How to use the Output Tester',
        '1. Click on the channel you want to output (e.g. 2, 3, 4, 5) to activate it in orange.',
        '2. Press the [On] button and that output will work.',
        '3. When you press the [Off] button, all channels will be turned off in batches.',
      ]),
      ManualContentBlock.paragraph(
        'Analog Output uses an additional output voltage value of 0~10V in addition to On/Off.',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '6-3-program-scheduler',
    blocks: [
      ManualContentBlock.paragraph(
        'Program Scheduler is a function that allows you to register up to 4 WSL programs on a button and run them with the click of a button.',
      ),
      ManualContentBlock.heading('Key features'),
      ManualContentBlock.bullets([
        'Assign up to 4 WSL programs to P1~P4 (only 1 is required).',
        'Assign an external switch to the desired channel and use it as a run/schedule button.',
        'Press the P1~P4 external switch button when stationary to execute the program.',
        'Press the P1~P4 external switch button while running to schedule the program.',
      ]),
      ManualContentBlock.note(
        'If you press the buttons P1 -> P2 -> P3 in order, P2 will run automatically after P1 ends, and P3 after P2 ends.',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/tool-scheduler-button-map.png',
        maxWidth: 400,
      ),
      ManualContentBlock.paragraph(
        'When LED Ch. is set, LED can be connected to the Dout signal to display the execution and reservation status of the P1-P4 program with LED (running-blinking, scheduling-on, etc.)',
      ),
      ManualContentBlock.heading('How to use'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/tool-scheduler.png',
        caption: 'Program Scheduler screen',
        maxWidth: 600,
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(0.65, -0.65)),
          ManualImageMarker(label: '2', alignment: Alignment(0.7, 0.7)),
          ManualImageMarker(label: '3', alignment: Alignment(-0.25, 0.9)),
        ],
      ),
      ManualContentBlock.bullets([
        '1. Press the [Load] button to register up to 4 WSL files to run.',
        '2. Press [Configuration Buttons] to assign an external switch. (There is no function to delete the currently assigned function, so if you need to delete it, you need to reset it after initialization.)',
        '3. Press the red [Upload and Start] button at the bottom.',
      ]),
      ManualContentBlock.paragraph(
        'After that, press the external switch button to receive the assigned I/O DIN signal, and the registered program will run/schedule. Pause/resume with the pause button.',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '7-linear-teaching',
    blocks: [
      ManualContentBlock.heading(
          'Move L – How the Straight Line Movement Command Works'),
      ManualContentBlock.paragraph(
        "If you have registered two or more Move L commands in a row, the robot's movement mode will vary depending on whether the points are Weld Sections.",
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/movel_steps_outofarc.png',
        caption:
            'Path when Move L commands are consecutive outside the welding section',
        maxWidth: 520,
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/movel_outof_arc.png',
        // caption: 'Move L execution screen in a normal movement section',
      ),
      ManualContentBlock.heading(
          'If it is not a welding section (normal movement)'),
      ManualContentBlock.bullets([
        'Arrive and stop at the point correctly, then move to the next location.',
        'At each stopover, you will stop briefly and then start again.',
        'Suitable for general teaching stopovers or for mobile safety purposes.',
      ]),
      ManualContentBlock.image(
        'assets/rbx-screens/movel_steps_inarc.png',
        caption:
            'Path when Move L commands are consecutive within the welding section',
        maxWidth: 520,
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/movel_in_arc.png',
        // caption: 'Move L execution screen in the welding section',
      ),
      ManualContentBlock.heading(
          'If it is a welding section (in the weld section)'),
      ManualContentBlock.bullets([
        'Smooth continuous movement between points at a constant speed.',
        'Automatic blending without stopping at each point.',
        'The middle point is only a stopover and does not stop.',
      ]),
      ManualContentBlock.note(
        'If you need to stop at a specific point in the welding section, add the Wait 0.1 command just below that point.',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '8-arc-teaching',
    blocks: [
      ManualContentBlock.heading('Move C – How the Move Curve command works'),
      ManualContentBlock.paragraph(
        'In the case of curved movement, we recommend using it only within the welding section.',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/moveC-example.png',
        caption: 'Move C curve movement example',
        maxWidth: 250,
      ),
      ManualContentBlock.heading('How to use'),
      ManualContentBlock.bullets([
        '1. The starting point registers as Move L.',
        '2. After that, all points that will follow the curved path are registered as Move C.',
        '3. Weld Start is inserted just below the starting point.',
        '4. Weld End is positioned below the last Move C.',
      ]),
      ManualContentBlock.note(
        'You will need at least 4 points, including the start and end points. (Ex: L-C-C-C or L-C-C-C-C)\nI attach an example picture on the right.',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '9-1-welder-kemppi-mig',
    blocks: [
      ManualContentBlock.heading('Kemppi (MIG)'),
      ManualContentBlock.note(
        'Notification\n\nWelder and Robot must be connect on same network(address), router\nThere is a problem that the welding machine and the robot are disconnected sometimes.\nIn that case, you can completely shut down the welding machine and reboot. Then, it will be reconnected.',
      ),
      ManualContentBlock.heading('Setting method'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/kemppi-systemset.png',
        maxWidth: 600,
        caption: 'Kemppi welder settings (System Set)',
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
        '3. Scroll down -> Apply(Modifications are applied only when the Apply button is pressed.)',
        '4. Setup -> Welding Set',
        '5. In the weld set page, set the start and end pages to the desired values.',
      ]),
      ManualContentBlock.heading('How to setting'),
      ManualContentBlock.bullets([
        '1. Start',
      ]),
      ManualContentBlock.image(
        'assets/rbx-screens/kemppi-welder-start.png',
        maxWidth: 400,
        caption: 'Kemppi Welding Set - Start',
      ),
      ManualContentBlock.bullets([
        'Pre Wait(sec) - Wait time before the robot arrives at the start point of welding and generates the arc',
        'Arc Stanby(sec) - Wait time for arcs to occur (typically, it is recommended to set to 3 seconds)',
        'Post Wait(sec) - After the arc has occurred, the robot has started to move after waiting for this amount of time',
        'Method - Set welding Method (Explained on the next page)',
        'Memory - Enter the memory channel you want to use.',
        'Feed Speed(m/min) - Enter the wire feed rate of the welding machine.',
        'Volt.(V) - Set the welding voltage value.',
        'Robot Speed(mm/s) - Set the robot speed in the welding section.',
        'dynamics - Controls the welding arc response (higher = faster, lower = softer). (In Mem w/ Adj. method, works as Fine tune.)',
      ]),
      ManualContentBlock.heading('Method'),
      ManualContentBlock.paragraph(
        'There are three methods for Kemppi welder welding commands.',
      ),
      ManualContentBlock.heading('1. Mem w/ Adj.'),
      ManualContentBlock.image(
        'assets/rbx-screens/kemppi-mem-w-adj.png',
        maxWidth: 300,
      ),
      ManualContentBlock.paragraph(
        'Based on the conditions stored in memory. You can adjust the values of Fine tune, Feed Speed, Dynamic, etc.',
      ),
      ManualContentBlock.heading('2. Mem w/o Adj.'),
      ManualContentBlock.image(
        'assets/rbx-screens/kemppi-mem-wo-adj.png',
        maxWidth: 300,
      ),
      ManualContentBlock.paragraph(
        'Use only as stored in memory. Values other than Robot Speed cannot be adjusted in UI.',
      ),
      ManualContentBlock.heading('3. Manual'),
      ManualContentBlock.image(
        'assets/rbx-screens/kemppi-manual.png',
        maxWidth: 300,
      ),
      ManualContentBlock.paragraph(
        'User enters all values directly to set up.',
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
        'Pre Wait(sec) - In contrast to the start page, the pre wait on the end page sets the waiting time before the arc ends.',
      ]),
      ManualContentBlock.heading('How to Teaching'),
      ManualContentBlock.paragraph(
        'For example, simple straight welding. Basically, it is like this.',
      ),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/kemppi-example.png',
        maxWidth: 520,
        caption: 'Straight welding example (command sequence)',
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(-1, -1)),
          ManualImageMarker(label: '2', alignment: Alignment(-1, -0.4)),
          ManualImageMarker(label: '3', alignment: Alignment(-1, 0.25)),
          ManualImageMarker(label: '4', alignment: Alignment(-1, 0.9)),
        ],
      ),
      ManualContentBlock.bullets([
        '1. Start point of before welding start',
        '2. Weld start',
        '3. End point of after welding end',
        '4. Weld End',
      ]),
      ManualContentBlock.note(
        'There must be a pair of weld start staff and weld end staff; if the command is missing, an error will occur.',
      ),
      ManualContentBlock.heading('Weld Adjust'),
      ManualContentBlock.paragraph(
        'This function helps to change wire feed speed and detailed adjustment values in real time during welding.',
      ),
      ManualContentBlock.note(
        '(In this version, it only operates in Kemppi welding mode. Will be updated later.)',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/kemppi-weld-adjust.png',
        maxWidth: 450,
        caption: 'Weld-Adjust',
      ),
      ManualContentBlock.bullets([
        'Memory Add : Welder memory channel number to apply',
        'Feed Speed (m/min) : Wire feed speed setting',
        'Fine Tune : Fine adjustment value setting, calibrating weld voltage value within ±10.0',
        'Robot Speed(%) : Change the robot\'s speed to a ratio of -100 to 100(%)',
      ]),
      ManualContentBlock.bullets([
        'Ex) Change to 10mm/s if the existing speed is 5mm/s and 100%',
        'Ex) Change to 7.5mm/s if existing speed is 5mm/s and 50%',
      ]),
    ],
  ),
  ManualSectionContent(
    entryId: '9-2-welder-weco-mig',
    blocks: [
      ManualContentBlock.heading('WECO (MIG)'),
      ManualContentBlock.note(
        'Notification\n\n1. This function is currently under development and may cause issues.\n2. Some features may not work. If you have any questions, please contact the CS team.',
      ),
      ManualContentBlock.heading('Setting method'),
      ManualContentBlock.image(
        'assets/rbx-screens/weco-systemset.png',
        maxWidth: 600,
        caption: 'WECO welder settings (System Set)',
      ),
      ManualContentBlock.bullets([
        '1. To connect the welder, set Welding Type to MIG, choose the correct Robot Model (usually RB_U), and set the Welder Model to the appropriate WECO type.\n(The welder, robot, and tablet must be on the same network. Also, use an IP address in the 192.168.0.X range.)',
        '2. After completing the settings, scroll down and press the Apply button.\n(If you do not press Apply, it will revert to the previous settings.)',
      ]),
      ManualContentBlock.heading('Welding Set settings'),
      ManualContentBlock.image(
        'assets/rbx-screens/weco-welder-start.png',
        maxWidth: 400,
        caption: 'Weco Welding Set - Start',
      ),
      ManualContentBlock.paragraph(
        '3. Next, change the welder settings.\nTap Set -> Welding Set. The start page will appear. Set the values as desired, as shown on the screen.',
      ),
      ManualContentBlock.note(
        'Note: It is not recommended to modify Arc Stanby (sec).',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/weco-welder-jobmode.png',
        maxWidth: 300,
        caption: 'Work Mode - JobMode',
      ),
      ManualContentBlock.paragraph(
        '3-1. Unlike None mode, JobMode retrieves values stored in the welder.\n\nFor other modes, you must enter appropriate values in the blank fields as shown.\n\nSee the image on the right. (The values shown in the image are test values and are not recommended.)\n\nAlso, the doublePulsed and kdeepon functions at the bottom cannot be used at the same time.',
      ),
      ManualContentBlock.image(
        'assets/rbx-screens/weco-welder-end.png',
        maxWidth: 400,
        caption: 'Weco Welding Set - End',
      ),
      ManualContentBlock.paragraph(
        '4. Next is the welding setting end page. You can enter the desired values.\n\n(There is currently no function on the welder page.)',
      ),
      ManualContentBlock.heading('Straight welding example'),
      ManualContentBlock.image(
        'assets/rbx-screens/weco-example.png',
        maxWidth: 520,
        caption: 'Straight welding example (command sequence)',
      ),
      ManualContentBlock.paragraph(
        '5. After completing the settings, we will explain using a straight welding example.\nThe basic sequence is: Start point -> Weld Start -> End point -> Weld End.\nIf you have reached this point, there should be no problem using the WECO welder.\n(However, you should test while adjusting the settings.)',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '9-3-welder-imt-laser',
    blocks: [
      ManualContentBlock.heading('IMT (Laser)'),
      ManualContentBlock.note(
        'Notification\n\nThe welder, PC, and robot must be connected to the same network (address) and router.\nYou must use the IMT wire feeder.\nAfter connecting, we recommend checking the inching and reverse inching functions 2–3 times before use.',
      ),
      ManualContentBlock.heading('Setting method'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/imt-systemset.png',
        maxWidth: 600,
        caption: 'IMT welder settings (System Set)',
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(-0.58, -0.14)),
          ManualImageMarker(label: '2', alignment: Alignment(0.55, -0.14)),
          ManualImageMarker(label: '3', alignment: Alignment(0.82, 0.82)),
        ],
      ),
      ManualContentBlock.bullets([
        '1. Setup -> System Set',
        '2. Welding Type -> LASER, Welder Model -> IMT',
        '3. Scroll down -> Apply (Changes are applied only when the Apply button is pressed.)',
        '4. Tap Welding Set.',
        '5. In the Welding Set page, set the Start and End pages to the desired values.',
      ]),
      ManualContentBlock.heading('Welding Set settings'),
      ManualContentBlock.bullets([
        '1. Start',
      ]),
      ManualContentBlock.image(
        'assets/rbx-screens/imt-welder-start.png',
        maxWidth: 600,
        caption: 'IMT Welding Set - Start',
      ),
      ManualContentBlock.bullets([
        'Use Wire - Enable/disable wire feeding.',
        'Wire Align - Enable/disable wire alignment.',
        'Pre wait (sec) - Waiting time before the arc starts.',
        'Laser Power (%) - Sets laser welding power.',
        'Wire Wait (sec) - After the laser turns on, wire feeding starts after this delay.',
        'Feed Speed (%) - Sets wire feed speed during welding.',
        'Post wait (sec) - After arc and wire feeding start, the robot begins moving after this time.',
        'Robot Speed (mm/s) - Sets robot speed in the welding section.',
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
        'Pre Wait (sec) - After reaching the weld end point, waiting time before turning off the arc.',
        'Laser Power (%) - Laser power during the crater section.',
        'Crater Fill (sec) - Sets crater fill time.',
        'Post wait (sec) - After the arc turns off, the robot waits this time and proceeds to the next step.',
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
        'Arc On Ch. - Assign the Arc On signal. (D.out)',
        'Gas Check Ch. - Assign the Gas Check signal. (D.out)',
        'Relay On Ch. - Assign the Relay On signal. (D.out) (Required when using wire alignment.)',
        'Relay Input Ch. - Assign the Relay Input signal. (D.in) (Required when using wire alignment.)',
        'Back Speed, Back Time - Set reverse inching speed and perform reverse inching for Back time. (Executed at weld end.)',
        'Fwd Speed, Fwd Time - Set forward inching speed and perform inching for Fwd time. (Executed after reverse inching at weld end.)',
      ]),
      ManualContentBlock.heading('Current/Voltage channel settings'),
      ManualContentBlock.image(
        'assets/rbx-screens/imt-welder-curr-ch.png',
        maxWidth: 420,
        caption: 'Current channel settings',
      ),
      ManualContentBlock.bullets([
        'Curr. Signal Range - Sets the control box analog output (A.out) range used for current control. (Typically 10V is used.)',
        'Current Ch. - Sets the current channel. (A.out)',
        'Current Range - Sets the range of current values used in welding commands.',
        'Based on the configured range, a voltage from 0 to 10V is output proportionally.',
      ]),
      ManualContentBlock.bullets([
        'Example) If Signal Range is 10V and Current Range is set to 0-100, using 50 in the welding command outputs 5V.',
      ]),
      ManualContentBlock.image(
        'assets/rbx-screens/imt-welder-volt-ch.png',
        maxWidth: 420,
        caption: 'Voltage channel settings',
      ),
      ManualContentBlock.bullets([
        'Volt. Signal Range - Sets the control box analog output (A.out) range used for voltage control. (Typically 10V is used.)',
        'Voltage Ch. - Sets the voltage channel. (A.out)',
        'Voltage Range - Sets the range of voltage values.',
        '(Works the same way as the Current Range described above.)',
      ]),
      ManualContentBlock.heading('Straight welding example'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/imt-example.png',
        maxWidth: 520,
        caption: 'Straight welding example (command sequence)',
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(-1, -1)),
          ManualImageMarker(label: '2', alignment: Alignment(-1, -0.4)),
          ManualImageMarker(label: '3', alignment: Alignment(-1, 0.25)),
          ManualImageMarker(label: '4', alignment: Alignment(-1, 0.9)),
        ],
      ),
      ManualContentBlock.bullets([
        '1. Start point of before welding start',
        '2. Weld start',
        '3. End point of after welding end',
        '4. Weld end',
      ]),
      ManualContentBlock.note(
        'Weld start and weld end steps must be paired. If a command is missing, an error will occur.',
      ),
    ],
  ),
  ManualSectionContent(
    entryId: '9-4-welder-maven-laser',
    blocks: [
      ManualContentBlock.heading('Maven (Laser)'),
      ManualContentBlock.note(
        'Notification\n\nThe welder, PC, and robot must be connected to the same network (address) and router.\nYou must use the Maven welder, and the wire feeder must be connected separately to the control box and assigned signals in the welder settings.\nAfter connecting, we recommend using the Gas Check function about 2–3 times to confirm operation.',
      ),
      ManualContentBlock.heading('Setting method'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/maven-systemset.png',
        maxWidth: 600,
        caption: 'Maven welder settings (System Set)',
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(-0.62, -0.14)),
          ManualImageMarker(label: '2', alignment: Alignment(0.5, -0.14)),
          ManualImageMarker(label: '3', alignment: Alignment(0.85, 0.82)),
        ],
      ),
      ManualContentBlock.bullets([
        '1. Setup -> System Set',
        '2. Welding Type -> LASER, Welder Model -> MAVEN',
        '3. Apply (Changes are applied only when the Apply button is pressed.)',
        '4. Tap Welding Set.',
        '5. In the Welding Set page, set the Start and End pages to the desired values.',
      ]),
      ManualContentBlock.heading('Welding Set settings'),
      ManualContentBlock.bullets([
        '1. Start',
      ]),
      ManualContentBlock.image(
        'assets/rbx-screens/maven-welder-start.png',
        maxWidth: 600,
        caption: 'Maven Welding Set - Start',
      ),
      ManualContentBlock.bullets([
        'Use Wire - Set whether to enable wire feeding.',
        'Wire Align - Sets whether to enable the wire alignment feature.',
        'Pre flow (sec) - This is the initial gas ejection time before the arc occurs.',
        'Laser Power (%) - Sets laser welding power.',
        'Wire Wait (sec) - After the laser is turned on, the atmospheric wire is sent for this hour.',
        'Feed Speed (%) - During welding, the feed rate of the wire is determined.',
        'Post flow (sec) - After the arc and wire are sent, the atmospheric robot will start moving at this time.',
        'Robot Speed (mm/s) - Sets robot speed in the welding section.',
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
        'Pre flow (sec) - After the robot reaches the weld end point, waiting time before turning off the arc.',
        'Laser Power (%) - Determines the laser power when the crater function is used.',
        'Crater Fill (sec) - Sets crater fill time.',
        'Post flow (sec) - After the arc turns off, gas is supplied for this time while the robot waits, then proceeds to the next step.',
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
        'Arc On Ch. - Assign the Arc On signal. (D.out)',
        'Gas Ch. - Assign the gas signal. (D.out)',
        'Inching Ch. - Assign the wire inching signal. (D.out)',
        'Reverse Inching Ch. - Assign the wire reverse inching signal. (D.out)',
        'Relay On Ch. - Assign the relay signal. (D.out) (Required when using wire alignment.)',
        'Relay Input Ch. - Assign the relay signal. (D.out) (Required when using wire alignment.)',
        'Auto Feed Ch. - Assign the auto feeding signal. (D.out)',
      ]),
      ManualContentBlock.heading('Laser power/feeder speed channel settings'),
      ManualContentBlock.image(
        'assets/rbx-screens/maven-welder-laserpowerrange.png',
        maxWidth: 420,
        caption: 'Laser power range settings',
      ),
      ManualContentBlock.bullets([
        'Laser Power Range - Sets the control box analog output (A.out) range used to control laser power. (Typically 10V is used.)',
        'Laser Power Ch. - Sets the laser power channel. (A.out)',
        'Laser Power Range - Sets the range of laser power values used in welding commands. Based on the configured range, a voltage from 0 to 10V is output proportionally.',
        'Example) If Signal Range is 10V and Laser Power Range is set to 0-100, using 50 in the welding command outputs 5V.',
      ]),
      ManualContentBlock.image(
        'assets/rbx-screens/maven-welder-feederspeedrange.png',
        maxWidth: 420,
        caption: 'Feeder speed range settings',
      ),
      ManualContentBlock.bullets([
        'Feeder Speed Range - Sets the wire feeder speed range.',
        'Feeder Speed Ch. - Sets the feeder speed channel. (A.out)',
        'Feeder Speed Range - Sets the range of feeder speed values.(Works the same way as the Laser Power Range described above.)',
      ]),
      ManualContentBlock.heading('Teaching method'),
      ManualContentBlock.heading('Simple straight welding example'),
      ManualContentBlock.annotatedImage(
        'assets/rbx-screens/maven-example.png',
        maxWidth: 520,
        caption: 'Straight welding example (command sequence)',
        markers: [
          ManualImageMarker(label: '1', alignment: Alignment(-1, -1)),
          ManualImageMarker(label: '2', alignment: Alignment(-1, -0.4)),
          ManualImageMarker(label: '3', alignment: Alignment(-1, 0.25)),
          ManualImageMarker(label: '4', alignment: Alignment(-1, 0.9)),
        ],
      ),
      ManualContentBlock.bullets([
        '1. Start point of before welding start',
        '2. Weld start',
        '3. End point of before welding end',
        '4. Weld end',
      ]),
      ManualContentBlock.note(
        'Weld start and weld end steps must be paired. If a command is missing, an error will occur.',
      ),
    ],
  ),
];
