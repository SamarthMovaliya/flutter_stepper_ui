import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

int indexIs = 0;
final SignUp = GlobalKey<FormState>();
final Login = GlobalKey<FormState>();

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Log in',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
          ),
          backgroundColor: Colors.red,
        ),
        body: Stepper(
          onStepCancel: () {
            setState(() {
              if (indexIs > 0) {
                --indexIs;
              }
            });
          },
          onStepContinue: () {
            setState(() {
              if (indexIs == 0) {
                if (SignUp.currentState!.validate()) {
                  SignUp.currentState!.save();
                  if (indexIs < 2) {
                    ++indexIs;
                  }
                }
              } else if (indexIs == 1) {
                if (Login.currentState!.validate()) {
                  Login.currentState!.save();
                  if (indexIs < 2) {
                    ++indexIs;
                  }
                }
              }
            });
          },
          currentStep: indexIs,
          steps: [
            Step(
                title: const Text('SignIn'),
                content: Form(
                  key: SignUp,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Full Name',
                        ),
                        onSaved: (val) {},
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please Enter Value';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Your Email',
                        ),
                        onSaved: (val) {},
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please Enter Value';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.password_rounded),
                          hintText: 'Password',
                        ),
                        onSaved: (val) {},
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please Enter Value';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.remove_red_eye),
                          hintText: 'Confirm Password',
                        ),
                        onSaved: (val) {},
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please Enter Value';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                )),
            Step(
                title: Text('Log In'),
                content: Form(
                  key: Login,
                  child: Column(
                    children: [
                      TextFormField(
                        onSaved: (val) {},
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please Enter Value';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'your User Name',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onSaved: (val) {},
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please Enter Value';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          hintText: 'Your Password',
                        ),
                      ),
                    ],
                  ),
                )),
            Step(
                title: Text('Log In'),
                content: Column(
                  children:const [
                    Text(
                      'Login Done',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 30,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
