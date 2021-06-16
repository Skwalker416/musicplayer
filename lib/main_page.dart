import 'dart:convert';
import 'dart:math';

import 'package:amharicmusic/album_playlist.dart';

import 'package:amharicmusic/audio_fileRecent.dart';
import 'package:amharicmusic/audio_page.dart';
import 'package:amharicmusic/my_tabs.dart';
import 'package:flutter/material.dart';

import 'audio_fileFavorite.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  List albumArts = [];
  List topCharts = [];
  List favorite = [];
  List recent = [];
  ScrollController? _scrollController;
  TabController? _tabController;

  ReadData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/albumArts.json")
        .then((a) {
      setState(() {
        albumArts = json.decode(a);
      });
    });

    await DefaultAssetBundle.of(context)
        .loadString("json/favorite.json")
        .then((a) {
      setState(() {
        favorite = json.decode(a);
      });
    });
    await DefaultAssetBundle.of(context)
        .loadString("json/recent.json")
        .then((a) {
      setState(() {
        recent = json.decode(a);
      });
    });
    await DefaultAssetBundle.of(context)
        .loadString("json/topCharts.json")
        .then((a) {
      setState(() {
        topCharts = json.decode(a);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    ReadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white54,
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            title: Text("ቅኝት",
                style: Theme.of(context).textTheme.headline3!.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.blueAccent)),
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.account_circle,
                    color: Colors.blueAccent,
                    size: 30,
                  )),
              SizedBox(
                height: 10,
              )
            ],
          ),
          body: SafeArea(
            child: Container(
              child: Column(
                children: [
                  Container(
                      height: 180,
                      // width: 400,
                      child: Stack(children: [
                        Positioned(
                            top: 0,
                            left: -20,
                            right: 0,
                            child: Container(
                                height: 150,
                                child: PageView.builder(
                                    controller:
                                        PageController(viewportFraction: 0.5),
                                    itemCount: albumArts == null
                                        ? 0
                                        : albumArts.length,
                                    itemBuilder: (_, i) {
                                      return GestureDetector(
                                          onTap: () {
                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (context) =>
                                            //             AlbumPlaylist()));
                                          },
                                          child: Container(
                                              height: 180,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              margin: const EdgeInsets.only(
                                                  right: 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        albumArts[i]["img"]),
                                                    fit: BoxFit.fill),
                                              )));
                                    })))
                      ])),
                  Expanded(
                      child: NestedScrollView(
                    controller: _scrollController,
                    headerSliverBuilder: (BuildContext context, bool isScroll) {
                      return [
                        SliverAppBar(
                            pinned: true,
                            backgroundColor: Colors.white,
                            bottom: PreferredSize(
                                preferredSize: Size.fromHeight(10),
                                child: Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 20, left: 10),
                                    child: TabBar(
                                        indicatorPadding:
                                            const EdgeInsets.all(0),
                                        indicatorSize:
                                            TabBarIndicatorSize.label,
                                        labelPadding:
                                            const EdgeInsets.only(right: 30),
                                        controller: _tabController,
                                        isScrollable: true,
                                        indicator: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                blurRadius: 10,
                                                offset: Offset(0, 0),
                                              )
                                            ]),
                                        tabs: [
                                          Text(
                                            "Top Chart",
                                            style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: 24),
                                          ),
                                          Text(
                                            "Recent",
                                            style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 24,
                                            ),
                                          ),
                                          Text("Favorite",
                                              style: TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontSize: 24)),
                                        ]))))
                      ];
                    },
                    body: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                            itemCount: topCharts == null ? 0 : topCharts.length,
                            itemBuilder: (_, i) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AudioPage(
                                                topChartsData: topCharts,
                                                index: i)));
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 10,
                                          bottom: 10),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.blueGrey[100],
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 2,
                                                    offset: Offset(0, 0),
                                                    color: Colors.grey
                                                        .withOpacity(0.2))
                                              ]),
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            child: Row(children: [
                                              Container(
                                                width: 100,
                                                height: 120,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            topCharts[i]
                                                                ["img"]))),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(Icons.star,
                                                            size: 24,
                                                            color:
                                                                Colors.white54),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          topCharts[i]
                                                              ["rating"],
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white54),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      topCharts[i]["title"],
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: "Avenir",
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      topCharts[i]["text"],
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: "Avenir",
                                                          color: Colors
                                                              .blueAccent),
                                                    ),
                                                  ]),
                                            ]),
                                          ))));
                            }),
                        ListView.builder(
                            itemCount: recent == null ? 0 : recent.length,
                            itemBuilder: (_, i) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AudioPageR(
                                                recentData: recent, index: i)));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.blueGrey[100],
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 2,
                                                offset: Offset(0, 0),
                                                color: Colors.grey
                                                    .withOpacity(0.2))
                                          ]),
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blueGrey[100],
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          recent[i]["img"]))),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Icon(Icons.star,
                                                          size: 24,
                                                          color:
                                                              Colors.white54),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    recent[i]["title"],
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: "Avenir",
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    recent[i]["text"],
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: "Avenir",
                                                        color:
                                                            Colors.blueAccent),
                                                  ),
                                                ])
                                          ],
                                        ),
                                      ),
                                    ),
                                  ));
                            }),
                        ListView.builder(
                            itemCount: favorite == null ? 0 : favorite.length,
                            itemBuilder: (_, i) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AudioPageF(
                                                favoriteData: favorite,
                                                index: i)));
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 10,
                                          bottom: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.blueGrey[100],
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 2,
                                                  offset: Offset(0, 0),
                                                  color: Colors.grey
                                                      .withOpacity(0.2))
                                            ]),
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          child: Row(children: [
                                            Container(
                                              width: 100,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          favorite[i]["img"]))),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [],
                                                  ),
                                                  Text(
                                                    favorite[i]["title"],
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: "Avenir",
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    favorite[i]["text"],
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: "Avenir",
                                                        color:
                                                            Colors.blueAccent),
                                                  ),
                                                ]),
                                          ]),
                                        ),
                                      )));
                            }),
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        )));
  }
}
