import 'package:flutter/material.dart';
import 'package:crypto_trading_app/shared/widgets/section_heading.dart';
import 'package:crypto_trading_app/shared/widgets/info_row.dart';
import 'package:crypto_trading_app/utils/constants/sizes.dart';
import 'package:crypto_trading_app/utils/helpers/app_sizes.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final List<InfoItem> items;

  const InfoCard({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: AppSizes.paddingAll(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppSizes.borderRadius(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: title, fontWeight: FontWeight.w700),
          SizedBox(height: Sizes.tilesSpace),

          ...items.map((item) => Padding(
            padding: EdgeInsets.only(bottom: AppSizes.height(.5)),
            child: CustomInfoRow(
              label: item.label,
              value: item.value.toString().padLeft(2, '0'),
              valueColor: item.valueColor,
            ),
          )),
        ],
      ),
    );
  }
}

class InfoItem {
  final String label;
  final dynamic value;
  final Color valueColor;

  InfoItem({
    required this.label,
    required this.value,
    required this.valueColor,
  });
}
