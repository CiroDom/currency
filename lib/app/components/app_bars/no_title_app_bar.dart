import 'package:cotadacao_moedas_app/res/our_colors.dart';
import 'package:flutter/material.dart';

class NoTitleAppBar extends StatelessWidget implements PreferredSizeWidget{
  const NoTitleAppBar({super.key, required this.buttonFunction});

  final VoidCallback buttonFunction;
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: OurColors.body,
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(
          Icons.close,
          color: OurColors.primary,
        ),
        onPressed: buttonFunction,
      ),
    );
  }
  
}