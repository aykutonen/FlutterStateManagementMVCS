import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';

class NextPreviousButton extends StatelessWidget {
  final String nextButtonText;
  final String previousButtonText;
  final bool showPreviousButton;
  final VoidCallback onNextPressed;
  final VoidCallback onPrevioustPressed;

  const NextPreviousButton({
    this.nextButtonText = "next",
    this.previousButtonText = "previous",
    this.showPreviousButton = true,
    this.onNextPressed,
    this.onPrevioustPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        showPreviousButton
            ? CupertinoButton(
                child: Text(previousButtonText).tr(),
                onPressed: () => onPrevioustPressed(),
              )
            : Container(),
        CupertinoButton(
          child: Text(nextButtonText).tr(),
          onPressed: () => onNextPressed(),
        ),
      ],
    );
  }
}
