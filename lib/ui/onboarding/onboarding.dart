import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wamui/routes/routes.gr.dart';
import 'package:wamui/services/authentication_service.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icon.png',
            height: 200,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Welcome to Trafiki, sign in to continue...",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          CupertinoButton(
              color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Sign in with google",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
              onPressed: () async {
                try {
                  await AuthenticationService.loginWithGoogle().then(
                      (value) => AutoRouter.of(context).push(HomeRoute()));
                } catch (e) {
                  showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                            title: Text("Error"),
                            content: Text(e.toString()),
                          ));
                }
              })
        ],
      ),
    ));
  }
}
