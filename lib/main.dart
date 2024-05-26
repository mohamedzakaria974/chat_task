import 'package:chat_task/app/chat_task_app.dart';
import 'package:chat_task/core/di/di.dart' as di;
import 'package:flutter/material.dart';

bool isUnitTest = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const ChatTaskApp());
}
