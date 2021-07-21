import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification/pushNotification.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'notif box',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Notification'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  FirebaseNotifcation firebase;

  handleAsync() async {
    await firebase.initialize();

    String token = await firebase.getToken();
    print("Firebase token : $token");
  }

  @override
  void initState() {
    super.initState();
    firebase = FirebaseNotifcation();
    handleAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
                color: Colors.blue,
                onPressed: () {
                  print("here");
                  firebase.subscribeToTopic('notify');
                },
                child: Text("button"))
          ],
        ),
      ),
    );
  }
}
