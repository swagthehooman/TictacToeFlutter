import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'playing_screen.dart';

class LandingScreens extends StatelessWidget {
  const LandingScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  'Tic Tac Toe',
                  style: GoogleFonts.pressStart2p(
                      fontSize: 32, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
                child: AvatarGlow(
              endRadius: 200,
              duration: const Duration(milliseconds: 2000),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/tic_image.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            )),
          ),
          // SizedBox(
          //   height: 30,
          // ),
          Expanded(
            child: Center(
              child: Container(
                width: 300,
                height: 80,
                //padding: EdgeInsets.all(30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    //fixedSize: const Size(300, 50),
                  ),
                  child: Text(
                    style: GoogleFonts.pressStart2p(fontSize: 20),
                    "Lets Play!",
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (builder) => PlayingScreen()));
                  },
                ),
              ),
            ),
          ),
          // SizedBox(
          //   height: 80,
          // ),
          Expanded(
            child: Center(
              child: Text(
                "Created By Swagnik.",
                style:
                    GoogleFonts.pressStart2p(fontSize: 14, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
