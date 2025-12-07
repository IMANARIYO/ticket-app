// ignore_for_file: file_names

import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:ticket_app/base/res/media.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/utils/all_json.dart';
import 'package:ticket_app/base/widgets/app_column_layout.dart';
import 'package:ticket_app/base/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket_app/base/widgets/ticket_view.dart';
import 'package:ticket_app/screens/search/ticket/widgets/ticket_positioned_circle.dart';
import 'package:ticket_app/screens/search/widgets/app_tickets_tabs.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  late int ticketIndex = 0;
  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      var args = ModalRoute.of(context)!.settings.arguments as Map;
      // print("passed index ${args["index"]}");
      ticketIndex = args["index"];
    }

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyles.bgColor,
        appBar: AppBar(
          title: const Text('Ticket screen title'),
          backgroundColor: AppStyles.bgColor,
        ),
        body: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              children: [
                // const SizedBox(
                //   height: 40,
                // ),
                // Text(
                //   "tickets",
                //   style: AppStyles.headLineStyle1,
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                const AppTicketsTabs(
                    firstTab: "Upcoming", secondTab: "Previous"),
                const SizedBox(
                  height: 20,
                ),
                // white ticket
                Container(
                    // color: Colors.red,
                    padding: const EdgeInsets.only(left: 16),
                    child: TicketView(
                      ticket: ticketList[ticketIndex],
                      isColor: true,
                    )),
                const SizedBox(
                  height: 1,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  color: AppStyles.ticketColor,
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppColumnLayout(
                            isColor: true,
                            topText: "Flutter Db",
                            bottomText: "passenger",
                            alignment: CrossAxisAlignment.start,
                          ),
                          AppColumnLayout(
                            isColor: true,
                            topText: "5221 36869",
                            bottomText: "passport",
                            alignment: CrossAxisAlignment.end,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const AppLayoutBuilderWidget(
                        randomDivider: 15,
                        width: 5,
                        isColor: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppColumnLayout(
                            isColor: true,
                            topText: "2465 65849440",
                            bottomText: "Number Of E ticket ",
                            alignment: CrossAxisAlignment.start,
                          ),
                          AppColumnLayout(
                            isColor: true,
                            topText: "B46859",
                            bottomText: "Booking Code",
                            alignment: CrossAxisAlignment.end,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const AppLayoutBuilderWidget(
                        randomDivider: 15,
                        width: 5,
                        isColor: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    AppMedia.visaCard,
                                    scale: 11,
                                  ),
                                  Text(
                                    "***2462",
                                    style: AppStyles.headLineStyle3,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Payment  method",
                                style: AppStyles.headLineStyle4,
                              )
                            ],
                          ),
                          const AppColumnLayout(
                            isColor: true,
                            topText: "\$299.99",
                            bottomText: "price",
                            alignment: CrossAxisAlignment.end,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                // bottom of ticket detail section
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                      color: AppStyles.ticketColor,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(21),
                        bottomLeft: Radius.circular(21),
                      )),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: BarcodeWidget(
                            height: 70,
                            width: double.infinity,
                            data: "https://imanariyo-portfolio-web.vercel.app/",
                            drawText: false,
                            color: AppStyles.textColor,
                            barcode: Barcode.code128())),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // colorful ticket
                Container(
                    // color: Colors.red,
                    padding: const EdgeInsets.only(left: 16),
                    child: TicketView(
                      ticket: ticketList[ticketIndex],
                    )),
              ],
            ),
            const TicketPositionedCircle(
              pos: true,
            ),
            const TicketPositionedCircle(
              pos: null,
            )
          ],
        ));
  }
}
