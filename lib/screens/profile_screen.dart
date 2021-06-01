import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.heart_fill,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF2D31AC),
                      radius: 40,
                      child: Image.network(
                          "https://cdn.discordapp.com/attachments/829019459904733188/848076041662234664/unknown.png"),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Natalia Lebediva",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.book,
                          ),
                          color: Color(0xFF2D31AC),
                          padding: EdgeInsets.all(10),
                        ),
                        Text(
                          "Practices",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Session",
                            style: TextStyle(color: Colors.grey, fontSize: 15)),
                        SizedBox(
                          width: 20,
                        ),
                        Text("13",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w400)),
                        SizedBox(
                          width: 25,
                        ),
                        Text("Time",
                            style: TextStyle(color: Colors.grey, fontSize: 15)),
                        SizedBox(
                          width: 20,
                        ),
                        Text("4:23:04",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w400)),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.play_circle_fill,
                          ),
                          color: Color(0xFFFB9B9C),
                          padding: EdgeInsets.all(10),
                        ),
                        Text(
                          "Meditations",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Session",
                            style: TextStyle(color: Colors.grey, fontSize: 15)),
                        SizedBox(
                          width: 20,
                        ),
                        Text("06",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w400)),
                        SizedBox(
                          width: 25,
                        ),
                        Text("Time",
                            style: TextStyle(color: Colors.grey, fontSize: 15)),
                        SizedBox(
                          width: 20,
                        ),
                        Text("0:55:04",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w400)),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                child: Image.network(
                  "https://cdn.discordapp.com/attachments/829019459904733188/848887787414487040/unknown.png",
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
