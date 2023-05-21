import 'package:cotadacao_moedas_app/res/our_colors.dart';
import 'package:cotadacao_moedas_app/res/strings.dart';
import 'package:cotadacao_moedas_app/res/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({super.key, required this.emptyView});

  final bool emptyView;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: OurColors.body,
      elevation: 0.0,
      title: const Text(
        Strings.appBarTitle,
        style: Styles.titleAppBar,
      ),
      actions: [
        emptyView
          ? const SizedBox()
          : IconButton(
          icon: const Icon(
            CupertinoIcons.arrow_right_arrow_left,
            color: OurColors.primary,  
          ),
          onPressed: (){},
        ),
      ],
    );
  }
}
