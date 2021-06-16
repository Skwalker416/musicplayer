// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';

// class AudioFile extends StatefulWidget {
//   final AudioPlayer advancedPlayer;

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'main_page.dart';
import 'audio_page.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer advancedPlayer;

  final String audioPath;

  const AudioFile(
      {Key? key, required this.audioPath, required this.advancedPlayer})
      : super(key: key);

  @override
  _AudioFileState createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  List topCharts = [];
  bool isPlaying = false;
  bool isPaused = false;
  bool isRepeat = false;
  Color color = Colors.black;
  List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];
  @override
  void initState() {
    super.initState();
    this.widget.advancedPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });
    this.widget.advancedPlayer.onAudioPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });
    this.widget.advancedPlayer.setUrl(this.widget.audioPath);
  }

  Widget btnNext() {
    return IconButton(
        icon: Icon(Icons.skip_next, size: 25, color: Colors.black),
        onPressed: () {
          this.widget.advancedPlayer.setPlaybackRate(playbackRate: 1.5);
        }
        // => Navigator.of(context).pop(MaterialPageRoute(
        //     builder: (context) => AudioPage(topChartsData: topCharts, index: 0))),
        );
  }

  Widget btnPrevious() {
    return IconButton(
      icon: Icon(Icons.skip_previous, size: 25, color: Colors.black),
      onPressed: () {
        this.widget.advancedPlayer.setPlaybackRate(playbackRate: 0.5);
      },
      // this.widget.advancedPlayer.set
    );
  }

  Widget btnRepeat() {
    return IconButton(
        icon: Icon(Icons.loop, size: 25, color: color),
        onPressed: () {
          if (isRepeat == false) {
            this.widget.advancedPlayer.setReleaseMode(ReleaseMode.LOOP);
            setState(() {
              isRepeat = true;
              color = Colors.blue;
            });
          } else if (isRepeat == true) {
            this.widget.advancedPlayer.setReleaseMode(ReleaseMode.RELEASE);

            color = Colors.black;
          }
        });
  }

  Widget btnShuffle() {
    return IconButton(
      icon: Icon(Icons.shuffle, size: 25, color: Colors.black),
      onPressed: () {},
    );
  }

  Widget bnStart() {
    return IconButton(
        padding: const EdgeInsets.only(bottom: 10),
        icon: isPlaying == false
            ? Icon(_icons[0], size: 60, color: Colors.blue)
            : Icon(_icons[1], size: 60, color: Colors.blue),
        onPressed: () {
          if (isPlaying == false) {
            this.widget.advancedPlayer.play(this.widget.audioPath);
            setState(() {
              isPlaying = true;
            });
          } else if (isPlaying == true) {
            this.widget.advancedPlayer.pause();

            setState(() {
              isPlaying = false;
            });
          }
        });
  }

  Widget slider() {
    return Slider(
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            changeToSecond(value.toInt());
            value = value;
          });
        });
  }

  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    this.widget.advancedPlayer.seek(newDuration);
  }

  Widget loadAsset() {
    return Container(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        btnRepeat(),
        btnPrevious(),
        bnStart(),
        btnNext(),
        btnShuffle(),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 28, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_position.toString().split(".")[0],
                    style: TextStyle(fontSize: 16)),
                Text(
                  _duration.toString().split(".")[0],
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
          slider(),
          loadAsset(),
        ],
      ),
    );
  }
}
