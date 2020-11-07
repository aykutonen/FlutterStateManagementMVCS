import 'package:StateManagementMVCS/commands/app_command.dart';
import 'package:StateManagementMVCS/models/gender_model.dart';
import 'package:StateManagementMVCS/views/home/widgets/seperator.dart';
import 'package:StateManagementMVCS/views/register/pages/main/widgets/gender_select.dart';
import 'package:StateManagementMVCS/views/register/pages/main/widgets/name.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// TODO: app start'da varsayılan değerleri önceden kaydet. Form kısmen dolu gelsin.
// Cinsiyet; Kadın, Unit ML, Wakeup 8:00, Sleep: 23:00

class RegisterMain extends StatefulWidget {
  @override
  _RegisterMainState createState() => _RegisterMainState();
}

class _RegisterMainState extends State<RegisterMain> {
  final _nameFocusNode = FocusNode();
  final _nameController = TextEditingController();

  @override
  void initState() {
    _nameFocusNode.addListener(_handleNameFocusChangeHandler);

    super.initState();
  }

  void _handleNameFocusChangeHandler() async {
    if (_nameFocusNode.hasFocus) return;
    if (_nameController.text.isNotEmpty) {
      await AppCommand().saveUsername(_nameController.text);
    }
  }

  void _selectGenderHandler(Gender gender) {
    print(gender);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: FocusScope.of(context).unfocus,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RegisterName(
            inputFocus: _nameFocusNode,
            inputController: _nameController,
          ),
          const Divider(height: 50),
          RegisterGenderSelect(selectHandler: _selectGenderHandler),
          const Divider(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(flex: 2, child: const Text('Weight (kg)')),
              Flexible(
                flex: 5,
                child: CupertinoTextField(
                  placeholder: 'Your kilos',
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
          const Divider(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Water Unit'),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CupertinoButton(
                      child: Text('ML'),
                      onPressed: () {},
                      color: CupertinoColors.activeBlue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                    ),
                    SizedBox(width: 10),
                    CupertinoButton(
                      child: Text('OZ'),
                      onPressed: () {},
                      color: CupertinoColors.activeBlue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Wakeup Time'),
              CupertinoButton(
                child: Text('When you wakeing up?'),
                onPressed: () {
                  showCupertinoModalPopup(
                    semanticsDismissible: true,
                    context: context,
                    builder: (BuildContext builder) {
                      return Container(
                        color: CupertinoColors.white,
                        height: MediaQuery.of(context).size.height / 3.5,
                        child: CupertinoTimerPicker(
                            mode: CupertinoTimerPickerMode.hm,
                            initialTimerDuration:
                                Duration(hours: 0, minutes: 0),
                            onTimerDurationChanged: (tm) {
                              print(tm.toString());
                            }),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          const Divider(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Sleep Time'),
              CupertinoButton(
                  child: Text('When you sleeping?'),
                  onPressed: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext builder) {
                        return Container(
                          color: CupertinoColors.white,
                          height: MediaQuery.of(context).size.height / 3.5,
                          child: CupertinoTimerPicker(
                              mode: CupertinoTimerPickerMode.hm,
                              initialTimerDuration:
                                  Duration(hours: 0, minutes: 0),
                              onTimerDurationChanged: (tm) {
                                print(tm.toString());
                              }),
                        );
                      },
                    );
                  }),
            ],
          ),
          Seperator(height: 50.0),
          SizedBox(
            width: double.infinity,
            child: CupertinoButton(
              child: Text('Save'),
              onPressed: () {},
              color: CupertinoColors.activeGreen,
            ),
          ),
        ],
      ),
    );
  }
}
