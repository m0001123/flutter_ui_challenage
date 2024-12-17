import 'package:flutter/material.dart';

import '../app_layout.dart';
import '../style.dart';

class TicketLayoutContainer extends StatelessWidget {
  TicketLayoutContainer(
  {required this.firstText,super.key ,required this.firstHint, required this.secText,required this.secHint,this.a});

  String firstText,firstHint,secText,secHint;
  int? a =0 ;
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: a == 1 ?BorderRadius.only(topRight: Radius.circular(10),topLeft:Radius.circular(10)) : a==2 ? BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft:Radius.circular(10)) :null
      ),
      padding: EdgeInsets.all(16),
      width: size.width*0.8,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(firstText,style: Style.headLineStyle3.copyWith(color: Colors.black),),
              Text(firstHint,style: Style.headLineStyle4.copyWith(color: Colors.grey.shade500),)
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(secText,style: Style.headLineStyle3.copyWith(color: Colors.black),),
              Text(secHint,style: Style.headLineStyle4.copyWith(color: Colors.grey.shade500),)
            ],
          )
        ],
      ),
    );
  }
}
