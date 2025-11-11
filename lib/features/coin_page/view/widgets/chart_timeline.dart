import 'package:flutter/material.dart';
import 'package:crypto_trading_app/utils/helpers/app_sizes.dart';

class SmallLineChart extends StatelessWidget {
  const SmallLineChart({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: double.infinity,
              height: AppSizes.height(0.1),
              color: Colors.grey.shade300,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {
                return Container(
                  width: AppSizes.width(0.5),
                  height: AppSizes.height(1),
                  color: Colors.grey.shade300,
                );
              }),
            ),
          ],
        ),

        SizedBox(height: AppSizes.height(0.8)),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "04:16",
              style: TextStyle(
                fontSize: AppSizes.responsiveFont(1.4),
                color: Colors.grey.shade600,
              ),
            ),
            Text(
              "06:54",
              style: TextStyle(
                fontSize: AppSizes.responsiveFont(1.4),
                color: Colors.grey.shade600,
              ),
            ),
            Text(
              "09:18",
              style: TextStyle(
                fontSize: AppSizes.responsiveFont(1.4),
                color: Colors.grey.shade600,
              ),
            ),
            Text(
              "14:57",
              style: TextStyle(
                fontSize: AppSizes.responsiveFont(1.4),
                color: Colors.grey.shade600,
              ),
            ),
            Text(
              "16:29",
              style: TextStyle(
                fontSize: AppSizes.responsiveFont(1.4),
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
