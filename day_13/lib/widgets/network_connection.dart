import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/constants.dart';
import '../utils/responsive_helpers/sizer_helper_extension.dart';

class NetworkConnection extends StatelessWidget {
  final Widget child;

  const NetworkConnection({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        List<ConnectivityResult> connectivity,
        Widget? child,
      ) {
        final bool connected = !connectivity.contains(ConnectivityResult.none);

        if (connected) {
          return this.child;
        } else {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/master/no_internet.svg',
                    height: context.setHeight(280),
                  ),
                  SizedBox(height: context.setHeight(20)),
                  Text(
                    'Can\'t connect .. Check your internet.',
                    style: TextStyle(
                      fontSize: context.setSp(18),
                      fontWeight: FontWeight.bold,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
      child: child,
    );
  }
}
