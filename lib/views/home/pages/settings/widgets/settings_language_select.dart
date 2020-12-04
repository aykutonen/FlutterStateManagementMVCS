import 'package:StateManagementMVCS/views/home/widgets/select_input_widget.dart';
import 'package:StateManagementMVCS/views/home/widgets/seperator.dart';
import 'package:StateManagementMVCS/views/home/widgets/sub_title.dart';

import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsLanguageSelect extends StatelessWidget {
  void _handleSelect(BuildContext context, String lang) {
    context.locale = Locale(lang, '');
  }

  @override
  Widget build(BuildContext context) {
    var lang = context.locale.languageCode;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubTitle(title: 'language'.tr()),
        const Seperator(height: 10.0),
        SelectInputWidget(
          isSelected: lang == 'tr',
          label: 'tr'.tr(),
          onTap: () => _handleSelect(context, 'tr'),
        ),
        const Divider(),
        SelectInputWidget(
          isSelected: lang != 'tr',
          label: 'en'.tr(),
          onTap: () => _handleSelect(context, 'en'),
        ),
      ],
    );
  }
}
