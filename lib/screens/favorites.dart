import 'package:flutter/material.dart';

class favorite extends StatefulWidget {
  const favorite({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: <Widget>[
        Text(
          "Fan Page",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        ElevatedButton(
          child: const Text(
            "Log Out",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            padding: const EdgeInsets.all(20),
          ),
          onPressed: () async {},
        ),
        Text(
          " *Warning: unauthorized access will result in serious consequences",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red.shade400,
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            padding: const EdgeInsets.all(20),
          ),
          onPressed: () async {},
          child: const Text(
            "User",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.yellow.shade200,
            padding: const EdgeInsets.all(20),
          ),
          onPressed: () {},
          child: const Text(
            "Admin",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        )
      ],
    )));
  }
}
