import 'package:flutter/material.dart';

ThemeData makeAppATheme() {
  const primaryColor = Color.fromARGB(255, 10, 3, 22);
  const primaryColorDark = Color.fromARGB(255, 6, 2, 13);
  const primaryColorLight = Color.fromARGB(255, 15, 5, 34);
  const secondaryColor = Color.fromRGBO(0, 77, 64, 1);
  const secondaryColorDark = Color.fromRGBO(0, 37, 26, 1);

  return ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColorLight,
    backgroundColor: primaryColor,
    secondaryHeaderColor:secondaryColorDark,
    
   appBarTheme: const AppBarTheme(backgroundColor:primaryColor),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: primaryColorDark,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryColorLight),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
      ),
      alignLabelWithHint: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryColor),
        overlayColor: MaterialStateProperty.all(primaryColorLight),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: primaryColor),
  );
}
