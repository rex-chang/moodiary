import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import 'category_add_logic.dart';

class CategoryAddComponent extends StatelessWidget {
  const CategoryAddComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(CategoryAddLogic());
    final state = Bind.find<CategoryAddLogic>().state;
    final colorScheme = Theme.of(context).colorScheme;
    final i18n = AppLocalizations.of(context)!;

    return GetBuilder<CategoryAddLogic>(
      init: logic,
      assignId: true,
      builder: (logic) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Obx(() {
              return Wrap(
                spacing: 4.0,
                runSpacing: 4.0,
                alignment: WrapAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilledButton.icon(
                        icon: const Icon(Icons.add),
                        label: const Text('添加'),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: TextField(
                                    maxLines: 1,
                                    controller: logic.textEditingController,
                                    decoration: InputDecoration(
                                      fillColor: colorScheme.secondaryContainer,
                                      border: const UnderlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      labelText: '标签',
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          logic.cancelAdd();
                                        },
                                        child: Text(i18n.cancel)),
                                    TextButton(
                                        onPressed: () async {
                                          await logic.addCategory();
                                        },
                                        child: Text(i18n.ok))
                                  ],
                                );
                              });
                        },
                      ),
                      Text(state.categoryList.length.toString())
                    ],
                  ),
                  ...List.generate(state.categoryList.value.length, (index) {
                    return ActionChip(
                      label: Text(state.categoryList.value[index].categoryName),
                      onPressed: () {
                        logic.selectCategory(index);
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: EdgeInsets.zero,
                      backgroundColor: colorScheme.secondaryContainer,
                    );
                  }),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
