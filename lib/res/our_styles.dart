import 'package:cotadacao_moedas_app/res/our_colors.dart';
import 'package:flutter/material.dart';

class OurStyles {
  static const buttonOutlined = ButtonStyle(
    elevation: MaterialStatePropertyAll(0.0),
    side: MaterialStatePropertyAll<BorderSide>(
      BorderSide(
        color: OurColors.primary,
        width: 1,
      ),
    ),
    overlayColor: MaterialStatePropertyAll(OurColors.primary),
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

  static const textButtonOutlinedBegin = TextStyle(
      color: OurColors.text1,
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w400);

  static const textButtonFullOn = TextStyle(
      color: OurColors.backgroundAndText2,
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w400);

  static const textButtonFullOff = TextStyle(
      color: OurColors.body,
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

  static const textEmptyViewAndHistoric = TextStyle(
      color: OurColors.text1,
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w400);

  static const header = TextStyle(
      color: OurColors.primary,
      fontFamily: 'Poppins',
      fontSize: 20,
      fontWeight: FontWeight.w400);

  static const textNextHeader = TextStyle(
      color: OurColors.text1,
      fontFamily: 'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.w400);

  static const textNextHeaderBold = TextStyle(
      color: OurColors.text1,
      fontFamily: 'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.w700);
}
