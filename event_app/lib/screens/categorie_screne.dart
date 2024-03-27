// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../app_data.dart';
import '../widgets/category_item.dart';

class Categorei extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel_App',
      theme: ThemeData(
        // ignore: prefer_const_constructors
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 5, 21, 238)),
      ),
      home:Categorei_screne(),
     
    );
  }
}
// ignore: use_key_in_widget_constructors, camel_case_types
class Categorei_screne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        // ignore: prefer_const_constructors
        title: Text(
          'event app',
          // ignore: prefer_const_constructors
          style: TextStyle(
            fontSize: 40.0,
          ),
          ),
        // ignore: prefer_const_constructors
        leading: CircleAvatar(child: const FlutterLogo(),),
        backgroundColor: Colors.blue,
      ),
      body: GridView(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.all(10),
        // ignore: prefer_const_constructors
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7/8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          ),
          // ignore: prefer_const_literals_to_create_immutables
          children: Categories_data.map((categorydata)=>Category_item(categorydata.id,categorydata.title, categorydata.imageUrl),).toList(),
    ),
     );
  }
}
