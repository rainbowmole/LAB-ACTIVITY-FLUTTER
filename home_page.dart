import 'package:flutter/material.dart';
import 'pages/act1_page.dart';
import 'pages/act2_page.dart';
import 'pages/act3_page.dart';
import 'pages/act4_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Homepage')),
      body: Padding(padding: const EdgeInsets.all(10.0),
      child: GridView.count(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10,
      children: [
          createButton(context, Icons.phone_android, "", "Button 1"),
          createButton(context, Icons.computer, "", "Button 2"),
          createButton(context, Icons.qr_code, "", "Button 3"),
          createButton(context, Icons.garage, "", "Button 4"),
      ]
      ),
      ),
    );
  }
}

Widget createButton(BuildContext context, IconData icon, String label, String title){

  final Map<String, Widget Function()> btn = {
    'Button 1': () => ActivityPage1(title: title),
    'Button 2': () => ActivityPage2(title: title),
    'Button 3': () => ActivityPage3(title: title),
    'Button 4': () => ActivityPage4(title: title),
  };

  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      )
    ),

    onPressed: () {
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (_) => btn[title]!())
        );
    }, 

  icon: Icon(icon , size: 50,), 
  label: Text(label));
}