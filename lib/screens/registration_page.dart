import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  String _userEmail = '';
  String _userName = '';
  String _password = '';
  String _confirmPassword = '';

  void _trySubmitForm() {
    final bool? isValid = _formKey.currentState?.validate();
    if (isValid == true) {
      debugPrint('Everything looks good!');
      debugPrint(_userEmail);
      debugPrint(_userName);
      debugPrint(_password);
      debugPrint(_confirmPassword);
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60.0),
                  child: Center(
                    child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        height: 100,
                        child: Image.asset(
                          'assets/images/salemgrouplogo.jpg',
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                //Email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(

                    decoration: const InputDecoration(
                        fillColor: Colors.grey,
                        focusColor: Colors.grey,
                        border: UnderlineInputBorder(),
                        labelText: 'Email',
                        hintText:
                            'Enter a valid email address as abc@gmail.com'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email address';
                      }
                      // Check if the entered email has the right format
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      // Return null if the entered email is valid
                      return null;
                    },
                    onChanged: (value) => _userEmail = value,
                  ),
                ),
                //Name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(

                    decoration: const InputDecoration(
                        border:  UnderlineInputBorder(),
                        labelText: 'Name',
                        hintText: 'Enter your name'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return '*This field is required';
                      }
                      if (value.trim().length < 3) {
                        return 'Name must be at least 4 characters in length';
                      }
                      // Return null if the entered name is valid
                      return null;
                    },
                    onChanged: (value) => _userName = value,
                  ),
                ),
                //Password
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter secure password'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return '*This field is required';
                      }
                      if (value.trim().length < 7) {
                        return 'Password must be at least 7 characters in length';
                      }
                      if (!RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)")
                          .hasMatch(value)) {
                        return 'Password should contain 1 Capital letter & Number & Special';
                      }
                      // Return null if the entered password is valid
                      return null;
                    },
                    onChanged: (value) => _password = value,
                    //validatePassword,
                  ),
                ),
                //Confirm Password
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Confirm password',
                        hintText: 'Re-enter password'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*This field is required';
                      }

                      if (value != _password) {
                        return 'Confimation password does not match the entered password';
                      }

                      return null;
                    },
                    onChanged: (value) => _confirmPassword = value,
                    //validatePassword,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(25)),
                  child: TextButton(
                    onPressed: _trySubmitForm,
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
