import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'Calculator.dart';
import 'SideBar.dart';
import 'Login.dart';
import 'Home.dart';
import 'About.dart';

// import 'Register.dart';
// import 'package:calculator/Seth/Welcome.dart';
// import 'package:calculator/broad/Internet.dart';

void main() {
  runApp(
    // ChangeNotifierProvider<ThemeNotifier>(
    // create: (_) => ThemeNotifier(ThemeMode.light),
    // child:
    MainApp(),
    // ),
  );
}

// class ThemeNotifier extends ValueNotifier<ThemeMode> {
//   ThemeNotifier(ThemeMode value) : super(value);

//   void toggleTheme() {
//     value = value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
//   }
// }

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // themeMode: context.watch<ThemeNotifier>().value,
      home: Login(),
      routes: {
        '/login': (context) => Login(),
        // '/Register': (context) => Register(),
        '/home': (context) => Home(),
        '/calculator': (context) => Calculator(),
        '/about': (context) => About(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('THOMAS'),
        shadowColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.dark_mode),
            onPressed: () {
              // context.read<ThemeNotifier>().toggleTheme();
            },
          ),
        ],
      ),
      drawer: SideBar(),
      body: Home(),
    );
  }
}
