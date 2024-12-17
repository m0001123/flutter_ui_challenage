import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_layout.dart';
import '../style.dart';

class HotelView extends StatelessWidget {
  final Map<String,dynamic> hotel;
  const HotelView({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final size =  AppLayout.getSize(context);
    return Container(
      padding: EdgeInsets.all(AppLayout.getHeight(16)),
      decoration: BoxDecoration(
        color: Style.backgroundColor2,
        borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 20,
            spreadRadius: 10,
          )
        ]
      ),
      margin: EdgeInsets.only(right: 16),
      width: size.width*0.6,
      height: AppLayout.getHeight(380),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: AppLayout.getHeight(380*0.6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(hotel['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: AppLayout.getHeight(10),),
          Text(
            hotel['place'],
            style: Style.headLineStyle2.copyWith(color: Colors.white),
          ),
          SizedBox(height: AppLayout.getHeight(5),),
          Text(
            hotel['destination'],
            style: Style.headLineStyle3.copyWith(color: Colors.white),
          ),
          SizedBox(height: AppLayout.getHeight(5),),
          Text(
            '\$${hotel['price']}/night',
            style: Style.headLineStyle1.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
