// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sendbird_sdk/sdk/sendbird_sdk_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sendbird SDK 3.1.12',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Connect'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  void _connect() async {
    const appId = 'say your_app_id';
    const userId = 'anonymity';

    print('initialize Sendbird');
    final sendbird = SendbirdSdk(appId: appId);
    try {
      print('connect to Sendbird');
      final user = await sendbird.connect(userId);
      print('disconnect from Sendbird');
      await sendbird.disconnect();
      print('disconneced');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Connect to Sendbird',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _connect,
        tooltip: 'Connect',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
