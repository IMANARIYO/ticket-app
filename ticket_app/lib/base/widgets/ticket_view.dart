import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/widgets/app_column_layout.dart';
import 'package:ticket_app/base/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket_app/base/widgets/big_circle.dart';
import 'package:ticket_app/base/widgets/big_dot.dart';
import 'package:ticket_app/base/widgets/text_style_third.dart';
import 'package:ticket_app/base/widgets/text_styled_fourth.dart';

class TicketView extends StatelessWidget {
  final bool wholeScreen;
  final bool? isColor;
  final Map<String, dynamic> ticket;
  const TicketView({super.key, required this.ticket, this.wholeScreen = false,this.isColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        width: size.width * 0.85,
        height: 180,
        child: Container(
          // color: Colors.blue,
          margin: EdgeInsets.only(right: wholeScreen ? 0 : 16),
          child: Column(
            children: [
              // blue part of ticket
              Container(
                decoration: BoxDecoration(
                    color:isColor==null? AppStyles.ticketBlue:AppStyles.ticketColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(21),
                        topRight: Radius.circular(21))),
                // color: Colors.red,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // show departure and destination with icons first   line
                    Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextStyleThird(
                            text: ticket["from"]["code"],
                          isColor: isColor,),
                          Expanded(child: Container()),
                        BigDot(isColor: isColor,),
                          // ticket flying icon
                          Expanded(
                              child: Stack(children: [
                            const SizedBox(
                              height: 24,
                              child: AppLayoutBuilderWidget(
                                randomDivider: 6,
                              ),
                            ),
                            Center(
                              child: Transform.rotate(
                                angle: 1.5,
                                child: Icon(
                                  Icons.local_airport_rounded,
                                  color:isColor==null? Colors.white:AppStyles.planeSecondColor,
                                ),
                              ),
                            )
                          ])),
                          BigDot(isColor: isColor,),
                          Expanded(child: Container()),
                          TextStyleThird(
                            text: ticket["to"]["code"],isColor: isColor,
                          ),
                        ]),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            child: TextStyleFourth(
                              text: ticket["from"]["name"],isColor: isColor,
                            ),
                         ),
                          Expanded(child: Container()),
                          TextStyleFourth(
                            text: ticket["flying_time"],isColor: isColor,
                          ),
                          Expanded(child: Container()),
                          SizedBox(
                            width: 80,
                            child: TextStyleFourth(
                              text: ticket["to"]["name"],
                              align: TextAlign.end,isColor: isColor,
                            ),
                          ),
                        ])
                  ],
                ),
              ),
              //circles  and dots
              Container(
                height: 20,
                color:isColor==null? AppStyles.ticketOrange:AppStyles.ticketColor,
                child: Row(
                  children: [
                 BigCircle(
                      isRight: false,
                      isColor: isColor,
                    ),
                    Expanded(
                        child: AppLayoutBuilderWidget(
                      randomDivider: 16,
                      width: 6,
                      isColor: isColor,
                    )),
                    BigCircle(
                      isColor: isColor,
                      isRight: true,
                    ),
                  ],
                ),
              ),
              //orange part  of ticket
              Container(
                
                decoration: BoxDecoration(
                    color: isColor==null?AppStyles.ticketOrange:AppStyles.ticketColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(isColor==null?21:0),
                        bottomRight: Radius.circular(isColor==null?21:0))),
                // color: Colors.red,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // show departure and destination with icons first   line
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppColumnLayout(isColor: isColor,
                            topText: ticket["date"],
                            bottomText: "DATE",
                            alignment: CrossAxisAlignment.start,
                          ),
                          AppColumnLayout(isColor: isColor,
                            topText: ticket["departure_time"],
                            bottomText: "Departure time",
                            alignment: CrossAxisAlignment.center,
                          ),
                          AppColumnLayout(isColor: isColor,
                            topText: ticket["number"].toString(),
                            bottomText: "Number",
                            alignment: CrossAxisAlignment.end,
                          ),
                        ]),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
