import 'package:flutter/material.dart';

import 'package:ticket_app/base/res/styles/app_styles.dart';

class Hotel extends StatelessWidget {
  final Map<String, dynamic> hotel;
  const Hotel({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: size.width * 0.6,
      height: 350,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: AppStyles.primaryColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: AppStyles.primaryColor,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage("assets/images/${hotel['image']}"), // Ensure 'hotel['image']' has the correct path
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              hotel['place'] ?? "Unknown Place", // Display dynamic place name
              style:
              AppStyles.headLineStyle2.copyWith(color: AppStyles.kakiColor),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              hotel['destination'] ?? "Unknown Destination", // Display dynamic destination
              style: AppStyles.headLineStyle3.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "\$${hotel['price'] ?? 0}/night", // Display dynamic price
              style:
              AppStyles.headLineStyle1.copyWith(color: AppStyles.kakiColor),
            ),
          ),
        ],
      ),
    );
  }
}
