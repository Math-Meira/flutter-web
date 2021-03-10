import 'package:bakery/shared/colors.dart';
import 'package:bakery/shared/padaria_controller.dart';
import 'package:flutter/material.dart';

Widget formField(
    {String hint,
    String type,
    PadariaController padariaController,
    Icon prefix,
    bool obscure,
    Color textColor,
    Color hintColor,
    Color backColor,
    double width}) {
  return Container(
    width: width,
    margin: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: backColor,
    ),
    child: TextFormField(
      onChanged: (value) {
        if (type == "email") {
          padariaController.setEmail(value);
        } else if (type == "name") {
          padariaController.setName(value);
        } else if (type == "pass") {
          padariaController.setPass(value);
        }
      },
      //controller: controller,
      style: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16),
        prefixIcon: Container(
          margin: EdgeInsets.only(left: 12, right: 8),
          child: prefix,
        ),
        hintText: hint,
        hoverColor: textColor,
        hintStyle: TextStyle(
          fontFamily: "Roboto",
          color: hintColor,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: obscure,
    ),
  );
}

Widget buttonForm(
    {Color backColor,
    Color textColor,
    String text,
    double width,
    Function onTap}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
    child: InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        alignment: Alignment.center,
        height: 48,
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400],
              offset: Offset(0.0, 2.0), //(x,y)
              blurRadius: 2.0,
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "Roboto",
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
  );
}

Widget orRow() {
  Cores cores = Cores();
  return Row(
    children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  cores.cream,
                  cores.nude,
                ]),
          ),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          height: 2,
        ),
      ),
      Text(
        "ou",
        style: TextStyle(
          color: cores.nude,
          fontSize: 20,
          fontFamily: "PatuaOne",
          fontWeight: FontWeight.w500,
        ),
      ),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  cores.cream,
                  cores.nude,
                ]),
          ),
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          height: 2,
        ),
      ),
    ],
  );
}
