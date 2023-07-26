import 'package:flutter/material.dart';
import 'package:quotes_app/Utils/Color_utils.dart';
import 'package:quotes_app/Utils/Quote_routs.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quotes App"),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.grid_view_rounded,
              )
          ),
        ],
        backgroundColor: Mybg,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: allCategories.
                map(
                        (e) => GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedCategory = e;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: selectedCategory == e ? Mybg : Colors.green,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              e,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white
                              ),
                            ),
                          ),
                        )
                ).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
