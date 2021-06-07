import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditation/widgets/display_card.dart';

class MeditationScreen extends StatefulWidget {
  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('meditation').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // int len = snapshot.data!.size;
            return ListView.builder(
              itemCount: 11,
              itemBuilder: (BuildContext context, int index) {
                List<Widget> data = snapshot.data!.docs.map((document) {
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
                }).toList();
                return Container(child: data[index]);
              },
            );
          }
        },
      ),
    );
  }
}
