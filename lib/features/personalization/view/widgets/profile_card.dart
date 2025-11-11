import 'package:crypto_trading_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/images.dart';
import '../../../../utils/helpers/app_sizes.dart';

class ProfileCard extends StatelessWidget {
  final String? profileImageUrl;
  final String name;
  final String email;
  final String phoneNumber;

  const ProfileCard({
    super.key,
    this.profileImageUrl,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.width(90),
      height: AppSizes.height(25),
      decoration: BoxDecoration(
        borderRadius: AppSizes.borderRadius(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: AppSizes.borderRadius(5),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image(
                image: AssetImage(AppImages.profileCard),
                fit: BoxFit.cover,
              ),
            ),

            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: AppSizes.paddingSymmetric(vertical: 1),
                    child: Container(
                      width: AppSizes.width(25),
                      height: AppSizes.width(25),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: profileImageUrl != null
                            ? Image.network(
                          profileImageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(
                              Icons.person,
                              size: AppSizes.width(12),
                              color: Colors.grey,
                            );
                          },
                        )
                            : Icon(
                          Icons.person,
                          size: AppSizes.width(12),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),

                  Text(
                    name,
                    style: TextStyle(
                      fontSize: AppSizes.responsiveFont(2.8),
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: AppSizes.height(0.5)),

                  Text(
                    email,
                    style: TextStyle(
                      fontSize: AppSizes.responsiveFont(1.5),
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),

                  Text(
                    phoneNumber,
                    style: TextStyle(
                      fontSize: AppSizes.responsiveFont(1.5),
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}