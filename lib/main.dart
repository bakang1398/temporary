import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: '/',
      routes: {
        /// When navigating to the "/" route, build the HomeScreen widget.
        '/': (context) => HomeScreen(),
        /// When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => SecondScreen(),
        /// When navigating to the "/third" route, build the ThirdScreen widget.
        '/third': (context) => ThirdScreen(),
        /// When navigating to the "/fourth" route, build the FourthScreen widget.
        '/fourth': (context) => FourthScreen(),
      },
    );
  }
}

/// The Home screen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Click Here'),
          onPressed: () {
            /// Pop the only screen
            /*Navigator.pop(context);*/

            /// Pop only if you can
            /*Navigator.maybePop(context);*/

            /// Checks if it can pop or not. Returns true if it can and false if it can't
            /*Navigator.canPop(context);
            print("can pop? ${Navigator.canPop(context)}");*/

            /// Navigate to the second screen
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}

/// The second screen

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Second Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            /// Pops and goes back to the previous screen
            /*Navigator.pop(context);*/

            /// Pop only if you can
             /*Navigator.maybePop(context);*/

            /// Checks if it can pop or not. Returns true if it can and false if it can't
            /*Navigator.canPop(context);
            print("can pop? ${Navigator.canPop(context)}");*/

            /// Go back to home screen by navigating to it instead of popping second screen
            /*Navigator.pushNamed(context, '/');*/

            /// Navigate to the third screen
            Navigator.pushNamed(context, '/third');
          },
          child: Text('Navigate/Pop!'),
        ),
      ),
    );
  }
}


/// The third screen

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Third Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            /// Replaces the third screen with the fourth screen
            /*Navigator.pushReplacementNamed(context, '/fourth');*/

            /// Pops/Removes the third screen from the stack of pages and goes to the fourth screen
            Navigator.popAndPushNamed(context, '/fourth');
          },
          child: Text('Navigate!'),
        ),
      ),
    );
  }
}

/// The fourth screen

class FourthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Fourth Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            /// Removes all other pages from the stack and goes to your preferred screen
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          child: Text('Navigate!'),
        ),
      ),
    );
  }
}
