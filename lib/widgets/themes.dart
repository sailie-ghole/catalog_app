import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch:Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
          fontFamily: 'OpenSans',
          fontSize: 20,
          color: Colors.black,
        ),
        )
        //primaryTextTheme: GoogleFonts.latoTextTheme(),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
  );
}