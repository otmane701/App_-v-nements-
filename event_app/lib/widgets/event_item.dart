// ignore_for_file: prefer_const_constructors

import 'package:event_app/models/event.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Event_item extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripType;
  final Season season;
  // ignore: use_key_in_widget_constructors
  Event_item(
      {required this.title,
      required this.imageUrl,
      required this.duration,
      required this.tripType,
      required this.season});
  void selectTrip() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectTrip,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,                  
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
