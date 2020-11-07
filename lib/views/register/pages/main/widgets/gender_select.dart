import 'package:StateManagementMVCS/models/gender_model.dart';
import 'package:flutter/cupertino.dart';

typedef selectHandleCallBack = void Function(Gender gender);

class RegisterGenderSelect extends StatefulWidget {
  final selectHandleCallBack selectHandler;
  const RegisterGenderSelect({this.selectHandler});

  @override
  _RegisterGenderSelectState createState() => _RegisterGenderSelectState();
}

class _RegisterGenderSelectState extends State<RegisterGenderSelect> {
  Gender _selectedGender;

  void selectGenderHandler(Gender gender) {
    setState(() => _selectedGender = gender);
    widget.selectHandler(gender);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Gender'),
        Flexible(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CupertinoButton(
                child: Text('Female'),
                onPressed: () => selectGenderHandler(Gender.f),
                color: _selectedGender == Gender.f
                    ? CupertinoColors.activeBlue
                    : CupertinoColors.systemGrey4,
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
              ),
              SizedBox(width: 10),
              CupertinoButton(
                  child: Text('Male'),
                  onPressed: () => selectGenderHandler(Gender.m),
                  color: _selectedGender == Gender.m
                      ? CupertinoColors.activeBlue
                      : CupertinoColors.systemGrey4,
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0)),
            ],
          ),
        ),
      ],
    );
  }
}
