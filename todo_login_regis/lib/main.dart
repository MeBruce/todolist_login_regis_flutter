import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_login_register/home_screen.dart';
import 'package:todolist_login_register/todo_screen.dart';
import 'package:todolist_login_register/login.dart';
import 'package:todolist_login_register/register.dart';
import 'package:todolist_login_register/home.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String todoTitle = 'MyToDo';
  static const String loginTitle = 'Flutter Login Demo';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final bool isLogged = box.read('isLogged') ?? false;

    return GetMaterialApp(
      title: loginTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: isLogged ? '/login' : '/home_todo',
      getPages: [
        GetPage(name: '/login', page: () => login()),
        GetPage(name: '/register', page: () => register()),
        GetPage(name: '/home', page: () => homepage()),
        GetPage(name: '/home_todo', page: () => HomeScreen()),
      ],
    );
  }
}
