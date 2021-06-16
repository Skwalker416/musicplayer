
// import 'package:flutter/material.dart';

// class AudioPage extends StatefulWidget {
//   AudioPage({Key? key}) : super(key: key);

//   @override
//   _AudioPageState createState() => _AudioPageState();
// }

// class _AudioPageState extends State<AudioPage> {
//   @override
//   Widget build(BuildContext context) {
//     final double screenHeight = MediaQuery.of(context).size.height;
//     // final double screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       // backgroundColor: Colors.blueGrey,
//       body: Stack(
//         children: [
//           Positioned(
//               top: 20,
//               width: 370,
//               height: 350,
//               // height: screenHeight / 2.8,
//               child: Container(
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage(
//                   "assets/images/aster2.jpg",
//                 ))),
//               )),
//           Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               child: AppBar(
//                 leading: IconButton(
//                   icon: Icon(
//                     Icons.arrow_back,
//                   ),
//                   onPressed: () {},
//                 ),
//                 actions: [
//                   IconButton(
//                     icon: Icon(
//                       Icons.search,
//                     ),
//                     onPressed: () {},
//                   ),
//                 ],
//                 backgroundColor: Colors.transparent,
//                 elevation: 0.0,
//               )),
//           Positioned(
//               left: 0,
//               right: 0,
//               top: screenHeight * 0.4,
//               height: screenHeight * 0.5,
//               child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(45),
//                     color: Colors.white),
//                 child: Column(
//                   children: [
//                     SizedBox(),
//                     Text(
//                       "ናፍቆት",
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       "አስትር አወቀ",
//                       style: TextStyle(),
//                     )
//                   ],
//                 ),
//               ))
//         ],
//       ),
//      body: TabBarView(
//                       controller: _tabController,
//                       children: [
//                         ListView.builder(
//                             itemCount: topCharts == null ? 0 : topCharts.length,
//                             itemBuilder: (_, i) {
//                               return Container(
//                                 margin: const EdgeInsets.only(
//                                     left: 20, right: 20, top: 10, bottom: 10),
//                                 child: Container(
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: Colors.blueGrey[100],
//                                       boxShadow: [
//                                         BoxShadow(
//                                             blurRadius: 2,
//                                             offset: Offset(0, 0),
//                                             color: Colors.grey.withOpacity(0.2))
//                                       ]),
//                                   child: Container(
//                                     padding: const EdgeInsets.all(8),
//                                     child: Row(
//                                       children: [
//                                         Container(
//                                           width: 100,
//                                           height: 120,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(10),
//                                               color:
//                                                   Colors.grey.withOpacity(0.2),
//                                               image: DecorationImage(
//                                                   image: AssetImage(
//                                                       topCharts[i]["img"]))),
//                                         ),
//                                         SizedBox(
//                                           width: 10,
//                                         ),
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Icon(Icons.star,
//                                                     size: 24,
//                                                     color: Colors.white54),
//                                                 SizedBox(
//                                                   width: 5,
//                                                 ),
//                                                 Text(
//                                                   topCharts[i]["rating"],
//                                                   style: TextStyle(
//                                                       color: Colors.white54),
//                                                 ),
//                                               ],
//                                             ),
//                                             Text(
//                                               topCharts[i]["title"],
//                                               style: TextStyle(
//                                                   fontSize: 16,
//                                                   fontFamily: "Avenir",
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                             Text(
//                                               topCharts[i]["text"],
//                                               style: TextStyle(
//                                                   fontSize: 16,
//                                                   fontFamily: "Avenir",
//                                                   color: Colors.blueAccent),
//                                             ),
//                                             Container(
//                                               width: 60,
//                                               height: 20,
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(3),
//                                                 color: Colors.blue,
//                                               ),
//                                               child: Text(
//                                                 "Love",
//                                                 style: TextStyle(
//                                                     fontSize: 10,
//                                                     fontFamily: "Avenir",
//                                                     color: Colors.white),
//                                               ),
//                                               alignment: Alignment.center,
//                                             )
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             }),
//   }
// }
