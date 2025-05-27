import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

KeyboardActionsConfig keyboardActionsConfig({required FocusNode focusNode, required bool isFinal}) {
  return KeyboardActionsConfig(
    keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
    actions: [
      KeyboardActionsItem(
        focusNode: focusNode,
        displayDoneButton: true,
        displayArrows: false,
        toolbarButtons: [
          (node) => Container(
                margin: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                child: CupertinoButton(
                  borderRadius: BorderRadius.circular(20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  onPressed: (() => isFinal ? node.unfocus() : node.nextFocus()),
                  child: Text(
                    'done'.tr(),
                    style: TextStyle(color: CupertinoColors.systemBlue, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
        ],
      ),
    ],
  );
}
