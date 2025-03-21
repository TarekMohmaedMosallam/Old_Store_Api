import 'package:flutter/material.dart';
import 'package:platzi_store/Platzi%20Store/view/Screen/HomeScreen.dart';
import 'package:platzi_store/Platzi%20Store/view/Widget_Reusable/TextField_Reusable.dart';

class LoginPageWorkbranch extends StatefulWidget {
  const LoginPageWorkbranch({super.key});

  @override
  State<LoginPageWorkbranch> createState() => _LoginPageWorkbranchState();
}

class _LoginPageWorkbranchState extends State<LoginPageWorkbranch> {
  var userName = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 50,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 60,
              child: TextfieldReusable(
                textEditingController: userName,
                text: "username",
                hidePassword: false,
                hidePasswordIcon: true,
              ),
            ),
            SizedBox(
              width: 250,
              height: 60,
              child: TextfieldReusable(
                textEditingController: password,
                text: "Password",
                hidePassword: true,
                hidePasswordIcon: false,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (userName.text == "tarek" && password.text == "tarek") {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  Homescreen()));
                    
                  }
                });
              },
              style: ElevatedButton.styleFrom(fixedSize: Size(150, 50)),
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
