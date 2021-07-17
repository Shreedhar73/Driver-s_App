import 'package:driver_app/Helpers/app_colors.dart';
import 'package:driver_app/Models/user.dart';
import 'package:driver_app/widgets/custom_tile.dart';
import 'package:driver_app/Services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // child: FutureBuilder<User>(
        //     future: ApiService().userdetails(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         final users = snapshot.data;

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //header

            FutureBuilder<User>(
              future: ApiService().userdetails(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final users = snapshot.data;
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 32),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: AppColors.accentColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          title: Text(
                            users.payload.userDetails.fullName,
                            style: TextStyle(
                                color: AppColors.borderColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            users.payload.userDetails.email,
                            style: TextStyle(
                                color: AppColors.borderColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18),
                          child: Text(
                            users.payload.userDetails.address,
                            style: TextStyle(
                                color: AppColors.borderColor,
                                fontWeight: FontWeight.w300),
                          ),
                        )
                      ],
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: AppColors.red,
                  ),
                );
              },
            ),

            SizedBox(
              height: 20,
            ),

            //Current Order
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.testNumberColor,
              ),
              width: double.infinity,
              height: 130,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                children: [
                  Center(
                    child: Text("Hello"),
                  )
                ],
              ),
            ),

            //dashboard
            FutureBuilder(
              future: ApiService().dashboarddetails(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final dashboard = snapshot.data;
                  return Container(
                    child: Text(dashboard.message),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.red,
        unselectedItemColor: AppColors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_add), label: "Add "),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
