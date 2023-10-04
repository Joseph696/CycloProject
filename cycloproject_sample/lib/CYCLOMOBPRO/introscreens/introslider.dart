import 'package:cycloproject_sample/CYCLOMOBPRO/Screens/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../Screens/loginreal.dart';

void main() {
  runApp(MaterialApp(
    home: introscreenmain(),
  ));
}

class introscreenmain extends StatelessWidget {
  List<PageViewModel> getpages() {
    return [
      PageViewModel(
        image: Image.network(
            height: 150,
            'https://img.freepik.com/premium-vector/electric-charging-station-man-waiting-scooter-battery-charge_533410-1192.jpg'),
        title: "Let's get started",
        decoration: PageDecoration(
            titleTextStyle: TextStyle(color: Colors.orange, fontSize: 22)),
        footer: Text('data'),
        body:
            'Cyclo collects location data to show you nearest zones and journey routes, allow cyclo to accest your location.',
      ),
      PageViewModel(
          image: Image.network(
              height: 150,
              'https://img.freepik.com/premium-vector/electric-charging-station-man-waiting-scooter-battery-charge_533410-1192.jpg'),
          title: "Let's get started",
          decoration: PageDecoration(
              titleTextStyle: TextStyle(color: Colors.orange, fontSize: 22)),
          body:
              'Cyclo collects location data to show you nearest zones and journey routes, allow cyclo to accest your location.',
          footer: Text('data')),
      PageViewModel(
          image: Image.network(
              height: 150,
              'https://img.freepik.com/premium-vector/electric-charging-station-man-waiting-scooter-battery-charge_533410-1192.jpg'),
          title: "Let's get started",
          decoration: PageDecoration(
              titleTextStyle: TextStyle(color: Colors.orange, fontSize: 22)),
          body:
              'Cyclo collects location data to show you nearest zones and journey routes, allow cyclo to accest your location.',
          footer: Text('data')),
    ];
  }

  const introscreenmain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IntroductionScreen(
          done: Text(
            'Done',
            style: TextStyle(color: Colors.grey, fontSize: 10),
          ),
          onDone: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
          },
          pages: getpages(),
          showNextButton: false,
          showBackButton: false,
        ),
      ),
    );
  }
}
