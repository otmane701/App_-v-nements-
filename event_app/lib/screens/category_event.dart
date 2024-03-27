import '../widgets/event_item.dart';
import 'package:flutter/material.dart';
import '../app_data.dart';

// ignore: use_key_in_widget_constructors, camel_case_types
class Category_event extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  Category_event(this.categoryId, this.categoryTitle);
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final filltredTrips=Trips_data.where((trip){
      return trip.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text(categoryTitle),
        ),
        // ignore: prefer_const_constructors
        body: ListView.builder(itemBuilder: (context, index) {
          return Event_item(
            title:filltredTrips[index].title,
             imageUrl: filltredTrips[index].imageUrl, 
             duration: filltredTrips[index].duration, 
             tripType: filltredTrips[index].tripType, 
             season: filltredTrips[index].season
          );
        },
        itemCount: filltredTrips.length,
        )
        );
  }
}
