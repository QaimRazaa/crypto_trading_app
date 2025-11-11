import 'package:flutter/material.dart';

import '../../utils/helpers/app_sizes.dart';

class CustomNameRow extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomNameRow({super.key, 
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: AppSizes.paddingSymmetric(horizontal: 5, vertical: 2.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: AppSizes.font(2),
                color: isSelected ? Color(0xff0D6EFD) : Colors.black,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
            Container(
              width: AppSizes.width(6),
              height: AppSizes.width(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Color(0xff0D6EFD) : Color(0xffDFE2E4),
                  width: AppSizes.width(0.5),
                ),
              ),
              child: isSelected
                  ? Center(
                child: Container(
                  width: AppSizes.width(3),
                  height: AppSizes.width(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff0D6EFD),
                  ),
                ),
              )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}