import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mab_drive/Features/ride_requests/model/ride_request.dart';

import 'customer_request_details_dialog.dart';

class CustomerRequestCard extends StatelessWidget {
  const CustomerRequestCard({super.key, required this.rideRequest});

  final RideRequest rideRequest;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => customerRequestDetailsDialog(context: context),
      child: SizedBox(
        width: double.infinity,
        height: 85.h,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.w),
          ),
          color: const Color(0xff2C3333),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            child: Row(
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.w),
                        child: Image.network(rideRequest.photo),
                      ),
                    ),
                    Text(
                      rideRequest.name,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    const Text(
                      'now',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(width: 10.w),
                Column(
                  children: [
                    Text(
                      rideRequest.address,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'data data data',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                        children: [
                          TextSpan(
                              text: rideRequest.price,
                              style: const TextStyle(color: Colors.redAccent)),
                          WidgetSpan(child: SizedBox(width: 8.w)),
                          const TextSpan(text: '~1K'),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}