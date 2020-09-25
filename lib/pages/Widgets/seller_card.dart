import 'package:flutter/material.dart';

import '../../ThemeData.dart';

class SellerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                  "https://lavinephotography.com.au/wp-content/uploads/2017/01/PROFILE-Photography-112.jpg",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Amy James",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "GOA, GA",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: MyThemeData.inputPlaceHolder,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.star,
                        size: 16,
                        color: Color.fromRGBO(255, 193, 7, 1),
                      ),
                      Text(
                        "4.8",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: MyThemeData.inputPlaceHolder,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
