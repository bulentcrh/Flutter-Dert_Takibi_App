import 'package:f43_dert_takibi_app/profile_page.dart';
import 'package:f43_dert_takibi_app/task_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //AppBar
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.black,
            size: 40
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        )
      ),
      debugShowCheckedModeBanner: false,
      home: TaskDetailPage(),
    );
  }
}

