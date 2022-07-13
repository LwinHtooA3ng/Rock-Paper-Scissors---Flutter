import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Rock Paper Scissors",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Rock Paper Scissors"),
          backgroundColor: Colors.green,
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List _rps = [1, 2, 3];

  // 1 = paper
  // 2 = rock
  // 3 = scissors

  var _player1 = 1;

  var _player2 = 1;

  void shuffle_rps() {
    setState(() {
      _rps.shuffle();
      _player1 = _rps[0];
    });
  }

  void shuffle_rps2() {
    setState(() {
      _rps.shuffle();
      _player2 = _rps[0];
    });
  }

  void check_winner() {
    setState(() {
      if (_player1 == 1 && _player2 == 2) {
        var snackBar = const SnackBar(
          backgroundColor: Colors.greenAccent,
          duration: Duration(seconds: 1),
          content: Text(
            'Player 1 win !',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (_player1 == 1 && _player2 == 3) {
        var snackBar = const SnackBar(
          backgroundColor: Colors.greenAccent,
          duration: Duration(seconds: 1),
          content: Text(
            'Player 2 win !',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (_player1 == 2 && _player2 == 1) {
        var snackBar = const SnackBar(
          backgroundColor: Colors.greenAccent,
          duration: Duration(seconds: 1),
          content: Text(
            'Player 2 win !',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (_player1 == 2 && _player2 == 3) {
        var snackBar = const SnackBar(
          backgroundColor: Colors.greenAccent,
          duration: Duration(seconds: 1),
          content: Text(
            'Player 1 win !',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (_player1 == 3 && _player2 == 1) {
        var snackBar = const SnackBar(
          backgroundColor: Colors.greenAccent,
          duration: Duration(seconds: 1),
          content: Text(
            'Player 1 win !',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (_player1 == 3 && _player2 == 2) {
        var snackBar = const SnackBar(
          backgroundColor: Colors.greenAccent,
          duration: Duration(seconds: 1),
          content: Text(
            'Player 2 win !',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        var snackBar = const SnackBar(
          backgroundColor: Colors.greenAccent,
          duration: Duration(seconds: 1),
          content: Text(
            'Same result play again !',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(children: [
              Text(
                "Player 1",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600]),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: InkWell(
                    onTap: () {
                      shuffle_rps();
                    },
                    child: Image(
                      image: AssetImage('images/$_player1.png'),
                      width: 120,
                      height: 120,
                    )),
              ),
            ]),
            Column(children: [
              Text(
                "Player 2",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600]),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: InkWell(
                  onTap: () {
                    shuffle_rps2();
                  },
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: Image(
                      image: AssetImage('images/$_player2.png'),
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          onPressed: () {
            check_winner();
          },
          style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
          child: const Text("check who win"),
        ),
      ],
    );
  }
}
