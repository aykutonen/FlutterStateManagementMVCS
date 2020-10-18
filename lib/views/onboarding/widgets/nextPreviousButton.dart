import 'package:flutter/cupertino.dart';

class NextPreviousButton extends StatelessWidget {
  final String nextButtonText;
  final String previousButtonText;
  final bool showPreviousButton;
  final VoidCallback onNextPressed;
  final VoidCallback onPrevioustPressed;

  const NextPreviousButton({
    this.nextButtonText = "Next",
    this.previousButtonText = "Previous",
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
                child: Text(previousButtonText),
                onPressed: () => onPrevioustPressed,
              )
            : Container(),
        CupertinoButton(
          child: Text(nextButtonText),
          onPressed: () => onNextPressed(),
        ),
      ],
    );
  }
}
