import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditation/widgets/display_card.dart';

class LessonScreen extends StatefulWidget {
  @override
  _LessonScreenState createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Practices",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 15.0, right: 15.0, top: 8.0, bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('meditation')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
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
                              true,
                              document['title'],
                              document['description'],
                              "$time minutes",
                              document['url'],
                              context);
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "All Practices",
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('meditation')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Container(
                      height: 350,
                      child: ListView(
                        children: snapshot.data!.docs.map((document) {
                          String time = document["time"].toString();
                          return Card(
                            child: ListTile(
                              onTap: () => showModalBottomsheet(context),
                              tileColor: Colors.white,
                              leading: Container(
                                width: 70,
                                height: 50,
                                child: Image.network(document['ilustration']),
                              ),
                              title: Text(
                                document['title'],
                              ),
                              subtitle: Text("$time minutes"),
                              trailing: IconButton(
                                icon: Icon(CupertinoIcons.heart),
                                onPressed: () {},
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
