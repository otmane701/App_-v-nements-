import 'package:event_app/screens/categorie_screne.dart';
import 'package:event_app/screens/sing_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TextField Validation',
      home: MyForm(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyForm extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  // ignore: prefer_final_fields
  TextEditingController _emailController = TextEditingController();
  // ignore: prefer_final_fields
  TextEditingController _passwordController = TextEditingController();

  bool _isVisibility = false;
  bool ispasswordstatus = false;
  bool hasPasswordOneNumber = false;

  // ignore: prefer_final_fields
  FocusNode _emailFocusNode = FocusNode();
  // ignore: prefer_final_fields
  FocusNode _passwordFocusNode = FocusNode();

  onpasswordchange(String password) {
    final numberredexp = RegExp(r'[0-9]');
    setState(() {
      ispasswordstatus = false;
      if (password.length >= 8) {
        ispasswordstatus = true;
      }

      hasPasswordOneNumber = false;
      if (numberredexp.hasMatch(password)) {
        hasPasswordOneNumber = true;
      }
    });
  }

  bool isEmailValid(String email) {
    return RegExp(r'^[\w-\.]+@[a-zA-Z]+\.[a-zA-Z]{3,}$').hasMatch(email);
  }

  bool isPasswordValid(String password) {
    return RegExp(r'^(?=.[a-z])(?=.[A-Z])(?=.*\d).{8,}$').hasMatch(password);
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // ignore: avoid_print
      print('Email: ${_emailController.text}');
      // ignore: avoid_print
      print('Password: ${_passwordController.text}');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Categorei()));
    }
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          backgroundColor: Color.fromARGB(255, 219, 216, 212),
          centerTitle: true,
          elevation: 0,
          title: const Text(
            "Login In  ",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background_login.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // ignore: prefer_const_constructors
                    SizedBox(height: 100),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) {
                        if (val!.length > 30) {
                          return "Email il ne peut pas dépasser 30 caractères";
                        }
                        if (val.length < 15) {
                          return "Email il ne peut pas avoir moins de 15 caractères ";
                        }
                        return null;
                      },
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.blue,
                          ),
                          hintText: "Email",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(height: 20),
                    TextFormField(
                      validator: (val) {
                        if (val!.length > 30) {
                          return "Password il ne peut pas dépasser 30 caractères";
                        }
                        if (val.length < 8) {
                          return "Password il ne peut pas avoir moins de 8 caractères ";
                        }
                        return null;
                      },
                      onChanged: (password) {
                        // ignore: void_checks
                        return onpasswordchange(password);
                      },
                      obscureText: !_isVisibility,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.blue,
                          ),
                          hintText: "Password",
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isVisibility = !_isVisibility;
                                });
                              },
                              icon: _isVisibility
                                  ? const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey,
                                    )),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: MaterialButton(
                        onPressed: () {
                          _submitForm();
                        },
                        height: 50,
                        minWidth: double.infinity,
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: const Text(
                          "LOGIN IN",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.only(left: 210),
                      child: Text(
                        "Forget Password ? ",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: Row(
                        children: [
                          const Text(
                            "Create an account ?",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SignUp()));
                              },
                              child: const Text(
                                "Sign Up",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 20),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
