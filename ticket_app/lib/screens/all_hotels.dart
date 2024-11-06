import 'package:flutter/material.dart';
import 'package:ticket_app/app_routes.dart';
import 'package:ticket_app/base/res/styles/app_styles.dart';
import 'package:ticket_app/base/utils/all_json.dart';

class AllHotels extends StatelessWidget {
  const AllHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: const Text("All Hotels"),
        backgroundColor: AppStyles.bgColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.9),
                      itemCount: hotelList.length,
                      itemBuilder:(context,index){
var singleHotel=hotelList[index];
              return HotelGridView(hotel:singleHotel,index:index);
            }
                ),
      ),

    );
  }
}

class HotelGridView extends StatelessWidget {
  final Map<String, dynamic> hotel;
  final int index;
  const HotelGridView({super.key, required this.hotel,required this.index});

  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
onTap: (){
  print("my index is $index");
  Navigator.pushNamed(context, AppRoutes.hotelDetail,arguments:{
    "index":index
  } );
},
      child: Container(
        padding: const EdgeInsets.all(8.0),
        // width: size.width * 0.6,
        height: 350,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: AppStyles.primaryColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: Container(
                decoration: BoxDecoration(
                  color: AppStyles.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage("assets/images/${hotel['image']}"), // Ensure 'hotel['image']' has the correct path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                hotel['place'] ?? "Unknown Place", // Display dynamic place name
                style:
                AppStyles.headLineStyle3.copyWith(color: AppStyles.kakiColor),
              ),
            ),
      
           Row(children: [
             Padding(
               padding: const EdgeInsets.only(left: 15),
               child: Text(
                 hotel['destination'] ?? "Unknown Destination", // Display dynamic destination
                 style: AppStyles.headLineStyle3.copyWith(color: Colors.white),
               ),
             ),
               const SizedBox(
               width: 5,
             ),
             Padding(
               padding: const EdgeInsets.only(left: 15),
               child: Text(
                 "\$${hotel['price'] ?? 0}/night", // Display dynamic price
                 style:
                 AppStyles.headLineStyle4.copyWith(color: AppStyles.kakiColor),
               ),
             ),
           ],)
          ],
        ),
      ),
    );
  }
}
