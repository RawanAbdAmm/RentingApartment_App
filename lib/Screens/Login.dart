import 'package:flutter/material.dart';

import 'Adminpage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final usernamecotro = TextEditingController();
    final passwordcotro = TextEditingController();

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 225, 246),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 111,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 110,
                backgroundImage:
                    AssetImage('images/Rentals_LP_Illustration3.png'),
              ),
            ),
            const Text(
              'Renting App',
              style: TextStyle(
                  color: Color.fromARGB(255, 205, 47, 36),
                  fontSize: 29,
                  fontFamily: 'Pacifico'),
            ),
            const Text(
              'Welcome',
              style: TextStyle(
                  color: Color.fromARGB(193, 205, 47, 36),
                  fontSize: 21,
                  fontWeight: FontWeight.bold),
            ),
            const Divider(
              color: Color(0xFF6C8090),
              thickness: 2,
              indent: 60,
              endIndent: 60,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              width: 390,
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    controller: usernamecotro,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 49, 103, 130))),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      prefixIcon: const Icon(
                        Icons.person_2_outlined,
                        color: Color(0xFF2B475E),
                      ),
                      hintText: 'username',
                      hintStyle:
                          const TextStyle(color: Color.fromARGB(122, 0, 0, 0)),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                  
                  
                    
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                    controller: passwordcotro,
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 49, 103, 130))),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      prefixIcon: const Icon(
                        Icons.password_outlined,
                        color: Color(0xFF2B475E),
                      ),
                      hintText: 'password',
                      hintStyle:
                          const TextStyle(color: Color.fromARGB(122, 0, 0, 0)),
                    ),
                  ),
                ]),
              ),
            ),
            ElevatedButton(
              
              onPressed: () {
              
                if (usernamecotro.text == 'admin' &&
                    passwordcotro.text == 'admin') {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) =>const Adminpage()),
                  );
                } else {
                  if (usernamecotro.text.isNotEmpty &&
                      passwordcotro.text.isNotEmpty &&
                      usernamecotro.text != 'admin'&& usernamecotro.text == 'user'&&passwordcotro.text=='user') {
                    // Navigator.of(context).pushReplacement(
                    //   // MaterialPageRoute(builder: (ctx) =>const Userpage()),
                    // );
                  } else {
                    if (usernamecotro.text.isEmpty ||
                        passwordcotro.text.isEmpty&& usernamecotro.text != 'admin'&& usernamecotro.text != 'user') {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title:const Text('Username and Password are required'),
                            
                            
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child:const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(' Username or Password not correct'),
                            content:const Text(
                                'Please enter the correct username and password.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 205, 47, 36)),
              ),
              child: const Text('Login'),
            )
          ],
        ));
  }
}
