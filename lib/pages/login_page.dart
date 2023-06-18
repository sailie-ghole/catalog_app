import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name = "";
  bool changedButton = false;
  
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async { 
    if( _formKey.currentState!.validate()){

    setState(() {
      changedButton = true;
       });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changedButton = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height:40,
                ),
              Image.asset("assets/images/login2_image.png", 
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
                        validator: (value) {
                          if (value!.isEmpty){
                            return "Username cannot be Empty";
                          }
                        },
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
                        validator: (value) {
                          if (value!.isEmpty){
                            return "Password cannot be Empty";
                          }
                          else if(value.length < 6){
                            return "Password length should be atleast 6";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height:40,
                      ),
                      Material(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(
                                changedButton? 50 : 8,
                              ),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changedButton? 50: 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: changedButton 
                            ?Icon(
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
        ),
      )
    );
  }
}