import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name = "";
  bool changedButton = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height:40,
              ),
            Image.asset("assets/images/login_image.png", 
            fit: BoxFit.cover,
            ),
            const SizedBox(
              height:20,
              ),
             Text(
              "Welcome $name",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )
            ),
            const SizedBox(
              height:20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                      ),
                      onChanged: (value){
                        name = value;
                        setState(() {
                          
                        });
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                    ),
                    const SizedBox(
                      height:40,
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          changedButton = true;
                        });
                        await Future.delayed(Duration(seconds: 1));
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changedButton? 150: 50,
                        height: 40,
                        child: changedButton?
                        const Icon(
                          Icons.done,
                          color: Colors.white,
                          )
                        :Text(
                          "Login", 
                          style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                         )
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          //shape: changedButton? BoxShape.circle: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(
                            changedButton? 50 : 8,
                          )
                        ),
                      ),
                    )
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   }, 
                    //   child: const Text("Login" ), 
                    //   style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                    //   )
                  ],
                ),
              ),
           ],
          ),
      )
    );
  }
}