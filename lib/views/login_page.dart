import 'package:flutter/material.dart';
import 'package:inter_native/core/token_helper.dart';
import 'package:inter_native/entities/sign_in_response.dart';
import 'package:inter_native/repo/sign_in_dao.dart';
import 'package:inter_native/views/page_state.dart';
import 'package:inter_native/views/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var mailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _obscureText = true;
  SignInDao signInDao = SignInDao();

  // Future<String> getTokenFromHelper() async {
  //   return await TokenHelper.getToken();
  // }

@override
  void initState() {
    super.initState();
   // getTokenFromHelper();
  }
  @override
  Widget build(BuildContext context) {
    // if (getTokenFromHelper()!="") {
      
    // }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.height / 4,
              color: Colors.blue,
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: mailController,
                  decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: const Icon(Icons.mail),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18))),
                )),
            Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  obscureText: _obscureText,
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {
                            _obscureText = !_obscureText;
                            setState(() {});
                          },
                          icon: const Icon(Icons.remove_red_eye_sharp)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18))),
                )),
            GestureDetector(
                onTap: () async {
                  SignInResponse signInResponse = await signInDao.signUp(
                      mailController.text, passwordController.text);
                  if (signInResponse.hasError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(signInResponse.message)));
                  } else {
                      await TokenHelper.addToken(
                        signInResponse.signIn?.token ?? "");
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const PageState()));
                  }
                },
                child: myButtons(Colors.grey.shade900, "Login", true)),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const RegsiterPage()));
                },
                child: myButtons(Colors.white, "Register", false)),
          ],
        ),
      ),
    );
  }

  Padding myButtons(Color color, String text, bool colorControl) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            color: color,
            borderRadius: BorderRadius.circular(20)),
        height: 50,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.login_outlined,
                size: 30,
                color: colorControl ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(
              width: 140,
            ),
            Text(
              text,
              style: TextStyle(
                  color: colorControl ? Colors.white : Colors.black,
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
