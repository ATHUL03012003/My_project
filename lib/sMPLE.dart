import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snackbar and Navigation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        '/nextPage': (context) => NextPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snackbar and Navigation Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Show Snackbar with instructions
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Instructions here'),
                action: SnackBarAction(
                  label: 'OK',
                  onPressed: () {
                    // Navigate to the next page
                    Navigator.pushNamed(context, '/nextPage');
                  },
                ),
              ),
            );
          },
          child: Text('Show Instructions'),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Page'),
      ),
      body: Center(
        child: Text('This is the next page!'),
      ),
    );
  }
}
