import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        elevation: 2,
        title: const Text("HOME"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.home,
              color: Colors.black,
              size: 150,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Welcome to Home Page Honey! 🌱",
              style: GoogleFonts.ubuntu(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
