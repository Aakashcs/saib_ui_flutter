import 'package:flutter/material.dart';
import 'package:saib_ui/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String bgImage = "assets/images/bg_landing.png";
  final String mapDotsImage = "assets/images/map_dots.png";
  final String saibImage = "assets/images/logo_saib.png";
  final String lineImage = "assets/images/line.png";
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
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
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: buildMainBody(context),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column buildMainBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10),
        Image.asset(
          lineImage,
          width: double.infinity,
        ),
        Image.asset(
          saibImage,
          width: MediaQuery.of(context).size.width * 0.7,
        ),
        SizedBox(height: 50),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                TextField(
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.white),
                  showCursor: true,
                  decoration: kTextFiledInputDecoration,
                ),
                SizedBox(height: 20),
                PasswordTextField(),
                SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                        value: _rememberMe,
                        checkColor: Colors.black,
                        fillColor: MaterialStateProperty.all(Colors.white),
                        onChanged: (bool) => {
                              setState(() {
                                _rememberMe = bool ?? false;
                              })
                            }),
                    Text(
                      "Remember Me",
                      style: Theme.of(context).textTheme.headline3,
                    )
                  ],
                ),
                SizedBox(height: 20),
                buildElevatedButton(context, "Login"),
                SizedBox(height: 10),
                TextButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () => {},
                  child: Text(
                    "Forgot Password?",
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(decoration: TextDecoration.underline),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: Theme.of(context).textTheme.headline3),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      onPressed: () => {},
                      child: Text(
                        "Register",
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            ?.copyWith(decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              buildRoundButton(context, "assets/icons/ic_aboutus.png"),
              buildRoundButton(context, "assets/icons/ic_locator.png"),
              buildRoundButton(context, "assets/icons/ic_locator.png"),
            ],
          ),
        ),
        SizedBox(height: 10)
      ],
    );
  }

  ElevatedButton buildElevatedButton(BuildContext context, String text) {
    return ElevatedButton(
      onPressed: () => {},
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

  Expanded buildRoundButton(BuildContext context, String image) {
    return Expanded(
      child: InkWell(
        child: Column(
          children: [
            Image.asset(
              image,
              height: 45,
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({Key? key}) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: !_isPasswordVisible,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      showCursor: true,
      decoration: kTextFiledInputDecoration.copyWith(
        labelText: "Password",
        suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: _isPasswordVisible ? Colors.white : Colors.grey,
          ),
          onPressed: () => {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            })
          },
        ),
      ),
    );
  }
}
