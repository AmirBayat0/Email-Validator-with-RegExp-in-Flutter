import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import '../view/home.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController textEditingController = TextEditingController();
  bool isEmailCorrect = false;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  dynamic snackBar = SnackBar(
    duration: const Duration(milliseconds: 1500),
    content: const Text("Your Registration Complete"),
    action: SnackBarAction(
      label: 'Got it',
      onPressed: () {},
    ),
  );

  /////////////////////////////////////
  //@CodeWithFlexz on Instagram
  //
  //AmirBayat0 on Github
  //Programming with Flexz on Youtube
  /////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            backgroundColor:
                isEmailCorrect == false ? Colors.redAccent : Colors.green,
            centerTitle: true,
            elevation: 2,
            title: const Text("Email Validator"),
          ),
          body: Container(
            margin: const EdgeInsets.all(10),
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Enter Your Email :",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  isEmailCorrect == false ? "😴" : "😁",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: textField(),
                ),
                const SizedBox(
                  height: 20,
                ),
                buildLoginButton(context),
              ],
            ),
          )),
    );
  }

  ElevatedButton buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: isEmailCorrect == false
          ? null
          : () {
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Future.delayed(const Duration(milliseconds: 1500)).then((value) {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => const HomePage()));
              });

              textEditingController.clear();
              isEmailCorrect = false;
              setState(() {});
            },
      style: ButtonStyle(
        backgroundColor: isEmailCorrect == false
            ? MaterialStateProperty.all(const Color.fromARGB(255, 41, 41, 41))
            : MaterialStateProperty.all(Colors.green),
      ),
      child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20), child: Text("Login")),
    );
  }

  TextField textField() {
    return TextField(
      controller: textEditingController,
      onChanged: (val) {
        setState(() {
          isEmailCorrect = isEmail(val);
        });
      },
      style: const TextStyle(color: Colors.white),
      showCursor: true,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "somthing@email.com",
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
        labelStyle: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
        prefixIcon: const Icon(
          Icons.email_outlined,
          color: Colors.white,
        ),
        suffixIcon: isEmailCorrect == false
            ? const Icon(
                Icons.close_sharp,
                color: Colors.red,
              )
            : const Icon(
                Icons.done,
                color: Colors.green,
              ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200, width: 1),
            borderRadius: BorderRadius.circular(10)),
        floatingLabelStyle: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: isEmailCorrect == false ? Colors.red : Colors.green,
              width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
