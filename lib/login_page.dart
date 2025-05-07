import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        print('button clicked');
      }),
      body: Column(
        children: [
          Text(
            'Let\'s sign you in!',
            style: TextStyle(
                fontSize: 30,
                color: Colors.brown,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5),
          ),
          Text(
            'Welcome back! \n You\'ve been missed!',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blueGrey),
          ),
          Image.network(
            'https://static.bandainamcoent.eu/high/tekken/tekken-8/02-characters/new-gallery/Wide/JIN_new.png',
            height: 200,
          ),
          Container(
            height: 150,
            width: 150,
            // child: FlutterLogo(),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage(
                        'https://static.bandainamcoent.eu/high/tekken/tekken-8/02-characters/new-gallery/Wide/JIN_new.png')),
                color: Colors.blue,
                borderRadius: BorderRadius.circular(24)),
          )
        ],
      ),
    );
  }
}
