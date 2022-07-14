import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLE Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(title: 'Flutter Demo BLE Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
   MyHomePage({Key? key, required this.title}) : super(key: key);
  final FlutterBlue flutterBlue = FlutterBlue.instance;
  final List<BluetoothDevice> devicesList = [];
  final String title;
 

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   _addDeviceTolist(final BluetoothDevice device) {
   if (!widget.devicesList.contains(device)) {
     setState(() {
       widget.devicesList.add(device);
     });
   }
 }
  @override
 void initState() {
   super.initState();
   widget.flutterBlue.connectedDevices
       .asStream()
       .listen((List<BluetoothDevice> devices) {
     for (BluetoothDevice device in devices) {
       _addDeviceTolist(device);
     }
   });
   widget.flutterBlue.scanResults.listen((List<ScanResult> results) {
     for (ScanResult result in results) {
       _addDeviceTolist(result.device);
     }
   });
   widget.flutterBlue.startScan();
 }
 ListView _buildListViewOfDevices() {
   List<Container> containers = [];
   for (BluetoothDevice device in widget.devicesList) {
     containers.add(
       Container(
         height: 50,
         child: Row(
           children: <Widget>[
             Expanded(
               child: Column(
                 children: <Widget>[
                   Text(device.name == '' ? '(unknown device)' : device.name),
                   Text(device.id.toString()),
                 ],
               ),
             ),
             FlatButton(
               color: Colors.blue,
               child: Text(
                 'Connect',
                 style: TextStyle(color: Colors.white),
               ),
               onPressed: () {},
             ),
           ],
         ),
       ),
     );
   }
 
   return ListView(
     padding: const EdgeInsets.all(8),
     children: <Widget>[
       ...containers,
     ],
   );
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              'Shailesh',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
     
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:dproject/screens/login.dart';
// import 'package:dproject/screens/signup.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';


  
// Future <void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: HomePage(),
//   ));
// } 


// class HomePage extends StatelessWidget {
//   @override
  
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       backgroundColor: Colors.greenAccent,

//       body: SafeArea(
//         child: Container(
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height,
//           padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
//           child: Column(
//             // even space distribution
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   Text(
//                     "Welcome",
//                     style: TextStyle(
//                       fontFamily: 'Rancho',
//                       fontWeight: FontWeight.bold,
//                       color: Colors.grey,
//                       fontSize: 40,

//                     ),

//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text("Welcome to BitLock",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: 'Rancho',
//                       color: Colors.grey,
//                       fontSize: 20,

//                     ),)
//                 ],
//               ),


//               Column(
//                 children: <Widget>[
                  
//                   SizedBox(height:20),
//                   MaterialButton(
//                     minWidth: double.infinity,
//                     height: 60,
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
//                     },
//                     // defining the shape
//                     color: Colors.amber,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(50)
//                     ),

//                     child: Text(
//                       "Login",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontFamily: 'Rancho',
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   // creating the signup button
//                   SizedBox(height:20),
//                   MaterialButton(
//                     minWidth: double.infinity,
//                     height: 60,
//                     onPressed: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupPage()));

//                     },
//                     color: Colors.amber,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(50)
//                     ),
//                     child: Text(
//                       "Sign up",
//                       style: TextStyle(
//                           fontFamily: 'Rancho',
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 18
//                       ),
//                     ),
//                   )

//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

