import 'package:flutter/material.dart';
import 'package:kapitel_543/my_custom_error_screen.dart';
import 'package:logger/logger.dart';

void main() {
  ErrorWidget.builder = (details) => const Scaffold(
        body: Center(
          child: Text('Achtung, hier ist was schief gelaufen.' 
              'Bitte lade die Seite neu'),
        ),
      );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Logging',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Logger logger = Logger();
  logMessage(Level level, String message) {
    logger.log(level, message);
  }

  MyHomePage({super.key});

  showMessage() {
    logger.i('Info-Nachricht: Button wurde gedrückt');
    logger.w('Warnung: Hier ist was schiefgelaufen');
    logger.e('Fehler: Hier ist ein Fehler aufgetreten');
    print("Button wurde gedrückt. Nachricht im Log ausgegeben");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Logging"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              print(showMessage());
            },
            child: Text("Bitte hier drücken"),
          ),
          ElevatedButton(
            onPressed: () => logMessage(Level.info, 'Info - Nachricht'),
            child: Text('Log Info'),
          ),
          ElevatedButton(
            onPressed: () => logMessage(Level.warning, 'Warnung'),
            child: Text('Log Warning'),
          ),
          ElevatedButton(
            onPressed: () => logMessage(Level.error, 'Error'),
            child: Text('Log Error'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MyCustomErrorScreen(),
              ),
            ),
            child: Text("Error Screen aufrufen"),
          ),
        ]),
      ),
    );
  }
}
