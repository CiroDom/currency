import 'package:cotadacao_moedas_app/res/our_colors.dart';
import 'package:flutter/material.dart';

class Styles {
  static const buttonOutlined = ButtonStyle(
    elevation: MaterialStatePropertyAll(0.0),
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.zero),
      side: BorderSide(
        color: OurColors.primary,
      ),
    )),
  );

  static const buttonFullOn = ButtonStyle(
    elevation: MaterialStatePropertyAll(0.0),
    backgroundColor: MaterialStatePropertyAll(OurColors.primary),
  );

  static const buttonFullOff = ButtonStyle(
    elevation: MaterialStatePropertyAll(0.0),
    backgroundColor: MaterialStatePropertyAll(OurColors.backgroundAndText2),
  );

  static const textButtonFull = TextStyle(
      color: OurColors.backgroundAndText2,
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w400);

  static const textButtonOutlined = TextStyle(
      color: OurColors.primary,
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w400);

  static const titleAppBar = TextStyle(
      color: OurColors.primary,
      fontFamily: 'Poppins',
      fontSize: 24,
      fontWeight: FontWeight.w400);

  static const currencyBtnUnselected = TextStyle(
      color: OurColors.text1,
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w700);

  static const currencyBtnSelected = TextStyle(
      color: OurColors.primary,
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w700);

  static const textEmptyView = TextStyle(
      color: OurColors.text1,
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w400);
}
