import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
       "https://www.google.com/imgres?imgurl=https%3A%2F%2Fmedia.licdn.com%2Fdms%2Fimage%2FC4D03AQHuvrh4NBYxtQ%2Fprofile-displayphoto-shrink_800_800%2F0%2F1658852977097%3Fe%3D2147483647%26v%3Dbeta%26t%3DoKyGDTISyD28mP19UKFNobWn1scI8ru5Mp_4n2z4VNw&tbnid=7xI59AjOXWKCSM&vet=12ahUKEwiIwIfgys3_AhVl2XMBHbi8AKgQMygEegUIARC7AQ..i&imgrefurl=https%3A%2F%2Fin.linkedin.com%2Fin%2Fsailie-ghole-b3737722a%3Ftrk%3Dpublic_profile_browsemap&docid=EjZUdLRkWgSpIM&w=800&h=800&q=sailie&ved=2ahUKEwiIwIfgys3_AhVl2XMBHbi8AKgQMygEegUIARC7AQ";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          //padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Sailie Ghole"),
                accountEmail: Text("gholesailie@gmaul.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.home, 
                  color: Colors.white,
                  ),
                  title: Text(
                    "Home",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled, 
                  color: Colors.white,
                  ),
                  title: Text(
                    "Profile",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.mail, 
                  color: Colors.white,
                  ),
                  title: Text(
                    "Email me",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
              )
          ],
        ),
      ),
    );
  }
}