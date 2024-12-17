import 'package:animate_do/animate_do.dart';
import 'package:bookticket/Page/ticket_view.dart';
import 'package:bookticket/style.dart';
import 'package:bookticket/widget/ticket_layout_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_info_list.dart';
import '../app_layout.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      appBar: AppBar(title: Text('Ticket',style: Style.headLineStyle1.copyWith(fontSize: 30),),backgroundColor: Style.appWhite,),
      backgroundColor: Style.appWhite,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           FadeInDown(delay:const Duration(milliseconds: 100),child: TicketView(ticket: ticketList[0])),
           FadeInDown(delay:const Duration(milliseconds: 200),child: TicketLayoutContainer(firstText: 'Flutter DB',firstHint: 'Passenger',secText: '5221 364869',secHint: 'passport',a: 1,)),
            const SizedBox(height: 2,),
            FadeInDown(delay:const Duration(milliseconds: 200),child: TicketLayoutContainer(firstText: '364738 28274478',firstHint: 'Number of E-ticket',secText: 'B2SG28',secHint: 'Booking code',)),
            const SizedBox(height: 2,),
            FadeInDown(delay:const Duration(milliseconds: 200),child: TicketLayoutContainer(firstText: '364738 28274478',firstHint: 'Number of E-ticket',secText: 'B2SG28',secHint: 'Booking code',)),
            const SizedBox(height: 2,),
            FadeInDown(delay:const Duration(milliseconds: 200),child: TicketLayoutContainer(firstText: 'Visa ****4238',firstHint: 'Payment',secText: '\$249.99',secHint: 'Price',a:2)),
          ],
        ),
      )
    );
  }
}
