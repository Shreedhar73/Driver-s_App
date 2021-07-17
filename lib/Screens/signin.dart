import 'package:driver_app/Helpers/app_colors.dart';
import 'package:driver_app/Services/auth_services.dart';
import 'package:driver_app/widgets/custom_appBar.dart';
import 'package:driver_app/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mdi/mdi.dart';
import 'package:get/get.dart';

import 'homeDashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _formKey = GlobalKey<ScaffoldState>();
  var email, password, token;
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                        child: Text("Login To your Accountxxxx",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headline5
                                .copyWith(
                                    fontSize: 18,
                                    color: AppColors.accentColor)),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintStyle: Theme.of(context).textTheme.caption,
                            labelText: "YOUR EMAIL",
                            labelStyle: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(color: AppColors.labelTextColor),
                          ),
                          validator: (value) {
                            value = value.trim();
                            if (value.isEmpty) return "Mandatory Field";

                            return null;
                          },
                          onChanged: (val) {
                            email = val;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintStyle: Theme.of(context).textTheme.caption,
                            labelText: "PASSWORD",
                            labelStyle: Theme.of(context)
                                .textTheme
                                .caption
                                .copyWith(color: AppColors.labelTextColor),
                            suffixIcon: IconButton(
                                icon: Icon(showPassword ? Mdi.eye : Mdi.eyeOff),
                                onPressed: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                }),
                          ),
                          validator: (value) {
                            if (value.isEmpty) return "Mandatory Field";

                            if (value.length > 20) return "password too long";
                            return null;
                          },
                          onChanged: (val) {
                            password = val;
                          },
                          obscureText: !showPassword,
                          enableInteractiveSelection: true,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                          label: "LOGIN",
                          onPress: () {
                            //TODO validate and navigate to dashboard.

                            ApiService().login(email, password).then((val) {
                              // if(val.data['success']){
                              //   token = val.data['token'];
                              if (val) {
                                Fluttertoast.showToast(
                                    msg: 'Authenticated',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 18.0);
                                Get.to(() => HomeDashboard());
                              }
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "or Login with",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .caption
                                .copyWith(color: AppColors.richTextColor),
                          ),
                        ),
                      ),
                      //TODO here we login using google or facebook.
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
