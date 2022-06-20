import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider/counter.dart';
import 'package:todo_app_provider/providers/counter-provider.dart';
import 'package:todo_app_provider/providers/todo-provider.dart';
import 'package:todo_app_provider/screens/todo-list-provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return //return GetMaterialApp for Getx
        //ChangeNotifierProvider(
        //create:  ((context) => TodoProvider()),
        MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => TodoProvider())),
        //ChangeNotifierProvider(create: ((context) => AuthProvider())),
        //ChangeNotifierProvider(create: ((context) => cartProvider())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TodoListProviderScreen(),
      ),
    );
  }
}
