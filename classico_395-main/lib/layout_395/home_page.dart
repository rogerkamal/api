import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  int count = 0;

  List<Map<String, dynamic>> mData = [
    {
      "name": "Raman",
      "mob_no": "",
      "bg_color": Color(0XFFaA8181),
    },

    {
      "name": "Ramesh",
      "mob_no": "9698979594",
      "bg_color": Colors.orange.withAlpha(129)
    },

    {
      "name": "Raghav",
      "mob_no": "6756756789",
      "bg_color": Colors.amber
    },

    {
      "name": "Rajeev",
      "mob_no": "",
      "bg_color": Colors.brown
    },

    {
      "name": "Raghvendra",
      "mob_no": "7897897890",
      "bg_color": Colors.blue
    },

    {
      "name": "Rajesh",
      "mob_no": "9119223883",
      "bg_color": Colors.red
    },
    {
      "name": "Raman",
      "mob_no": "9879876786",
      "bg_color": Colors.purple
    },

    {
      "name": "Ramesh",
      "mob_no": "9698979594",
      "bg_color": Colors.green
    },

    {
      "name": "Raghav",
      "mob_no": "6756756789",
      "bg_color": Colors.amber
    },

    {
      "name": "Rajeev",
      "mob_no": "987698769",
      "bg_color": Colors.brown
    },

    {
      "name": "Raghvendra",
      "mob_no": "7897897890",
      "bg_color": Colors.blue
    },

    {
      "name": "Rajesh",
      "mob_no": "9119223883",
      "bg_color": Colors.red
    },
    {
      "name": "Raman",
      "mob_no": "9879876786",
      "bg_color": Colors.purple
    },

    {
      "name": "Ramesh",
      "mob_no": "9698979594",
      "bg_color": Colors.green
    },

    {
      "name": "Raghav",
      "mob_no": "6756756789",
      "bg_color": Colors.amber
    },

    {
      "name": "Rajeev",
      "mob_no": "987698769",
      "bg_color": Colors.brown
    },

    {
      "name": "Raghvendra",
      "mob_no": "7897897890",
      "bg_color": Colors.blue
    },

    {
      "name": "Rajesh",
      "mob_no": "9119223883",
      "bg_color": Colors.red
    },
    {
      "name": "Raman",
      "mob_no": "9879876786",
      "bg_color": Colors.purple
    },

    {
      "name": "Ramesh",
      "mob_no": "9698979594",
      "bg_color": Colors.green
    },

    {
      "name": "Raghav",
      "mob_no": "6756756789",
      "bg_color": Colors.amber
    },

    {
      "name": "Rajeev",
      "mob_no": "987698769",
      "bg_color": Colors.brown
    },

    {
      "name": "Raghvendra",
      "mob_no": "7897897890",
      "bg_color": Colors.blue
    },

    {
      "name": "Rajesh",
      "mob_no": "9119223883",
      "bg_color": Colors.red
    },
    {
      "name": "Raman",
      "mob_no": "9879876786",
      "bg_color": Colors.purple
    },

    {
      "name": "Ramesh",
      "mob_no": "9698979594",
      "bg_color": Colors.green
    },

    {
      "name": "Raghav",
      "mob_no": "6756756789",
      "bg_color": Colors.amber
    },

    {
      "name": "Rajeev",
      "mob_no": "987698769",
      "bg_color": Colors.brown
    },

    {
      "name": "Raghvendra",
      "mob_no": "7897897890",
      "bg_color": Colors.blue
    },

    {
      "name": "Rajesh",
      "mob_no": "9119223883",
      "bg_color": Colors.red
    },

  ];

  MediaQueryData? mqData;

  @override
  Widget build(BuildContext context) {

    mqData = MediaQuery.of(context);
    print("width: ${mqData!.size.width}");
    print("height: ${mqData!.size.height}");


    return Scaffold(
      body: mqData!.size.width>=780 ? Row(
        children: [
          Expanded(
            flex: 5,
            child: buildFirstUI(),
          ),
          Expanded(
            flex: 11,
            child: buildSecondUI(),
          ),
        ],
      ) : Column(
        children: [
          Expanded(
            flex: 7,
            child: buildSecondUI(),
          ),
          Expanded(
            flex: 11,
            child: buildFirstUI(),
          ),

        ],
      ),
    );
  }

  Widget buildFirstUI(){
    return SingleChildScrollView(
      child: SizedBox(
        height: 460,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffE7EBF1),
                    border: Border.all(
                      width: 1,
                    )),
                child: Center(
                    child: Text(
                      'Strawberry Pavlova',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w900),
                    )),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffE7EBF1),
                    border: Border.all(
                      width: 1,
                    )),
                child: Center(
                    child: Text(
                      'Pavlova is a meringue-based dessert named after the Russian ballerine Anna Pavlova.Pavlova featues a crisp crust and soft, light inside, topped with fruit and whipped cream.',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ),
              SizedBox(
                height: 11,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffE7EBF1),
                    border: Border.all(
                      width: 1,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.black54, size: 18,),
                        Icon(Icons.star, color: Colors.black54, size: 18,),
                        Icon(Icons.star, color: Colors.black54, size: 18,),
                        Icon(Icons.star, color: Colors.black54, size: 18,),
                        Icon(Icons.star, color: Colors.black54, size: 18,),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text('170 Reviews')
                  ],
                ),
              ),
              SizedBox(
                height: 21,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                    color: Color(0xffE7EBF1),
                    border: Border.all(
                      width: 1,
                    )),
      
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.book_outlined, color: Colors.lightGreen,
                          size: 18,),
                        Text('PREP:'),
                        SizedBox(
                          height: 5,
                        ),
                        Text('25 min'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.timer_outlined, color: Colors.lightGreen,
                          size: 18,),
                        Text('COOK:'),
                        SizedBox(
                          height: 5,
                        ),
                        Text('1 hr'),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.restaurant, color: Colors.lightGreen,
                          size: 18,),
                        Text('FEEDS:'),
                        SizedBox(
                          height: 5,
                        ),
                        Text('4-6'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSecondUI(){
    return Image.asset(
      "assets/images/pavlova_bg.png",
      height: mqData!.orientation==Orientation.landscape ? 460 : null,
      fit: BoxFit.cover,
    );
  }

}



  /*void add(Function(int, int, int) a){

  }*/


  /*@override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        //backgroundColor: Color.fromRGBO(255, 0, 0, 1),
        body: ListView.builder(
            itemCount: mData.length,
            itemBuilder: (_, index){

              return Row(
                children: [
                  Text(mData[index]['name'], style: TextStyle(fontSize : 16, color: Colors.black),),
                  Spacer(),
                  Text(mData[index]['mob_no'], style: TextStyle(fontSize : 12, color: Colors.black),),
                ],
              );

          *//*return ListTile(
            leading: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage("https://raw.githubusercontent.com/flutter/assets-for-api-docs/main/packages/diagrams/assets/blend_mode_destination.jpeg"), fit: BoxFit.cover),
              ),
            ),
            title: Text(mData[index]['name']),
            subtitle: Text(mData[index]['mob_no']),
            trailing: Column(
              children: [
                Text('11:11 am'),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.green,
                  child: Center(
                    child: Text('2', style: TextStyle(fontSize: 11,color: Colors.white),)
                  ),
                )
              ],
            ),
          );*//*
        }),
      
      
        *//*GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
              mainAxisSpacing: 11,
              crossAxisSpacing: 11,
              //childAspectRatio: 9/16
            ),
            itemCount: mData.length,
            itemBuilder: (_, index){
              return GridTile(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage("https://raw.githubusercontent.com/flutter/assets-for-api-docs/main/packages/diagrams/assets/blend_mode_destination.jpeg"), fit: BoxFit.cover),
                  ),
                ),
                header: Text(mData[index]['name'],),
                footer: Text(mData[index]['mob_no']),
              );
              *//**//*return Container(
                width: double.infinity,
                height: 100,
                color: mData[index]['bg_color'],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      mData[index]['name'],
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.favorite_border, color: Colors.red,),
                        Text(
                          mData[index]['mob_no'],
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );*//**//*
            })*//*
      
      
      
      
        *//*GridView.count(
          mainAxisSpacing: 11,
          crossAxisSpacing: 11,
          crossAxisCount: 200, children: mData.map((eachItem){
                  count++;
                  print(count);
                  return Container(
                    width: double.infinity,
                    height: 100,
                    color: eachItem['bg_color'],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          eachItem['name'],
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                        Text(
                          eachItem['mob_no'],
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),)*//*
      ),
    );
  }*/

  ////Container(
//         height: 340,
//         padding: EdgeInsets.only(right: 11),
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: mData.length,
//             itemBuilder: (_,index){
//             print(index);
//               return Container(
//                 margin: EdgeInsets.only(left: 11),
//                 width: 190,
//                 decoration: BoxDecoration(
//                   color: mData[index]['bg_color'],
//                   borderRadius: BorderRadius.circular(21)
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       mData[index]['name'],
//                       style: TextStyle(
//                           fontSize: 20,
//                           color: Colors.white
//                       ),
//                     ),
//                     Visibility(
//                       visible: mData[index]['mob_no']!="",
//                       child: Text(
//                         ///?:
//                         mData[index]['mob_no']!="" ? mData[index]['mob_no'] : "No Number",
//                         style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.white
//                         ),
//                       ) ,
//                     ),
//                   ],
//                 ),
//               );
//             }
//         ),
//       )

  ///ListView(
  //         children: mData.map((eachItem){
  //           count++;
  //           print(count);
  //           return Container(
  //             width: double.infinity,
  //             height: 100,
  //             color: eachItem['bg_color'],
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text(
  //                   eachItem['name'],
  //                   style: TextStyle(
  //                       fontSize: 20,
  //                       color: Colors.white
  //                   ),
  //                 ),
  //                 Text(
  //                   eachItem['mob_no'],
  //                   style: TextStyle(
  //                       fontSize: 12,
  //                       color: Colors.white
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           );
  //         }).toList(),
  //       )


  ///Container(
//         color: Colors.grey,
//         width: 400,
//         height: 600,
//         child: Stack(
//           children: [
//             Container(
//               width: 300,
//               height: 300,
//               color: Colors.purple,
//             ),
//             Center(
//               child: Container(
//                 width: 300,
//                 height: 300,
//                 color: Colors.orange,
//               ),
//             ),
//             Center(
//               child: Container(
//                 width: 200,
//                 height: 200,
//                 color: Colors.blue,
//               ),
//             ),
//
//             Align(
//               alignment: Alignment.topRight,
//               child: Container(
//                 margin: EdgeInsets.only(right: 21),
//                 width: 200,
//                 height: 200,
//                 color: Colors.amber,
//               ),
//             ),
//             Positioned(
//               right: 21,
//               bottom: 70,
//               child: Container(
//                 width: 100,
//                 height: 100,
//                 color: Colors.brown,
//               ),
//             ),
//           ],
//         ),
//       )

  ///Container(
//         color: Colors.grey,
//         child: Row(
//           children: [
//           Expanded(
//             flex: 3,
//             child: Container(
//                   width: 100,
//                   height: 100,
//                   color: Colors.orange,
//                 ),
//           ),
//               Expanded(
//                 child: Container(
//                   width: 100,
//                   height: 100,
//                   color: Colors.blue,
//                 ),
//               ),
//           ],
//         ),
//       )

  ///SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: [
//             Container(
//               width: 100,
//               height: 200,
//               color: Colors.orange,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.blue,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.yellow,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.green,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.brown,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.orange,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.blue,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.yellow,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.green,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.brown,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.orange,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.blue,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.yellow,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.green,
//             ),
//             Container(
//               width: 100,
//               height: 100,
//               color: Colors.brown,
//             ),
//           ],
//         ),
//       )

  ///Row(
//         children: [
//           Expanded(
//             flex: 5,
//             child: Container(
//               height: 460,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 25),
//                 child: Column(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                           color: Color(0xffE7EBF1),
//                           border: Border.all(
//                             width: 1,
//                           )),
//                       width: 100,
//                       child: Center(
//                           child: Text(
//                         'Strawberry Pavlova',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w900),
//                       )),
//                     ),
//                     SizedBox(
//                       height: 16,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           color: Color(0xffE7EBF1),
//                           border: Border.all(
//                             width: 1,
//                           )),
//                       width: 100,
//                       child: Center(
//                           child: Text(
//                         'Pavlova is a meringue-based dessert named after the Russian ballerine Anna Pavlova.Pavlova featues a crisp crust and soft, light inside, topped with fruit and whipped cream.',
//                         style: TextStyle(
//                           fontSize: 18,
//                         ),
//                             textAlign: TextAlign.center,
//                       )),
//                     ),
//                     SizedBox(
//                       height: 11,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           color: Color(0xffE7EBF1),
//                           border: Border.all(
//                             width: 1,
//                           )),
//                       width: 100,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Row(
//                             children: [
//                               Icon(Icons.star, color: Colors.black54, size: 18,),
//                               Icon(Icons.star, color: Colors.black54, size: 18,),
//                               Icon(Icons.star, color: Colors.black54, size: 18,),
//                               Icon(Icons.star, color: Colors.black54, size: 18,),
//                               Icon(Icons.star, color: Colors.black54, size: 18,),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 30,
//                           ),
//                           Text('170 Reviews')
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 21,
//                     ),
//                     Container(
//                       padding: EdgeInsets.symmetric(vertical: 16),
//                       decoration: BoxDecoration(
//                           color: Color(0xffE7EBF1),
//                           border: Border.all(
//                             width: 1,
//                           )),
//                       width: 100,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Column(
//                             children: [
//                               Icon(Icons.book_outlined, color: Colors.lightGreen, size: 18,),
//                               Text('PREP:'),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               Text('25 min'),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Icon(Icons.timer_outlined, color: Colors.lightGreen, size: 18,),
//                               Text('COOK:'),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               Text('1 hr'),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               Icon(Icons.restaurant, color: Colors.lightGreen, size: 18,),
//                               Text('FEEDS:'),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               Text('4-6'),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 11,
//             child: Image.asset(
//               "assets/images/bg_cake.png",
//               height: 460,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ],
//       ),
