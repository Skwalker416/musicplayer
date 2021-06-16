//  import 'package:audioplayers/audioplayers.dart';
import 'package:amharicmusic/audio_file.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPage extends StatefulWidget {
  final topChartsData;
  final favoriteData;
  final recentData;
  final int index;

  const AudioPage(
      {Key? key,
      this.topChartsData,
      this.favoriteData,
      this.recentData,
      required this.index})
      : super(key: key);

  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  late AudioPlayer advancedPlayer;
  @override
  void initState() {
    super.initState();
    advancedPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        // backgroundColor: Colors.blueGrey,
        body: Stack(children: [
      Positioned(
          top: 20,
          width: 370,
          height: 350,
          // height: screenHeight / 2.8,
          child: Container(color: Colors.black)),
      //   decoration: BoxDecoration(
      //       image: DecorationImage(
      //           image: AssetImage(
      //     "assets/images/aster2.jpg",
      //   ))),

      Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                advancedPlayer.stop();
                Navigator.of(context).pop();
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: () {},
              ),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          )),
      Positioned(
          left: 0,
          right: 0,
          top: screenHeight * 0.4,
          height: screenHeight * 0.5,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45), color: Colors.white),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: screenHeight * 0.07),
                Text(
                  this.widget.topChartsData[this.widget.index]["title"],
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  this.widget.topChartsData[this.widget.index]["text"],
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: screenHeight * 0.12),
                AudioFile(
                    advancedPlayer: advancedPlayer,
                    audioPath: this.widget.topChartsData[this.widget.index]
                        ["audio"]),
              ],
            ),
          )),
      Positioned(
        top: screenHeight * 0.12,
        left: (screenWidth - 150) / 2,
        right: (screenWidth - 150) / 2,
        height: screenHeight * 0.26,
        // child: Container(
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(20),
        //       border: Border.all(color: Colors.white, width: 2)),
        //   child: Padding(
        //     padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(20),
              shape: BoxShape.circle,
              border: Border.all(width: 2),
              image: DecorationImage(
                  image: AssetImage(
                      this.widget.topChartsData[this.widget.index]["img"]),
                  fit: BoxFit.cover)),
        ),
      ),
    ]));
  }
}
