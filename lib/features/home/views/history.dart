import 'package:flutter/material.dart';
import 'package:global_lang_ai/core/utils/custom_list_handler.dart';
import 'package:global_lang_ai/core/widgets/custom_app_bar.dart';
import 'package:global_lang_ai/features/home/widgets/history_widget.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomListHandler(
        children: [for (int i = 0; i < 20; i++) HistoryWidget()],
      ),
    );
  }
}
