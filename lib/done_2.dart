import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      runApp(const StorageExampleApp());
    } else {
      await Firebase.initializeApp(
        name: "Al-fatiha",
        options: DefaultFirebaseOptions.currentPlatform,
      );
      runApp(const StorageExampleApp());
    }
  } catch (e) {
    print('Something wrong $e');
    return;
  }
}

class StorageExampleApp extends StatelessWidget {
  const StorageExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Storage Example App',
      theme: ThemeData.dark(),
      // Disable the banner to make the "+" button more visible.
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: TaskManager(),
      ),
    );
  }
}

class TaskManager extends StatefulWidget {
  const TaskManager({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _TaskManager();
  }
}

class _TaskManager extends State<TaskManager> {
  Future<Directory?> pathData() async {
    final Directory? directory = await getExternalStorageDirectory();
    return directory;
  }

  Future<void> downloadFile() async {
    // Get the file path on device
    Directory? appDocDir = await pathData();
    String filePath = '${appDocDir?.path}/1.mp3';

    // Get the reference to the file on Firebase Storage
    Reference ref = FirebaseStorage.instance.ref().child('1.mp3');

    // Download the file to device
    File file = File(filePath);
    try {
      await ref.writeToFile(file);

      print('File downloaded to $filePath');
    } catch (e) {
      print('something wrong $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Storage Example App'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async => await downloadFile(),
            child: const Text('Download File'),
          ),
        ));
  }
}
