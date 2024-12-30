import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tracking_app/core/utilities/style/app_images.dart';
class ErrorScreenWidget extends StatelessWidget {
  final String text;
  final String errorMassage;
  final void Function()? onPressed;
  final String? image;
  const ErrorScreenWidget(
      {super.key,
      required this.text,
      required this.errorMassage,
      this.onPressed,
      this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(image ?? AppImages.error, height: 150.h),
          Text(
              textAlign: TextAlign.center,
              errorMassage,
              maxLines: 3,
              style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600)),
          SizedBox(
            height: 14.h,
          ),
          SizedBox(
            width: 200.w,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    shape: const RoundedRectangleBorder()),
                onPressed: onPressed,
                child: Text(
                  text,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                )),
          )
        ],
      ),
    );
  }
}
