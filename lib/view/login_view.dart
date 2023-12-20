import 'package:flutter/material.dart';
import 'package:mvvm_architecture/resource/components/round_button.dart';
import 'package:mvvm_architecture/utilies/routes/routes_name.dart';
import 'package:mvvm_architecture/utilies/utils.dart';
import 'package:mvvm_architecture/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
//controllers for storing the entered data
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  //focus  for textfield
  FocusNode emaialFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  //
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  //to realease the ram space
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emaialFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //initialise the auth provider
    final authViewModel = Provider.of<AuthViewModel>(context);
    //defining the  height of the screen
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(
              color: Color.fromARGB(255, 17, 150, 21),
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //text form field for email address
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emaialFocusNode,
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: "Enter Email Address",
                prefixIcon: Icon(
                  Icons.email,
                  color: Color.fromARGB(255, 39, 217, 45),
                ),
              ),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context, emaialFocusNode, passwordFocusNode);
              },
            ),
            //
            const SizedBox(
              height: 10,
            ),
            // text form fireld for user login password
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obsecurePassword.value,
                    obscuringCharacter: "#",
                    focusNode: passwordFocusNode,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter Password",
                      prefixIcon: const Icon(Icons.lock,
                          color: Color.fromARGB(255, 39, 217, 45)),
                      suffixIcon: InkWell(
                          onTap: () {
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: Icon(
                              _obsecurePassword.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color.fromARGB(255, 39, 217, 45))),
                    ),
                  );
                }),
            //sized box
            SizedBox(
              height: height * .09,
            ),
            //login button
            RoundButton(
              title: "Login",
              loading: authViewModel.loading,
              onpress: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage("Please Enter email", context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage("Please Enter password", context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage("Enter Strong Password", context);
                } else {
                  // Map data = {
                  //   "email": _emailController.text.trim().toString(),
                  //   "password": _passwordController.text.trim().toString()
                  // };
                  Map data = {
                    "email": "eve.holt@reqres.in",
                    "password": "cityslicka"
                  };
                  authViewModel.loginAPI(context, data);
                }
              },
            ),
            SizedBox(
              height: height * 0.02,
            ),
            //
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.signUp);
              },
              child: const Text("Don't have an Account? Sign Up"),
            ),
          ],
        ),
      )),
    );
  }
}
