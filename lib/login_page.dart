import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  void loginUser() {
    print('login successful!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Let\'s sign you in!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              ),
              Text(
                'Welcome back! \n You\'ve been missed!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.blueGrey),
              ),
              Image.network(
                'https://static.bandainamcoent.eu/high/tekken/tekken-8/02-characters/new-gallery/Wide/JIN_new.png',
                height: 200,
              ),
              ElevatedButton(
                  onPressed: loginUser,
                  child: Text(
                    'Click Me',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                  )),
              TextButton(
                  onPressed: () {
                    print('Pressed on the URL!');
                  },
                  child: Text('https://poojabhaumik.com')),
            ],
          ),
        ),
      ),
    );
  }
}
