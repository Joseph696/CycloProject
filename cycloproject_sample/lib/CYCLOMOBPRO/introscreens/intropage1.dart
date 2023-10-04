import 'package:flutter/material.dart';


class intropage1 extends StatelessWidget {
  const intropage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 250,
              width: 220,
              child: Image(
                  image: NetworkImage(
                      "https://img.freepik.com/premium-vector/electric-charging-station-man-waiting-scooter-battery-charge_533410-1192.jpg"))),
          SizedBox(
            height: 20,
          ),
          Text(
            "Let's get started",
            style: TextStyle(
                color: Colors.orange,
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text("Cyclo collects location data to show you nearest zones and journey routes, allow cyclo to accest your location.",style: TextStyle(color: Colors.grey,fontSize: 15),),
            ))
        ],
      ),
      color: Colors.white,
    );
  }
}
