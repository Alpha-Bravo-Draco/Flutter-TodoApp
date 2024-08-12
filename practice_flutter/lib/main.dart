import 'package:flutter/material.dart';
import 'package:practice_flutter/pages/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todos',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Homepage());
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _controller = TextEditingController();

//   // @override
//   // void dispose() {
//   //   _controller.dispose(); // Dispose the controller when it's no longer needed
//   //   super.dispose();
//   // }

//   void _submit() {
//     final String text = _controller.text;
//     if (text.length > 5) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("enter less than 5")));
//     }
//     // ScaffoldMessenger.of(context).showSnackBar(
//     //   SnackBar(content: Text('Submitted Text: $text')),
//     // );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Controller Example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Form(
//               key: _formKey,
//               child: TextFormField(
//                 controller: _controller,
//                 decoration: InputDecoration(
//                   labelText: 'Enter some text',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'please enter ';
//                   }
//                   if (value.length < 3) {
//                     return 'please enter atleast 5';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _submit,
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
