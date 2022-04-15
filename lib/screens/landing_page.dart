import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String bgImage = "assets/images/bg_landing.png";
    final String mapDotsImage = "assets/images/map_dots.png";
    final String saibImage = "assets/images/logo_saib.png";
    final String lineImage = "assets/images/line.png";

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            bgImage,
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Image.asset(
            mapDotsImage,
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      lineImage,
                      width: double.infinity,
                    ),
                    Image.asset(
                      saibImage,
                      width: MediaQuery.of(context).size.width * 0.7,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Welcome",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          buildRoundButton(context,
                              "assets/icons/ic_aboutus.png", "About Us"),
                          buildRoundButton(context,
                              "assets/icons/ic_locator.png", "ATM Locator"),
                          buildRoundButton(context,
                              "assets/icons/ic_locator.png", "Contact Us"),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    buildElevatedButton(context, "Login"),
                    SizedBox(height: 20),
                    buildElevatedButton(context, "Register"),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  ElevatedButton buildElevatedButton(BuildContext context, String text) {
    return ElevatedButton(
      onPressed: () => {Navigator.pushNamed(context, "/login")},
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFfdd734)),
      ),
      child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: 60,
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          )),
    );
  }

  Expanded buildRoundButton(BuildContext context, String image, String text) {
    return Expanded(
      child: InkWell(
        child: Column(
          children: [
            Image.asset(
              image,
              height: 45,
            ),
            SizedBox(height: 5),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
