import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUgZX2sv_juHu_t-gZrYZwV2um0fcrbVu_0w&usqp=CAU";
    return Drawer(
      child: Container(
        color:MyTheme.creamColor,
        child: ListView(
          //padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("Sailie Ghole"),
                accountEmail: Text("gholesailie@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.home, 
                  color: MyTheme.darkBluishColor,
                  ),
                  title: Text(
                    "Home",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: MyTheme.darkBluishColor
                    ),
                  )
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled, 
                  color:MyTheme.darkBluishColor
                  ),
                  title: Text(
                    "Profile",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: MyTheme.darkBluishColor
                    ),
                  )
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.mail, 
                  color: MyTheme.darkBluishColor
                  ),
                  title: Text(
                    "Email me",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: MyTheme.darkBluishColor
                    ),
                  )
              )
          ],
        ),
      ),
    );
  }
}