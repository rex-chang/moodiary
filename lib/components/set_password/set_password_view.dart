import 'package:flutter/material.dart';
import 'package:moodiary/main.dart';
import 'package:refreshed/refreshed.dart';

import 'set_password_logic.dart';

class SetPasswordComponent extends StatelessWidget {
  const SetPasswordComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(SetPasswordLogic());
    final state = Bind.find<SetPasswordLogic>().state;

    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    final buttonSize =
        (textStyle.displayLarge!.fontSize! * textStyle.displayLarge!.height!);
    Widget buildNumButton(String num) {
      return Ink(
        decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest, shape: BoxShape.circle),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(buttonSize / 2)),
          onTap: () async {
            await logic.updatePassword(num, context);
          },
          child: Center(
              child: Text(
            num,
            style: textStyle.displaySmall,
          )),
        ),
      );
    }

    Widget buildDeleteButton() {
      return Ink(
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(buttonSize / 2)),
          onTap: () {
            logic.deletePassword();
          },
          child: const Icon(
            Icons.keyboard_backspace_rounded,
          ),
        ),
      );
    }

    List<Widget> buildPasswordIndicator() {
      return List.generate(4, (index) {
        return Icon(
          Icons.circle,
          size: 16,
          color: Color.lerp(
              state.password.length > index
                  ? colorScheme.onSurface
                  : colorScheme.surfaceContainerHighest,
              Colors.red,
              logic.animation.value),
        );
      });
    }

    return GetBuilder<SetPasswordLogic>(
      assignId: true,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16.0,
              children: [
                Text(
                  state.checkPassword.isEmpty
                      ? l10n.lockEnterPassword
                      : l10n.lockConfirmPassword,
                  style: textStyle.titleMedium,
                ),
                AnimatedBuilder(
                  animation: logic.animation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset:
                          Offset(logic.interpolate(logic.animation.value), 0),
                      child: Row(
                        spacing: 16.0,
                        mainAxisSize: MainAxisSize.min,
                        children: buildPasswordIndicator(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: buttonSize * 3 + 20,
                  child: GridView.count(
                    padding: EdgeInsets.zero,
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      buildNumButton('1'),
                      buildNumButton('2'),
                      buildNumButton('3'),
                      buildNumButton('4'),
                      buildNumButton('5'),
                      buildNumButton('6'),
                      buildNumButton('7'),
                      buildNumButton('8'),
                      buildNumButton('9'),
                      const SizedBox(),
                      buildNumButton('0'),
                      buildDeleteButton()
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
