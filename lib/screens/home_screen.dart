import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditation/screens/meditation_screen.dart';
import 'package:meditation/widgets/display_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void dispose() {
    super.dispose();
  }

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(alignment: AlignmentDirectional.bottomEnd, children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xff2D31AC),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(26),
                        bottomRight: Radius.circular(26)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 35.0, left: 20),
                        child: Text(
                          "DAY ${date.weekday}",
                          style: TextStyle(color: Colors.white70, fontSize: 17),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 20, bottom: 10),
                        child: Text(
                          "Love and accept yourself",
                          softWrap: true,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.network(
                      "https://cdn.discordapp.com/attachments/829019459904733188/848076147950747718/unknown.png",
                      scale: 2.5,
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Image.network(
                      "https://cdn.discordapp.com/attachments/829019459904733188/848076041662234664/unknown.png",
                      scale: 2.5,
                    )
                  ],
                )
              ]),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular",
                          style: TextStyle(fontSize: 22),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      maintainState: true,
                                      builder: (BuildContext context) =>
                                          MeditationScreen()));
                            },
                            child: Text("See all"))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    buildStreamBuilder()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "New",
                          style: TextStyle(fontSize: 22),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      maintainState: true,
                                      builder: (BuildContext context) =>
                                          MeditationScreen()));
                            },
                            child: Text("See all"))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    buildStreamBuilder(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> buildStreamBuilder() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('meditation').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container(
            height: 200,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: snapshot.data!.docs.map((document) {
                String time = document["time"].toString();
                return displayCard(
                    false,
                    document['title'],
                    document['description'],
                    "$time ",
                    document['url'],
                    context);
              }).toList(),
            ),
          );
        }
      },
    );
  }
}
