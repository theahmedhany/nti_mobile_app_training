import 'package:flutter/cupertino.dart';

import '../utils/responsive_helpers/sizer_helper_extension.dart';

class CustomProgressIndicator extends StatelessWidget {
  final Color? color;

  const CustomProgressIndicator({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: color,
        radius: context.setMinSize(32),
      ),
    );
  }
}
