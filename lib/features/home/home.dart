import 'package:flutter/material.dart';
import 'package:global_lang_ai/core/widgets/custom_app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  /*
   * For whoever continues working on this project: 
   * 
   * 
   * 
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(hasLeading: false,),

    );
  }
}