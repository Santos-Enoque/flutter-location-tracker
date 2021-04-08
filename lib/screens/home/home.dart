import 'package:cadevo/providers/app.dart';
import 'package:cadevo/screens/authentication/auth.dart';
import 'package:cadevo/utils/helpers/screen_navigation.dart';
import 'package:cadevo/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black
        ),

        title: CustomText(
          text: "Cadevo",
          size: 18,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(accountName: Text("Santos"), accountEmail: Text("asb@asn.com")),
            ListTile(
              onTap: (){
                changeScreenReplacement(context, AuthenticationScreen());
              },
              leading: Icon(Icons.exit_to_app),
              title: Text("Log out"),
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          appProvider.activeDraggableWidget
        ],
      ),
    );
  }
}
