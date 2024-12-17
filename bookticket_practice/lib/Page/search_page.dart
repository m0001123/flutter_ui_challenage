import 'package:animate_do/animate_do.dart';
import 'package:bookticket/app_layout.dart';
import 'package:flutter/material.dart';

import '../style.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Style.appWhite,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInDown(
                  delay: Duration(milliseconds: 100),
                  child: Text(
                    'What are \nyou looking for?',
                    style: Style.headLineStyle1.copyWith(fontSize: 35),
                  ),
                ),
                SizedBox(
                  height: AppLayout.getHeight(20),
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 200),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xfff4f6fD),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const TabBar(
                      tabs: [
                        Tab(
                          text: 'Airline tickets',
                        ),
                        Tab(
                          text: 'Hotels',
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: AppLayout.getHeight(25),
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 200),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Icon(Icons.flight_takeoff_rounded,
                            color: Colors.grey.shade400),
                        SizedBox(
                          width: AppLayout.getWidth(10),
                        ),
                        Text(
                          'Departure',
                          style: Style.headLineStyle3
                              .copyWith(color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: AppLayout.getHeight(15),
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 200),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Icon(Icons.flight_land_rounded,
                            color: Colors.grey.shade400),
                        SizedBox(
                          width: AppLayout.getWidth(10),
                        ),
                        Text(
                          'Arrival',
                          style: Style.headLineStyle3
                              .copyWith(color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: AppLayout.getHeight(25),
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 100),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            backgroundColor: const Color(0xd91130ce),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text(
                          'Find Tickets',
                          style: Style.textStyle.copyWith(color: Colors.white),
                        )),
                  ),
                ),
                SizedBox(
                  height: AppLayout.getHeight(25),
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 300),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Upcoming Flights',
                        style: Style.headLineStyle2,
                      ),
                      Text(
                        'View all',
                        style: Style.headLineStyle4
                            .copyWith(color: Style.primaryColor),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: AppLayout.getHeight(25),
                ),
                FadeInDown(
                  delay: Duration(milliseconds: 400),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        height: AppLayout.getHeight(400),
                        width: AppLayout.getScreenWidth() * 0.42,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: 20,
                                spreadRadius: 1,
                              )
                            ]),
                        child: Column(
                          children: [
                            Container(
                              height: AppLayout.getHeight(190),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/images/sit.jpg'),
                                  )),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              '20% discount on business class ticktsfrom',
                              style: Style.headLineStyle2,
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(18),
                                height: AppLayout.getHeight(190),
                                width: AppLayout.getScreenWidth() * 0.44,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xff3abbbb),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Discount\nfor survey',
                                      style: Style.headLineStyle2
                                          .copyWith(color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Take the survey about our services and get discount',
                                      style: Style.headLineStyle4
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: -45,
                                right: -40,
                                child: Container(
                                  padding: EdgeInsets.all(30),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 18, color: Color(0xff189999))),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: AppLayout.getHeight(20),
                          ),
                          Container(
                            padding: EdgeInsets.all(18),
                            height: AppLayout.getHeight(190),
                            width: AppLayout.getScreenWidth() * 0.44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xffec6545),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Discount\nfor survey',
                                  style: Style.headLineStyle2
                                      .copyWith(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Take the survey about our services and get discount',
                                  style: Style.headLineStyle4
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
