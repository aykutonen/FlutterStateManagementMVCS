import 'package:StateManagementMVCS/models/view_model/register_model.dart';
import 'package:StateManagementMVCS/views/home/widgets/seperator.dart';
import 'package:StateManagementMVCS/views/register/pages/main/widgets/gender_select.dart';
import 'package:StateManagementMVCS/views/register/pages/main/widgets/name.dart';
import 'package:StateManagementMVCS/views/register/pages/main/widgets/weight.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO: app start'da varsayılan değerleri önceden kaydet. Form kısmen dolu gelsin.
// Cinsiyet; Kadın, Unit ML, Wakeup 8:00, Sleep: 23:00

class RegisterMain extends StatefulWidget {
  @override
  _RegisterMainState createState() => _RegisterMainState();
}

class _RegisterMainState extends State<RegisterMain> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  RegisterModel model = RegisterModel();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _weightFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      initialValue: model.toMap(),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: FocusScope.of(context).unfocus,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RegisterName(inputFocus: _nameFocusNode),
            const Divider(height: 50),
            RegisterGenderSelect(),
            const Divider(height: 50),
            RegisterWeight(inputFocus: _weightFocusNode),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 5.0),
                      ),
                      SizedBox(width: 10),
                      CupertinoButton(
                        child: Text('OZ'),
                        onPressed: () {},
                        color: CupertinoColors.activeBlue,
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 5.0),
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
                onPressed: () {
                  _formKey.currentState.save();
                  debugPrint(_formKey.currentState.value.toString());
                },
                color: CupertinoColors.activeGreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
