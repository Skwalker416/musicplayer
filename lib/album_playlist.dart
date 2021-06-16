// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'audio_page.dart';
// import 'main_page.dart';

// class AlbumPlaylist extends StatefulWidget {
//   AlbumPlaylist({Key? key}) : super(key: key);

//   @override
//   _AlbumPlaylistState createState() => _AlbumPlaylistState();
// }

// class _AlbumPlaylistState extends State<AlbumPlaylist>
//     with TickerProviderStateMixin {
//   List albumArts = [];
//   List mahmuds = [];
//   ScrollController? _scrollController;
//   TabController? _tabController;

//   ReadData() async {
//     await DefaultAssetBundle.of(context)
//         .loadString("json/mahmud.json")
//         .then((s) {
//       setState(() {
//         albumArts = json.decode(s);
//       });
//     });
//     await DefaultAssetBundle.of(context)
//         .loadString("json/mahmuds.json")
//         .then((s) {
//       setState(() {
//         mahmuds = json.decode(s);
//       });
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     _scrollController = ScrollController();
//     ReadData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaQuery.of(context).size.height;
//     final double screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//         body: CustomScrollView(slivers: [
//       SliverAppBar(
//           expandedHeight: 400,
//           floating: false,
//           pinned: true,
//           flexibleSpace: FlexibleSpaceBar(
//             title: Text("መሃሙድ አህመድ"),
//             background:
//                 Image.asset("assets/images/mahmud2.jpeg", fit: BoxFit.cover),
//           )),
      
//       SliverFillRemaining(
      
//           child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//         Container(
//           alignment: Alignment.centerLeft,
//           height: 100,
//           width: 100,
//           decoration: BoxDecoration(
//               color: Colors.blue, borderRadius: BorderRadius.circular(20)),
//         ),
//         Container(
//           alignment: Alignment.center,
//           height: 100,
//           width: 100,
//           decoration: BoxDecoration(
//               color: Colors.blue, borderRadius: BorderRadius.circular(20)),
//         )
//       ]))
//     ]));
//   }
// }
//       //   body: Stack(children: [
//       // Positioned(
//       //     top: 20,
//       //     width: 370,
//       //     height: 350,
//       //     // height: screenHeight / 2.8,
//       //     child: Container(
//       //         decoration: BoxDecoration(
//       //             image: DecorationImage(
//       //                 image: AssetImage(
//       //       "assets/images/aster2.jpg",
//       //       //   ))),
//       //     ))))),
//       // Positioned(
//       //     top: 0,
//       //     left: 0,
//       //     right: 0,
//       //     child: AppBar(
//       //       leading: IconButton(
//       //         icon: Icon(
//       //           Icons.arrow_back,
//       //         ),
//       //         onPressed: () => Navigator.of(context).pop(),
//       //       ),
//       //       actions: [
//       //         IconButton(
//       //           icon: Icon(
//       //             Icons.radio,
//       //           ),
//       //           onPressed: () {},
//       //         ),
//       //       ],
//       //       backgroundColor: Colors.transparent,
//       //       elevation: 0.0,
//       //     )),
//       // Positioned(
//       //     left: 0,
//       //     right: 0,
//       //     top: screenHeight * 0.4,
//       //     height: screenHeight * 0.5,
//       //     child: Container(
//       //         decoration: BoxDecoration(
//       //             borderRadius: BorderRadius.circular(45),
//       //             color: Colors.white))),
//       // TabBarView(
//       //   controller: _tabController,
//       //   children: [
//       //     ListView.builder(
//       //         itemCount: mahmuds == null ? 0 : mahmuds.length,
//       //         itemBuilder: (_, i) {
//       //           return GestureDetector(
//       //               onTap: () {
//       //                 Navigator.push(
//       //                     context,
//       //                     MaterialPageRoute(
//       //                         builder: (context) =>
//       //                             AudioPage(topChartsData: mahmuds, index: i)));
//       //               },
//       //               child: Container(
//       //                 margin: const EdgeInsets.only(
//       //                     left: 20, right: 20, top: 10, bottom: 10),
//       //                 child: Container(
//       //                   decoration: BoxDecoration(
//       //                       borderRadius: BorderRadius.circular(10),
//       //                       color: Colors.blueGrey[100],
//       //                       boxShadow: [
//       //                         BoxShadow(
//       //                             blurRadius: 2,
//       //                             offset: Offset(0, 0),
//       //                             color: Colors.grey.withOpacity(0.2))
// //                             ]),
// //                         child: Container(
// //                           padding: const EdgeInsets.all(8),
// //                           child: Row(
// //                             children: [
// //                               Container(
// //                                 width: 100,
// //                                 height: 120,
// //                                 decoration: BoxDecoration(
// //                                     borderRadius: BorderRadius.circular(10),
// //                                     color: Colors.grey.withOpacity(0.2),
// //                                     image: DecorationImage(
// //                                         image: AssetImage(mahmuds[i]["img"]))),
// //                               ),
// //                               SizedBox(
// //                                 width: 10,
// //                               ),
// //                               Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   Row(
// //                                     children: [
// //                                       Icon(Icons.star,
// //                                           size: 24, color: Colors.white54),
// //                                       SizedBox(
// //                                         width: 5,
// //                                       ),
// //                                       Text(
// //                                         mahmuds[i]["rating"],
// //                                         style: TextStyle(color: Colors.white54),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                   Text(
// //                                     mahmuds[i]["title"],
// //                                     style: TextStyle(
// //                                         fontSize: 16,
// //                                         fontFamily: "Avenir",
// //                                         fontWeight: FontWeight.bold),
// //                                   ),
// //                                   Text(
// //                                     mahmuds[i]["text"],
// //                                     style: TextStyle(
// //                                         fontSize: 16,
// //                                         fontFamily: "Avenir",
// //                                         color: Colors.blueAccent),
// //                                   ),
// //                                   Container(
// //                                     width: 60,
// //                                     height: 20,
// //                                     decoration: BoxDecoration(
// //                                       borderRadius: BorderRadius.circular(3),
// //                                       color: Colors.blue,
// //                                     ),
// //                                     child: Text(
// //                                       "Love",
// //                                       style: TextStyle(
// //                                           fontSize: 10,
// //                                           fontFamily: "Avenir",
// //                                           color: Colors.white),
// //                                     ),
// //                                     alignment: Alignment.center,
// //                                   )
// //                                 ],
// //                               )
// //                             ],
// //                           ),
// //                         ),
// //                       ),
// //                     ));
// //               }),
// //           ListView.builder(
// //               itemCount: mahmuds == null ? 0 : mahmuds.length,
// //               itemBuilder: (_, i) {
// //                 return Container(
// //                   margin: const EdgeInsets.only(
// //                       left: 20, right: 20, top: 10, bottom: 10),
// //                   child: Container(
// //                     decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(10),
// //                         color: Colors.blueGrey[100],
// //                         boxShadow: [
// //                           BoxShadow(
// //                               blurRadius: 2,
// //                               offset: Offset(0, 0),
// //                               color: Colors.grey.withOpacity(0.2))
// //                         ]),
// //                     child: Container(
// //                       padding: const EdgeInsets.all(8),
// //                       child: Row(
// //                         children: [
// //                           Container(
// //                             width: 100,
// //                             height: 120,
// //                             decoration: BoxDecoration(
// //                                 borderRadius: BorderRadius.circular(10),
// //                                 color: Colors.grey.withOpacity(0.2),
// //                                 image: DecorationImage(
// //                                     image: AssetImage(mahmuds[i]["img"]))),
// //                           ),
// //                           SizedBox(
// //                             width: 10,
// //                           ),
// //                           Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               Row(
// //                                 children: [
// //                                   Icon(Icons.star,
// //                                       size: 24, color: Colors.white54),
// //                                   SizedBox(
// //                                     width: 5,
// //                                   ),
// //                                   Text(
// //                                     mahmuds[i]["rating"],
// //                                     style: TextStyle(color: Colors.white54),
// //                                   ),
// //                                 ],
// //                               ),
// //                               Text(
// //                                 mahmuds[i]["title"],
// //                                 style: TextStyle(
// //                                     fontSize: 16,
// //                                     fontFamily: "Avenir",
// //                                     fontWeight: FontWeight.bold),
// //                               ),
// //                               Text(
// //                                 mahmuds[i]["text"],
// //                                 style: TextStyle(
// //                                     fontSize: 16,
// //                                     fontFamily: "Avenir",
// //                                     color: Colors.blueAccent),
// //                               ),
// //                               Container(
// //                                 width: 60,
// //                                 height: 20,
// //                                 decoration: BoxDecoration(
// //                                   borderRadius: BorderRadius.circular(3),
// //                                   color: Colors.blue,
// //                                 ),
// //                                 child: Text(
// //                                   "Love",
// //                                   style: TextStyle(
// //                                       fontSize: 10,
// //                                       fontFamily: "Avenir",
// //                                       color: Colors.white),
// //                                 ),
// //                                 alignment: Alignment.center,
// //                               )
// //                             ],
// //                           )
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               }),
// //           ListView.builder(
// //               itemCount: mahmuds == null ? 0 : mahmuds.length,
// //               itemBuilder: (_, i) {
// //                 return Container(
// //                   margin: const EdgeInsets.only(
// //                       left: 20, right: 20, top: 10, bottom: 10),
// //                   child: Container(
// //                     decoration: BoxDecoration(
// //                         borderRadius: BorderRadius.circular(10),
// //                         color: Colors.blueGrey[100],
// //                         boxShadow: [
// //                           BoxShadow(
// //                               blurRadius: 2,
// //                               offset: Offset(0, 0),
// //                               color: Colors.grey.withOpacity(0.2))
// //                         ]),
// //                     child: Container(
// //                       padding: const EdgeInsets.all(8),
// //                       child: Row(
// //                         children: [
// //                           Container(
// //                             width: 100,
// //                             height: 120,
// //                             decoration: BoxDecoration(
// //                                 borderRadius: BorderRadius.circular(10),
// //                                 color: Colors.grey.withOpacity(0.2),
// //                                 image: DecorationImage(
// //                                     image: AssetImage(mahmuds[i]["img"]))),
// //                           ),
// //                           SizedBox(
// //                             width: 10,
// //                           ),
// //                           Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               Row(
// //                                 children: [
// //                                   Icon(Icons.star,
// //                                       size: 24, color: Colors.white54),
// //                                   SizedBox(
// //                                     width: 5,
// //                                   ),
// //                                   Text(
// //                                     mahmuds[i]["rating"],
// //                                     style: TextStyle(color: Colors.white54),
// //                                   ),
// //                                 ],
// //                               ),
// //                               Text(
// //                                 mahmuds[i]["title"],
// //                                 style: TextStyle(
// //                                     fontSize: 16,
// //                                     fontFamily: "Avenir",
// //                                     fontWeight: FontWeight.bold),
// //                               ),
// //                               Text(
// //                                 mahmuds[i]["text"],
// //                                 style: TextStyle(
// //                                     fontSize: 16,
// //                                     fontFamily: "Avenir",
// //                                     color: Colors.blueAccent),
// //                               ),
// //                               Container(
// //                                 width: 60,
// //                                 height: 20,
// //                                 decoration: BoxDecoration(
// //                                   borderRadius: BorderRadius.circular(3),
// //                                   color: Colors.blue,
// //                                 ),
// //                                 child: Text(
// //                                   "Love",
// //                                   style: TextStyle(
// //                                       fontSize: 10,
// //                                       fontFamily: "Avenir",
// //                                       color: Colors.white),
// //                                 ),
// //                                 alignment: Alignment.center,
// //                               )
// //                             ],
// //                           )
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 );
// //               }),
// //         ],
// //       ),
// //     ]));
// //   }
// // }
// //     //               Expanded(
// //     //                 child: NestedScrollView(
// //     //               controller: _scrollController,
// //     //               headerSliverBuilder: (BuildContext context, bool isScroll) {
// //     //                 return [
// //     //                   SliverAppBar(
// //     //                       pinned: true,
// //     //                       backgroundColor: Colors.white,
// //     //                       bottom: PreferredSize(
// //     //                           preferredSize: Size.fromHeight(10),
// //     //                           child: Container(
// //     //                               margin: const EdgeInsets.only(
// //     //                                   bottom: 20, left: 10),
 
         
                           
// //       //   body: CustomScrollView(slivers: [
// //       // SliverAppBar(
// //       //   flexibleSpace: FlexibleSpaceBar(
// //       //     background: Image.asset("assets/images/mahmud2.jpeg"),
// //       //   ),
// //       //   pinned: true,
// //       // ),
// //       // SliverList(
// //       //     delegate: SliverChildListDelegate([
// //       //   Container(
// //       //       height: 800,
// //       //       width: 100,
// //       //       decoration: BoxDecoration(
// //       //           color: Colors.white,
// //       //           borderRadius: BorderRadius.circular(20),
// //       //           border: Border.all(color: Colors.black, width: 2.0))),
        