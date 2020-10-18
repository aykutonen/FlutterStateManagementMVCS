import 'package:flutter/cupertino.dart';

class OnboardingPageContainer extends StatelessWidget {
  final List<Widget> body;
  final Widget footer;

  const OnboardingPageContainer({
    @required this.body,
    @required this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: body,
            ),
          ),
        ),
        footer,
      ],
    );
  }
}
