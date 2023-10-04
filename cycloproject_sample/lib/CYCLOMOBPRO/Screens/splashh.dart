import 'dart:async';
import 'package:cycloproject_sample/CYCLOMOBPRO/Screens/login_phone.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.purple),
    home: flashscreentimer(),
  ));
}

class flashscreentimer extends StatefulWidget {
  const flashscreentimer({super.key});

  @override
  State<flashscreentimer> createState() => _flashscreentimerState();
}

class _flashscreentimerState extends State<flashscreentimer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => flashscreentimer())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                    'https://img.freepik.com/premium-vector/electric-scooter-vector-icon-logo-design-2_691652-147.jpg'),
              )),
            ),
            Text(
              "Cyclo Rent",
              style: GoogleFonts.stalinistOne(
                  fontSize: 35,
                  color: Color.fromARGB(255, 79, 246, 50),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
