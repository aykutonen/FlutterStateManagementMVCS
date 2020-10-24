import 'package:StateManagementMVCS/commands/user_command.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddDrunkWater extends StatefulWidget {
  @override
  _AddDrunkWaterState createState() => _AddDrunkWaterState();
}

class _AddDrunkWaterState extends State<AddDrunkWater> {
  final _inputController = TextEditingController();
  String _error = "";
  bool _isLoading = false;

  void _handleSaveButton() async {
    setState(() => _isLoading = true);
    if (_inputController.value.text.isEmpty) {
      setState(() => _error = "Tüketim miktarı girmedin.");
    } else {
      setState(() => _error = "");
      var amount = int.tryParse(_inputController.value.text);
      if (amount == null || amount == 0) {
        setState(() => _error = "Geçersiz bir miktar girildi.");
      } else {
        FocusScope.of(context).unfocus();
        await UserCommand().addDrunk(amount);
        _inputController.text = "";
      }
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CupertinoTextField(
                controller: _inputController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                placeholder: 'Drunk water',
                placeholderStyle: TextStyle(
                  fontSize: 30,
                  color: CupertinoColors.lightBackgroundGray,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: CupertinoColors.lightBackgroundGray,
                    ),
                  ),
                ),
              ),
            ),
            CupertinoButton(
              child: Text('Kaydet'),
              onPressed: _handleSaveButton,
            ),
          ],
        ),
        Text(_error),
        if (_isLoading) CircularProgressIndicator(),
      ],
    );
  }
}
