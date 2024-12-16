import 'package:cached_network_image/cached_network_image.dart';
import 'package:barcode_widget/barcode_widget.dart';
import '/core/constant/api_end_point.dart';
import '/core/services/auth_services.dart';
import 'package:flutter/material.dart';
import '/core/utils/size_screen.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class CustomBarcodeWidget extends StatelessWidget {
  const CustomBarcodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = AuthServices.readCredentials();
    final Size size = SizeScreen.size(context: context);
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 65),
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: size.width * .7,
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          textDirection: TextDirection.ltr,
                          "@${userData!.username}",
                          style: AppStyle.kTextStyle18.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.kSurfaceColor,
                          ),
                        ),
                      ),
                      BarcodeWidget(
                        padding: const EdgeInsets.all(8),
                        data: userData.username ?? '--',
                        barcode: Barcode.qrCode(),
                        backgroundColor: AppColors.kSurfaceColor,
                        width: _reSize(size),
                        height: _reSize(size),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 5),
                        child: Text(
                          "Scan The Barcode",
                          style: AppStyle.kTextStyle18.copyWith(
                            color: AppColors.kSurfaceColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -50,
                  child: CircleAvatar(
                    radius: 65,
                    backgroundColor: AppColors.kSurfaceColor,
                    child: CircleAvatar(
                      backgroundColor: AppColors.kSurfaceColor,
                      backgroundImage: CachedNetworkImageProvider(
                        '${APIEndPoint.mediaBaseUrl}${userData.personalPicture!}',
                      ),
                      radius: 60,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  double _reSize(Size size) {
    if (size.width < 600) {
      if (size.width * .4 > 200) {
        return 200;
      } else {
        return size.width * .4;
      }
    } else {
      return 200;
    }
  }
}
