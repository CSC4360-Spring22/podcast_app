import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PodcastCard extends StatelessWidget {
  final String thumbnailUrl;
  final String pTitle;
  final String eTitle;
  final String eAudio;
  PodcastCard({
    required this.thumbnailUrl,
    required this.pTitle,
    required this.eTitle,
    required this.eAudio,
  });

  //audio player
  AudioPlayer audioPlayer = AudioPlayer();

  playMusic() async {
    await audioPlayer.play(eAudio);
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.35),
              BlendMode.multiply,
            ),
            image: NetworkImage(thumbnailUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: [
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                pTitle,
                style: TextStyle(
                  fontSize: 19,
                  color: Color.fromARGB(255, 113, 154, 231).withOpacity(1.0),
                  backgroundColor: Colors.black.withOpacity(1.0),
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.topLeft,
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                eTitle,
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white.withOpacity(1.0),
                  backgroundColor: Colors.black.withOpacity(1.0),
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.centerLeft,
          ),
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: IconButton(
                icon: const Icon(
                  Icons.favorite,
                  color: Color.fromARGB(255, 253, 253, 253),
                ),
                onPressed: () {},
              ),
            ),
            alignment: Alignment.bottomRight,
          ),
          Align(
            child: Row(
              children: [
                IconButton(
                    iconSize: 50,
                    color: Color.fromARGB(255, 60, 211, 248),
                    onPressed: () {
                      playMusic();
                    },
                    icon: Icon(Icons.play_arrow_rounded)),
                IconButton(
                    iconSize: 50,
                    color: Color.fromARGB(255, 60, 211, 248),
                    onPressed: () {
                      pauseMusic();
                    },
                    icon: Icon(Icons.pause)),
              ],
            ),
            alignment: Alignment.bottomRight,
          ),
        ]));
  }
}
