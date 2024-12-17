import 'package:bookticket/Page/hotel_view.dart';
import 'package:bookticket/Page/ticket_view.dart';
import 'package:bookticket/app_info_list.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../app_layout.dart';
import '../style.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.appWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child:   FadeInDown(
            duration: Duration(milliseconds: 300),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Good morning',style: Style.headLineStyle3,),
                          SizedBox(height: AppLayout.getHeight(5),),
                          Text('Book Tickets',style: Style.headLineStyle1,),
                        ],
                      ),
                      Container(
                        height:AppLayout.getHeight(50),
                        width: AppLayout.getWidth(50),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/img_1.png'),
                            )
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: AppLayout.getHeight(25),),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(12),vertical: AppLayout.getHeight(2)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(FluentIcons.search_12_regular,color: Style.appGrey,),
                        hintText: 'Search',
                        hintStyle: Style.headLineStyle4,
                      ),
                    ),
                  ),
                  SizedBox(height: AppLayout.getHeight(35),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Upcoming Flights',style:Style.headLineStyle2,),
                      Text('View all',style: Style.headLineStyle4.copyWith(color: Style.primaryColor),)
                    ],
                  ),
                  SizedBox(height: AppLayout.getHeight(15),),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: ticketList.map((e) => Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: TicketView(ticket: e),
                        )).toList()
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Hotels',style:Style.headLineStyle2,),
                      Text('View all',style: Style.headLineStyle4.copyWith(color: Style.primaryColor),)
                    ],
                  ),
                  SizedBox(height: AppLayout.getHeight(15),),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: hotelList.map((e) => HotelView(hotel: e)).toList()
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
