import 'package:cycloproject_sample/CYCLOMOBPRO/Screens/Homepage.dart';
import 'package:cycloproject_sample/CYCLOMOBPRO/Screens/loginreal.dart';
import 'package:cycloproject_sample/Controller/authcontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  User? user = FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(
    home: user == null ? Signup() : LoginScreen(),
  ));
}

class Signup extends StatelessWidget {
  final ctrl = Get.put(AuthController());
  //const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://www.businessinsider.in/photo/93948816/The-best-selling-electric-scooters-In-India.jpg',
                ))),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(children: [
            Wrap(children: [
              IconButton(
                color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
              const Text(
                'Welcome Back!',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.purpleAccent),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Signup your Account to explore and \n Enjoy your ride.',
              style: TextStyle(color: Color.fromARGB(255, 177, 143, 183),fontSize: 18),
            ),
            const SizedBox(
              height: 70,
            ),
            TextField(
              controller: ctrl.username,
              decoration: InputDecoration(
                  iconColor: Colors.purple,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintText: "Username",
                  icon: Icon(
                    Icons.supervised_user_circle,
                  ),
                  filled: true,
                  fillColor: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: ctrl.email,
              decoration: InputDecoration(
                  iconColor: Colors.purple,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintText: "Email",
                  icon: Icon(Icons.email),
                  fillColor: Colors.white,
                  filled: true),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: ctrl.password,
              decoration: InputDecoration(
                  iconColor: Colors.purple,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Username",
                  icon: Icon(Icons.password)),
            ),
            InkWell(
              onTap: () async {
                ctrl.signUp();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Homepagemain(),
                ));
              },
              child: Obx(
                () => Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ctrl.loading.value
                      ? CircularProgressIndicator(
                          color: Colors.pink,
                        )
                      : const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12),
                        ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
