import 'package:event_app/screens/category_event.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types, use_key_in_widget_constructors
class Category_item extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  Category_item(this.id,this.title, this.imageUrl);

  void selectCategorie(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (c) => Category_event(id,title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategorie(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,

            // ignore: sort_child_properties_last
            child: Text(
              title,
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),

            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(30)),
          )
        ],
      ),
    );
  }
}
