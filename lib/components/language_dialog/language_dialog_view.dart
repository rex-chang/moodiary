import 'package:flutter/material.dart';
import 'package:moodiary/common/values/language.dart';
import 'package:moodiary/main.dart';
import 'package:refreshed/refreshed.dart';

import 'language_dialog_logic.dart';

class LanguageDialogComponent extends StatelessWidget {
  const LanguageDialogComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final LanguageDialogLogic logic = Get.put(LanguageDialogLogic());

    return GetBuilder<LanguageDialogLogic>(
      assignId: true,
      builder: (_) {
        return SimpleDialog(
          title: Text(l10n.settingLanguage),
          children: List.generate(Language.values.length, (index) {
            return SimpleDialogOption(
              child: Obx(() {
                return Row(
                  spacing: 8.0,
                  children: [
                    Text(Language.values[index].l10nText),
                    if (logic.settingLogic.state.language.value ==
                        Language.values[index]) ...[
                      const Icon(Icons.check_rounded),
                    ],
                  ],
                );
              }),
              onPressed: () {
                logic.changeLanguage(Language.values[index]);
              },
            );
          }),
        );
      },
    );
  }
}
