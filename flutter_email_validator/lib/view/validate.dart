import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validators/validators.dart';

import '../view/home.dart';

class FinalView extends StatefulWidget {
  const FinalView({Key? key}) : super(key: key);

  @override
  State<FinalView> createState() => _FinalViewState();
}

class _FinalViewState extends State<FinalView> {
  TextEditingController textEditingController = TextEditingController();
  bool isEmailCorrect = false;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  dynamic snackBar = SnackBar(
    backgroundColor: Colors.green,
    duration: const Duration(milliseconds: 1500),
    content: const Text("Congrats!😁 Your Registration Complete"),
    action: SnackBarAction(
      label: 'Got it',
      textColor: Colors.white,
      onPressed: () {},
    ),
  );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
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
                Text(
                  "Enter Your Email :",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  isEmailCorrect == false ? "😴" : "😁",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                    color: Colors.black,
                    fontSize: 25,
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

  Widget buildLoginButton(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 45,
      child: ElevatedButton(
        onPressed: isEmailCorrect == false
            ? null
            : () {
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Future.delayed(const Duration(milliseconds: 1500))
                    .then((value) {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const HomePage()));
                });

                textEditingController.clear();
                isEmailCorrect = false;
                setState(() {});
              },
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          backgroundColor: isEmailCorrect == false
              ? MaterialStateProperty.all(Color.fromARGB(255, 212, 212, 212))
              : MaterialStateProperty.all(Colors.green),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Login",
            style: GoogleFonts.ubuntu(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget textField() {
    return TextField(
      controller: textEditingController,
      onChanged: (val) {
        setState(() {
          isEmailCorrect = isEmail(val);
        });
      },
      style: GoogleFonts.ubuntu(color: Colors.black),
      showCursor: true,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "somthing@email.com",
        hintStyle: GoogleFonts.ubuntu(color: Colors.grey, fontSize: 15),
        labelStyle: GoogleFonts.ubuntu(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300),
        prefixIcon: const Icon(
          Icons.email_outlined,
          color: Colors.black,
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
            borderSide: BorderSide(color: Colors.grey.shade700, width: 1),
            borderRadius: BorderRadius.circular(15)),
        floatingLabelStyle: GoogleFonts.ubuntu(
            color: Colors.grey.shade900,
            fontSize: 18,
            fontWeight: FontWeight.w300),
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
