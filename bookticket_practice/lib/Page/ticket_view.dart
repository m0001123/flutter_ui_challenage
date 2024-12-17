import 'package:bookticket/app_layout.dart';
import 'package:bookticket/widget/circle_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style.dart';

class TicketView extends StatelessWidget {
  const TicketView({super.key, required this.ticket});
  final Map<String,dynamic> ticket;
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Container(
      width: size.width*0.8,
      height: AppLayout.getHeight(180),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Style.backgroundColor2,
                borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(AppLayout.getHeight(20)),
                    topRight: Radius.circular(AppLayout.getHeight(20)))),
            padding:  EdgeInsets.all(AppLayout.getHeight(16)),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      ticket['from']['code'],
                      style: Style.headLineStyle3.copyWith(color: Colors.white),
                    ),
                    const Spacer(),
                    const CircleContainter(),
                    Expanded(
                        child: Stack(
                          children:[
                            SizedBox(
                              height: AppLayout.getHeight(24),
                              child: LayoutBuilder(
                                builder:
                                    (BuildContext context, BoxConstraints constraints) {
                                  return Flex(
                                      direction: Axis.horizontal,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: List.generate(
                                          (constraints.constrainWidth() / 6).floor(),
                                              (index) => Container(
                                            width: AppLayout.getWidth(3),
                                            height:AppLayout.getHeight(1),
                                            color: Colors.white,
                                          )));
                                },
                              ),
                            ),
                            Center(child:  Transform.rotate(angle: 1.55 ,
                                child: Icon(Icons.local_airport_rounded,color: Colors.white,)),)
                          ] ,
                        )),

                    const CircleContainter(),
                    const Spacer(),
                    Text(
                      ticket['to']['code'],
                      style: Style.headLineStyle3.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: AppLayout.getHeight(3),),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: AppLayout.getWidth(100),
                      child: Text(ticket['from']['name'],style: Style.headLineStyle4,),
                    ),
                    Text(ticket['flying_time'],style: Style.headLineStyle3,),
                    SizedBox(
                      width: AppLayout.getWidth(100),
                      child: Text(ticket['to']['name'],textAlign: TextAlign.end,style: Style.headLineStyle4,),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Style.appOrange,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(AppLayout.getHeight(20)),bottomRight: Radius.circular(20))
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: AppLayout.getHeight(20),
                      width: AppLayout.getWidth(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(AppLayout.getHeight(10)),
                          bottomRight: Radius.circular(AppLayout.getHeight(10)),
                        ),
                      ),
                    ),
                    Expanded(
                        child: LayoutBuilder(
                          builder:
                              (BuildContext context, BoxConstraints constraints) {
                            return Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: List.generate(
                                    (constraints.constrainWidth() / 15).floor(),
                                        (index) => Container(
                                      width: AppLayout.getWidth(5),
                                      height: AppLayout.getHeight(1),
                                      color: Colors.white,
                                    )));
                          },
                        ), ),
                    Container(
                      height: AppLayout.getHeight(20),
                      width: AppLayout.getWidth(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppLayout.getHeight(10)),
                          bottomLeft: Radius.circular(AppLayout.getHeight(10)),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: AppLayout.getWidth(16),vertical: AppLayout.getHeight(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ticket['date'],style: Style.headLineStyle3.copyWith(color: Colors.white),),
                          Text('DATE',style: Style.headLineStyle4.copyWith(color: Colors.white),),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(ticket['departure_time'],style: Style.headLineStyle3.copyWith(color: Colors.white),),
                          Text('Departure time',style: Style.headLineStyle4.copyWith(color: Colors.white),),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(ticket['number'].toString(),style: Style.headLineStyle3.copyWith(color: Colors.white),),
                          Text('Number',style: Style.headLineStyle4.copyWith(color: Colors.white),),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
