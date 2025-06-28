import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../manager/weather_provider.dart';
import '../utils/constants.dart';

class CustomModelBottomSheet extends ConsumerWidget {
  const CustomModelBottomSheet({
    super.key,
    required this.size,
    required TextEditingController cityController,
  }) : _cityController = cityController;

  final Size size;
  final TextEditingController _cityController;

  Future<void> _handleSearch(
      BuildContext context, WidgetRef ref, String value) async {
    if (value.isNotEmpty) {
      try {
        ref.read(searchCityProvider.notifier).state = value;
        if (context.mounted) {
          Navigator.pop(context);
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text('City not found. Showing current location weather.'),
              duration: Duration(seconds: 2),
              backgroundColor: AppColors.kPrimaryColor,
            ),
          );
          Navigator.pop(context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.2,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 22),
            TextField(
              onSubmitted: (value) => _handleSearch(context, ref, value),
              controller: _cityController,
              autofocus: true,
              style: const TextStyle(
                color: AppColors.kPurpleColor,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.kPrimaryColor,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    if (_cityController.text.isNotEmpty) {
                      _handleSearch(context, ref, _cityController.text);
                    } else {
                      _cityController.clear();
                      Navigator.pop(context);
                    }
                  },
                  child: Icon(
                    _cityController.text.isEmpty
                        ? Icons.close_rounded
                        : Icons.check_rounded,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
                hintText: 'Search city e.g. London',
                hintStyle: const TextStyle(
                  color: AppColors.kPurpleColor,
                  fontSize: 18,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 2,
                    color: AppColors.kPurpleColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    width: 2,
                    color: AppColors.kPurpleColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
