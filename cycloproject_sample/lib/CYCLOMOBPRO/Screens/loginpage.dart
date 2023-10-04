// import 'package:cycloproject_sample/CYCLOMOBPRO/Screens/Homepage.dart';
// import 'package:cycloproject_sample/CYCLOMOBPRO/Screens/signup.dart';
// import 'package:cycloproject_sample/main.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// void main() {
//   runApp(MaterialApp(
//     home: loginorg(),
//   ));
// }

// class loginorg extends StatefulWidget {
//   const loginorg({super.key});

//   @override
//   State<loginorg> createState() => _loginorgState();
// }

// class _loginorgState extends State<loginorg> {
//   Future<FirebaseApp> _initializeFirebase() async {
//     FirebaseApp firebaseApp = await Firebase.initializeApp();
//     return firebaseApp;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // appBar: AppBar(
//         //   backgroundColor: Colors.transparent,
//         //   title: Text(
//         //     'Cyclo Rental',
//         //     style: GoogleFonts.aBeeZee(color: Colors.white),
//         //   ),
//         // ),
//         body: FutureBuilder(
//             future: _initializeFirebase(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return loginorg();
//               }
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }));
//   }
// }

// class Login2 extends StatefulWidget {
//   const Login2({super.key});

//   @override
//   State<Login2> createState() => _Login2State();
// }

// class _Login2State extends State<Login2> {
//   static Future<User?> loginUsingEmailPassword(
//       {required String email,
//       required String password,
//       required BuildContext context}) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User? user;
//     try {
//       UserCredential userCredential = await auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       user = userCredential.user;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == "user-not-found") {
//         print("No user found for that email");
//       }
//     }
//     return user;
//   }

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController _emailController = TextEditingController();
//     TextEditingController _passwordController = TextEditingController();
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: NetworkImage(
//                         "https://www.eqmagpro.com/wp-content/uploads/2021/07/Ola-electric-scooter-witnesses-record-breaking-reservations-heres-how-you-can-book-yours.jpeg"))),
//             // gradient: LinearGradient(
//             //     begin: Alignment.topRight,
//             //     end: Alignment.bottomLeft,
//             //     colors: [Colors.white, Colors.deepPurple])),
//             child: PageView.builder(itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: SingleChildScrollView(
//                   physics: ScrollPhysics(),
//                   child: Padding(
//                     padding: EdgeInsets.only(top: 100),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(bottom: 50),
//                           child: Text(
//                             "Cyclo",
//                             style: GoogleFonts.stalinistOne(
//                                 fontSize: 60,
//                                 color: Colors.deepPurple[500],
//                                 decorationColor: Colors.amber,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         TextField(
//                           controller: _emailController,
//                           decoration: InputDecoration(
//                               filled: true,
//                               fillColor: Colors.purple[100],
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(20)),
//                               hintText: 'Email',
//                               hintStyle: TextStyle(color: Colors.blueGrey),
//                               prefixIcon: Icon(Icons.email)),
//                         ),
//                         SizedBox(height: 30),
//                         TextField(
//                           controller: _passwordController,
//                           decoration: InputDecoration(
//                               filled: true,
//                               fillColor: Colors.purple[100],
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(20)),
//                               hintText: 'Password',
//                               hintStyle: TextStyle(color: Colors.blueGrey),
//                               prefixIcon: Icon(Icons.password_rounded)),
//                         ),
//                         Align(
//                           alignment: Alignment.topRight,
//                           child: TextButton(
//                             onPressed: () {
//                               showBottomSheet(
//                                 context: context,
//                                 builder: (context) {
//                                   return SizedBox(
//                                     height: 370,
//                                     child: Padding(
//                                         padding: EdgeInsets.all(20),
//                                         child: Column(
//                                           children: [
//                                             Container(
//                                               alignment: Alignment.center,
//                                               height: 40,
//                                               width: 30,
//                                               decoration: BoxDecoration(
//                                                   image: DecorationImage(
//                                                       image: NetworkImage(
//                                                           'https://w7.pngwing.com/pngs/994/729/png-transparent-exclamation-mark-poster-exclamation-mark-wikimedia-commons-icon-exclamation-mark-angle-text-orange.png'))),
//                                             ),
//                                             SizedBox(
//                                               height: 10,
//                                             ),
//                                             Text(
//                                               'Forgot password',
//                                               style: TextStyle(
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 14),
//                                             ),
//                                             SizedBox(
//                                               height: 15,
//                                             ),
//                                             Text(
//                                               "Enter your email and we'll send you a link to send reset your password",
//                                               style: TextStyle(
//                                                   color: Colors.grey[700]),
//                                             ),
//                                             SizedBox(
//                                               height: 12,
//                                             ),
//                                             Container(
//                                               decoration: BoxDecoration(
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           20)),
//                                               child: TextFormField(
//                                                 decoration: InputDecoration(
//                                                     border:
//                                                         OutlineInputBorder(),
//                                                     filled: true,
//                                                     fillColor: Colors.red[100],
//                                                     hintText: 'Type here',
//                                                     prefixIcon: Icon(
//                                                       Icons.mail_lock_sharp,
//                                                     )),
//                                               ),
//                                             ),
//                                             SizedBox(
//                                               height: 18,
//                                             ),
//                                             Container(
//                                               width: MediaQuery.of(context)
//                                                       .size
//                                                       .width *
//                                                   2,
//                                               child: ElevatedButton(
//                                                   style: ButtonStyle(
//                                                       backgroundColor:
//                                                           MaterialStatePropertyAll(
//                                                               Colors.green)),
//                                                   onPressed: () {},
//                                                   child: Text(
//                                                     'Submit',
//                                                     style: TextStyle(
//                                                         color: Colors.white),
//                                                   )),
//                                             ),
//                                             SizedBox(
//                                               height: 15,
//                                             ),
//                                             TextButton(
//                                                 onPressed: () {
//                                                   Navigator.pop(context);
//                                                 },
//                                                 child: Text(
//                                                   ' < back to login',
//                                                   style: TextStyle(
//                                                       color: Colors.grey),
//                                                 ))
//                                           ],
//                                         )),
//                                   );
//                                 },
//                               );
//                             },
//                             child: Text('Forgot password?',
//                                 style:
//                                     TextStyle(color: Colors.deepPurple[800])),
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Container(
//                           decoration: BoxDecoration(
//                               color: Colors.green,
//                               borderRadius: BorderRadius.circular(20)),
//                           height: 50,
//                           width: MediaQuery.of(context).size.width,
//                           child: ElevatedButton(
//                               style: ButtonStyle(
//                                   shape: MaterialStatePropertyAll(
//                                       RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(20))),
//                                   backgroundColor: MaterialStatePropertyAll(
//                                     Colors.green,
//                                   )),
//                               onPressed: () async {
//                                 User? user = await loginUsingEmailPassword(
//                                     email: _emailController.text,
//                                     password: _passwordController.text,
//                                     context: context);
//                                 print(user);
//                                 if (user != null) {
//                                   Navigator.of(context).push(MaterialPageRoute(
//                                     builder: (context) => Homepagemain(),
//                                   ));
//                                 }
//                               },

//                               //     Fluttertoast.showToast(
//                               //         msg: "Login Failed",
//                               //         toastLength: Toast.LENGTH_SHORT,
//                               //         gravity: ToastGravity.BOTTOM,
//                               //         timeInSecForIosWeb: 1,
//                               //         backgroundColor: Colors.cyan,
//                               //         textColor: Colors.red,
//                               //         fontSize: 16);
//                               //   }
//                               // },
//                               child: Text(
//                                 'Login Now',
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     color: Color.fromARGB(255, 203, 200, 200)),
//                               )),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         TextButton(
//                             onPressed: () {
//                               Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (context) => Signup()));
//                             },
//                             child: Text(
//                               "Don't have an account? SignUp",
//                               style: GoogleFonts.barlow(
//                                   textStyle:
//                                       TextStyle(color: Colors.deepPurple[600])),
//                             )),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           "Login With",
//                           style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.deepPurple[800]),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: Wrap(
//                             children: [
//                               Container(
//                                 height: 50,
//                                 width: 50,
//                                 decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     image: DecorationImage(
//                                         image: NetworkImage(
//                                             'https://toppng.com/uploads/preview/free-png-flat-facebook-logo-png-icon-circle-png-images-facebook-logo-png-round-11563073135dxynlut2ut.png'))),
//                               ),
//                               SizedBox(
//                                 width: 50,
//                               ),
//                               Container(
//                                   height: 48,
//                                   width: 48,
//                                   decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       image: DecorationImage(
//                                           image: NetworkImage(
//                                               'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/882px-Google_%22G%22_Logo.svg.png?20230305195327')))),
//                               SizedBox(
//                                 width: 50,
//                               ),
//                               Container(
//                                 height: 50,
//                                 width: 50,
//                                 decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     image: DecorationImage(
//                                         image: NetworkImage(
//                                             'https://www.freepnglogos.com/uploads/logo-ig-png/logo-ig-instagram-png-transparent-instagram-images-pluspng-3.png'))),
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:cycloproject_sample/CYCLOMOBPRO/Screens/Homepage.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: LoginScreen(),
//   ));
// }

// class LoginScreen extends StatefulWidget {

  
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
  
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children:  [
//          const  Text(
//             "Cyclo Rental App",
//             style: TextStyle(
//                 color: Colors.purple,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold),
//           ),
//           const Text(
//             "Login for the ride.",
//             style: TextStyle(
//                 color: Color.fromARGB(255, 183, 128, 193),
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           const TextField(
//             keyboardType: TextInputType.emailAddress,
//             decoration: InputDecoration(
//                 hintText: 'User email.',
//                 prefixIcon: Icon(
//                   Icons.mail,
//                   color: Colors.purpleAccent,
//                 )),
//           ),
//           const SizedBox(
//             height: 26,
//           ),
//           const TextField(
//             obscureText: true,
//             decoration: InputDecoration(
//                 hintText: 'Password',
//                 prefixIcon: Icon(
//                   Icons.password,
//                   color: Colors.purpleAccent,
//                 )),
//           ),
//           const SizedBox(
//             height: 12,
//           ),
//           const Text("Don't remember the password?",style: TextStyle(color: Colors.deepPurple),),
//          const SizedBox(height: 88,),
//                Container(  width: double.infinity,
//                child: RawMaterialButton(onPressed: (){},fillColor: Color.fromARGB(255, 200, 164, 206),elevation: 0.0,padding:EdgeInsets.symmetric(vertical: 20),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
//                child: Text('Login'),),)
          
               
       

//         ],
//       ),
//     );
//   }
// }
