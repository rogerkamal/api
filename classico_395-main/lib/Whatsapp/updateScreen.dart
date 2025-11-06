import 'package:flutter/material.dart';

class UpdatesScreen extends StatelessWidget {
  List<Map<String, dynamic>> statusListData = [
    {"imgNetworkUrl" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIxCFp8GVRpTUmmVPwQsUt6t8MifWdMlIyNT0QBJWdf5iOKVIJe1RuQZhVwHtbBCrIgrA&usqp=CAU",
      "name" : "Lee Fifi",
      "bg_color" : Colors.brown
    },
    {"imgNetworkUrl" : "http://img.freepik.com/premium-photo/young-girl-wearing-yellow-tshirt-smiling-facing-camera-empty-space-isolated-bright-yellow_74379-2763.jpg",
      "name" : "Kiana Frida",
      "bg_color" : Colors.orange
    },
    {"imgNetworkUrl" : "http://img.freepik.com/premium-photo/young-girl-wearing-yellow-tshirt-smiling-facing-camera-empty-space-isolated-bright-yellow_74379-2763.jpg",
      "name" : "Alesso Hilfiger",
      "bg_color" : Colors.red
    },
    {"imgNetworkUrl" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIxCFp8GVRpTUmmVPwQsUt6t8MifWdMlIyNT0QBJWdf5iOKVIJe1RuQZhVwHtbBCrIgrA&usqp=CAU",
      "name" : "Albert Einstein",
      "bg_color" : Colors.amber
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        foregroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Updates"),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.qr_code_scanner),
                SizedBox(width: 10),
                Icon(Icons.search),
                SizedBox(width: 5),
                Icon(Icons.more_vert)
              ],
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 15, top: 10),
            child: Text("Status", style: TextStyle(fontSize: 20)),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            width: double.infinity,
            height: 200,
            child: Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: statusListData.length,
                itemBuilder: (_,index){
                  print("Count ListData: $index");
                  return Container(
                    margin: EdgeInsets.only(left: 5, top: 10),
                    width: 100,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: statusListData[index]['bg_color'],
                    ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5, left: 5),
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green.shade700,width: 2,),
                              ///13 june 2025 live video for circular border around profile pic
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                    statusListData[index]['imgNetworkUrl']), fit: BoxFit.cover),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                    decoration : BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green[700]),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 15,
                                    )),
                              ],
                            ),
                          ),

                          Container(
                              margin: EdgeInsets.only(left: 5, bottom: 5),
                              child: Text(
                                statusListData[index]['name'],
                                style: TextStyle(fontSize: 15),
                              ))
                        ],
                      ),
                  );
                }
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Channels", style: TextStyle(fontSize: 20)),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 25,
                  child: ElevatedButton(onPressed: (){
                    print(" On Tap Explore");
                  },style: ElevatedButton.styleFrom(backgroundColor: Colors.white70),
                      child: Text("Explore",style: TextStyle(color: Colors.black),)),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
/*
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 15, top: 10),
                width: 100,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey[200],
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 5, left: 5),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.green.shade700,width: 2,),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIxCFp8GVRpTUmmVPwQsUt6t8MifWdMlIyNT0QBJWdf5iOKVIJe1RuQZhVwHtbBCrIgrA&usqp=CAU",), fit: BoxFit.cover),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                                decoration : BoxDecoration(
                                  shape: BoxShape.circle,
                                color: Colors.green[700]),
                                child: Icon(
                              Icons.add,
                              color: Colors.white,
                                  size: 15,
                            )),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 5, bottom: 5),
                          child: Text(
                            "Add status",
                            style: TextStyle(fontSize: 15),
                          ))
                    ],
                  ),
                ),
              )
            ],
          )
*/
