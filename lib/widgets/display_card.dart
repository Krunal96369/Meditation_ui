import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget displayCard(bool hasLikeButton, String title, String description,
    String time, String imgUrl, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: () => showModalBottomsheet(context),
      child: Container(
        height: 180,
        width: 320,
        decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 32),
                  ),
                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "$time minutes",
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              hasLikeButton
                  ? IconButton(
                      onPressed: () {
                        print("heart button pressed");
                      },
                      icon: Icon(
                        CupertinoIcons.heart,
                        color: Colors.white70,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    ),
  );
}

void showModalBottomsheet(BuildContext context) {
  var audioPlayer = AssetsAudioPlayer.newPlayer();
// bool isStoped = true;
  showModalBottomSheet(
      useRootNavigator: true,
      enableDrag: true,
      isDismissible: true,
      context: context,
      builder: (context) {
        return Container(
          height: 800,
          decoration: BoxDecoration(
              color: Colors.transparent,
// shape: BoxShape.rectangle,

              image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.fill,
                  alignment: Alignment.center)),
          child: ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.heart,
                  color: Colors.white,
                ),
              ),
              IconButton(
                  icon: Icon(
                    CupertinoIcons.play_circle,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    audioPlayer.open(
                      Audio("assets/audio/audio1.mp3"),
                      loopMode: LoopMode.single,
                      playInBackground: PlayInBackground.enabled,
                      notificationSettings: NotificationSettings(
                          seekBarEnabled: true,
                          stopEnabled: true,
                          playPauseEnabled: true),
                      showNotification: true,
                    );
                  }),
              IconButton(
                onPressed: () => audioPlayer.stop(),
                icon: Icon(
                  CupertinoIcons.pause_circle,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.slider_horizontal_3,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        );
      });
}
