// import 'package:flutter/material.dart';


// class BluetoothApp extends StatefulWidget {
//   @override
//   _BluetoothAppState createState() => _BluetoothAppState();
// }

// class _BluetoothAppState extends State<BluetoothApp> {
//   BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

//   // Get the instance of the Bluetooth
//   FlutterBluetoothSerial _bluetooth = FlutterBluetoothSerial.instance;

//   // Track the Bluetooth connection with the remote device
//   BluetoothConnection connection;

//   // To track whether the device is still connected to Bluetooth
//   bool get isConnected => connection != null && connection.isConnected;

//   int _deviceState;
//   @override
//   void initState() {
//     super.initState();

//     // Get current state
//     FlutterBluetoothSerial.instance.state.then((state) {
//       setState(() {
//         _bluetoothState = state;
//       });
//     });

//     _deviceState = 0; 
//     enableBluetooth();

//     // Listen for further state changes
//     FlutterBluetoothSerial.instance
//         .onStateChanged()
//         .listen((BluetoothState state) {
//       setState(() {
//         _bluetoothState = state;

//         // For retrieving the paired devices list
//         getPairedDevices();
//       });
//     });
// }
// Future<void> enableBluetooth() async {
//   // Retrieving the current Bluetooth state
//   _bluetoothState = await FlutterBluetoothSerial.instance.state;

//   // If the Bluetooth is off, then turn it on first
//   // and then retrieve the devices that are paired.
//   if (_bluetoothState == BluetoothState.STATE_OFF) {
//     await FlutterBluetoothSerial.instance.requestEnable();
//     await getPairedDevices();
//     return true;
//   } else {
//     await getPairedDevices();
//   }
//   return false;
// }
// // main.dart
// // Inside _BluetoothAppState class

// // Define a new class member variable
// // for storing the devices list
// List<BluetoothDevice> _devicesList = [];

// Future<void> getPairedDevices() async {
//   List<BluetoothDevice> devices = [];

//   // To get the list of paired devices
//   try {
//     devices = await _bluetooth.getBondedDevices();
//   } on PlatformException {
//     print("Error");
//   }

//   // It is an error to call [setState] unless [mounted] is true.
//   if (!mounted) {
//     return;
//   }

//   // Store the [devices] list in the [_devicesList] for accessing
//   // the list outside this class
//   setState(() {
//     _devicesList = devices;
//   });
// }
// bool _connected = false;

//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
  
//         Container(
//           child: Switch(
//             value: _bluetoothState.isEnabled,
//             onChanged: (bool value) {
//               future() async {
//                 if (value) {
//                   // Enable Bluetooth
//                   await FlutterBluetoothSerial.instance
//                       .requestEnable();
//                 } else {
//                   // Disable Bluetooth
//                   await FlutterBluetoothSerial.instance
//                       .requestDisable();
//                 }

//                 // In order to update the devices list
//                 await getPairedDevices();
//                 _isButtonUnavailable = false;

//                 // Disconnect from any device before
//                 // turning off Bluetooth
//                 if (_connected) {
//                   _disconnect();
//                 }
//               }

//               future().then((_) {
//                 setState(() {});
//               });
//             },
//           ),
//         )

//       ),
//     );
//   }
// }