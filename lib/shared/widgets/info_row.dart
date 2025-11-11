import 'package:flutter/material.dart';
import '../../utils/helpers/app_sizes.dart';

class CustomInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;

  const CustomInfoRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: AppSizes.responsiveFont(1.5),
              color: Colors.grey[600],
              fontWeight: FontWeight.w400,
            ),
          ),
        ),

        Text(
          value,
          style: TextStyle(
            fontSize: AppSizes.responsiveFont(2),
            color: valueColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
