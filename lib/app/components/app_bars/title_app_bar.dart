import 'package:cotadacao_moedas_app/res/our_colors.dart';
import 'package:cotadacao_moedas_app/res/our_strings.dart';
import 'package:cotadacao_moedas_app/res/our_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TitleAppBar({super.key, required this.emptyView, this.buttonFunction});

  final bool emptyView;
  final VoidCallback? buttonFunction;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: OurColors.body,
      elevation: 0.0,
      title: const Text(
        OurStrings.appBarTitle,
        style: OurStyles.titleAppBar,
      ),
      actions: [
        emptyView
            ? const SizedBox()
            : IconButton(
                icon: const Icon(
                  CupertinoIcons.arrow_right_arrow_left,
                  color: OurColors.primary,
                ),
                onPressed: buttonFunction,
              ),
      ],
    );
  }
  
}
