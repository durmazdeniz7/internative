import 'package:flutter/material.dart';
import 'package:inter_native/core/token_helper.dart';
import 'package:inter_native/entities/sign_up_response.dart';
import 'package:inter_native/repo/sign_up_dao.dart';
import 'package:inter_native/views/login_page.dart';
import 'package:inter_native/views/page_state.dart';

class RegsiterPage extends StatefulWidget {
  const RegsiterPage({Key? key}) : super(key: key);

  @override
  _RegsiterPageState createState() => _RegsiterPageState();
}

class _RegsiterPageState extends State<RegsiterPage> {
  var mailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetryController = TextEditingController();
  SignUpDao signUpDao = SignUpDao();
  bool _obscureText = true;
  bool _obscureText2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Sign up",
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
            Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  obscureText: _obscureText,
                  controller: passwordRetryController,
                  decoration: InputDecoration(
                      hintText: "Re-Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                          onPressed: () {
                            _obscureText2 = !_obscureText2;
                            setState(() {});
                          },
                          icon: const Icon(Icons.remove_red_eye_sharp)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18))),
                )),
            GestureDetector(
                onTap: () async {
                  SignUpResponse signUpResponse = await signUpDao.signUp(
                      mailController.text,
                      passwordController.text,
                      passwordRetryController.text);
                  if (signUpResponse.hasError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(signUpResponse.message)));
                  } else {
                    await TokenHelper.addToken(
                        signUpResponse.signup?.token ?? "");
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const PageState()));
                  }
                },
                child: myButtons(Colors.grey.shade900, "Register", true)),
            GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: myButtons(Colors.white, "Login", false)),
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
