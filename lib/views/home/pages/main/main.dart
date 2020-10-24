import 'package:StateManagementMVCS/commands/user_command.dart';
import 'package:StateManagementMVCS/models/app_model.dart';
import 'package:StateManagementMVCS/models/drunk_model.dart';
import 'package:StateManagementMVCS/models/unit_model.dart';
import 'package:StateManagementMVCS/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _inputController = TextEditingController();
  String _error = "";
  bool _isLoading = false;

// TODO: İçilmiş kayıtların gösterileceği liste.

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
    List<DrunkModel> drunks =
        context.select<UserModel, List<DrunkModel>>((e) => e.dailyDrunks);
    drunks.sort((a, b) => a.createDate.isAfter(b.createDate) ? 0 : 1);

    var totalAmount = context.select<UserModel, int>((e) => e.dailyTotalDrunk);
    var leastAmount =
        context.select<AppModel, int>((e) => e.targetAmount) - totalAmount;
    var leastAmountText =
        leastAmount < 0 ? "+${leastAmount * -1}" : "$leastAmount";

    var unit = context.select<AppModel, Unit>((e) => e.unit);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            if (_isLoading) CircularProgressIndicator(),
            Container(
              height: 200.0, //context.size.height / 10,
              child: Material(
                color: Colors.transparent,
                child: ListView.builder(
                  itemCount: drunks.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      contentPadding: EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 0, bottom: 0),
                      title: Text(
                          '${drunks[i].amount.toString()} ${drunks[i].unit.name}'),
                      subtitle: Text(
                        DateFormat("HH:mm").format(drunks[i].createDate),
                      ),
                    );
                  },
                ),
              ),
            ),
            Divider(
                indent: 10.0,
                endIndent: 10.0,
                height: 50.0,
                color: Colors.transparent),
            Text('Add Drink Water'),
            Divider(
                indent: 10.0,
                endIndent: 10.0,
                height: 50.0,
                color: Colors.transparent),
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
                Expanded(
                  child: CupertinoButton(
                    child: Text('Kaydet'),
                    onPressed: _handleSaveButton,
                  ),
                ),
              ],
            ),
            Text(_error),
            Divider(
              indent: 10.0,
              endIndent: 10.0,
              height: 50.0,
              color: Colors.transparent,
            ),
            Text('Tüketilen su miktarı $totalAmount ${unit.name}'),
            Text('Kalan su miktarı: $leastAmountText ${unit.name}'),
          ],
        ),
      ),
    );
  }
}
