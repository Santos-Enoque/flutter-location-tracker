import 'package:cadevo/constants/asset_path.dart';
import 'package:cadevo/providers/app.dart';
import 'package:cadevo/screens/authentication/widgets/bottom_text.dart';
import 'package:cadevo/screens/authentication/widgets/login.dart';
import 'package:cadevo/screens/authentication/widgets/registration.dart';
import 'package:cadevo/utils/enums/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              bg3,
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.width / 1.3),

                SizedBox(
                  height: 20,
                ),

                Visibility(
                    visible: appProvider.screenToDisplay ==
                        AuthenticationScreenToDisplay.Login,
                    child: LoginWidget()),
                Visibility(
                    visible: appProvider.screenToDisplay ==
                        AuthenticationScreenToDisplay.Registration,
                    child: RegistrationWidget()),
                SizedBox(
                  height: 10,
                ),

                Visibility(
                  visible: appProvider.screenToDisplay ==
                      AuthenticationScreenToDisplay.Login,
                  child: BottomTextWidget(
                    onTap: () {
                      appProvider.changeAuthDisplayedScreen(
                          AuthenticationScreenToDisplay.Registration);
                    },
                    text1: "Don\'t have an account?",
                    text2: "Create account!",
                  ),
                ),

                Visibility(
                  visible: appProvider.screenToDisplay ==
                      AuthenticationScreenToDisplay.Registration,
                  child: BottomTextWidget(
                    onTap: () {
                      appProvider.changeAuthDisplayedScreen(
                          AuthenticationScreenToDisplay.Login);
                    },
                    text1: "Already have an account?",
                    text2: "Sign in!!",
                  ),
                ),
              ],
            ),
            Positioned(
              top: 150,
              left: 20,
              child: Image.asset(
                logo2,
                width: 140,
              ),
            )
          ],
        ),
      ),
    );
  }
}
