import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:interview_flutter_application/Features/Data/models.dart';

class SecondScreen extends StatefulWidget {
  final String username;
  final String name;
  final String email;
  const SecondScreen({Key? key, required this.username, required this.name, required this.email, }) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.username),
            Text(widget.name),
            Text(widget.email)
          ],
        ),
      )
    );
  }
}