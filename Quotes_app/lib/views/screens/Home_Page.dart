import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:quotes_app/Utils/Color_utils.dart';
import 'package:quotes_app/Utils/Quote_routs.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String selectedCategory = "art";
  Random r = Random();

  bool isgrid = false;

  @override
  void initState() {
    super.initState();
    geteducation();
  }

  geteducation()
  {
    int index = r.nextInt(alleducation.length);
    Future.delayed(Duration(milliseconds: 500),(){
      showDialog(context: context,
        builder: (context) => AlertDialog(
            title: Text("Lets Education"),
            content: Text(alleducation[index].quote),
            actions: [
            ElevatedButton(onPressed: (){
        Navigator.of(context).pop();
        },
        child: Text("Go To App"),
            ),
        ],
      )
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Quotes App"),
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                  isgrid = !isgrid;
                });
              },
              icon: Icon(
                isgrid ?Icons.list :Icons.grid_view_rounded,
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
                              color: selectedCategory == e ? Mybg : Colors.black38,
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
            ),
            Expanded(
              child: !isgrid ? ListView.builder(
                itemCount: allQuotes.length,
                itemBuilder:(context, index) => (allQuotes[index].category == selectedCategory)
                ?Card(
                  color: Colors.primaries[index%18].shade50,
                  child: ListTile(
                      isThreeLine: true,
                      leading: CircleAvatar(),
                      title: Text(allQuotes[index].quote),
                      subtitle: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          "- ${allQuotes[index].author}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                )
                :Container(),
              ) : SingleChildScrollView(
                child: StaggeredGrid.count(
                    crossAxisCount: 2,
                  children: List.generate(allQuotes.length, (index) => selectedCategory == allQuotes[index].category
                   ? StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: index % 2 == 0 ? 0.9 : 1.2,
                    child: Card(
                      color: Colors.primaries[index%18].shade50,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              allQuotes[index].quote,
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "- ${allQuotes[index].author}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ) : Container(),

                  )),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
