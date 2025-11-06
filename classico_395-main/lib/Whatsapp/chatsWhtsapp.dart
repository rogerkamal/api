import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
List<Map<String, dynamic>> chatData =[
  {
    "imgNetworkUrl" : "http://img.freepik.com/premium-photo/young-girl-wearing-yellow-tshirt-smiling-facing-camera-empty-space-isolated-bright-yellow_74379-2763.jpg",
    "name" : "Kia",
    "message" : "Why aren't you picking my calls ?!",
    "timestamp" : "2:05 PM",
    "messageCount" : 1
  },
  {
    "imgNetworkUrl" : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIxCFp8GVRpTUmmVPwQsUt6t8MifWdMlIyNT0QBJWdf5iOKVIJe1RuQZhVwHtbBCrIgrA&usqp=CAU",
    "name" : "Lee",
    "message" : "I am leaving, now ksjh sfhs kdhk sdfhsi sdhfwi",
    "timestamp" : "11:47 AM",
    "messageCount" : 0
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

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("WhatsApp"),
              ],
            ),
            Row(
              children: [
                Icon(Icons.search,color: Colors.white,),
                Container(
                    margin: EdgeInsets.zero,
                    child: Icon(Icons.more_vert_outlined,color: Colors.white,))
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        children: chatData.map((eachItem){
          return Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: InkWell(
                    onTap: (){
                      print("Message Tap on ${eachItem['name']}");
                    },

                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 8,right: 10),
                          width :50,
                          height: 45,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: NetworkImage(eachItem['imgNetworkUrl']),fit: BoxFit.cover)
                          ),

                        ),

                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    eachItem['name'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 20),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.done_all_outlined,
                                        color: Colors.grey),
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: Container(
                                        margin: EdgeInsets.only(left: 2),
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          eachItem['message'],
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        /*if(!eachItem['messageCount']==""){
                        }*/

                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 5,bottom: 5),
                              child: Text(
                                eachItem['timestamp'],
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.green),
                                textAlign: TextAlign.end,
                              ),
                            ),

                            eachItem['messageCount'] != 0 ? Container(
                              margin: EdgeInsets.only(right: 5),
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                              child: Center(child: Text(eachItem['messageCount'].toString(),style: TextStyle(color: Colors.white))
                              ),
                            ) :Container()
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),

      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 40),

        child: FloatingActionButton(onPressed: (){
          print("FA button pressed");
        },
          backgroundColor: Colors.teal[600],
          shape: CircleBorder(),
          elevation: 10,
        child: Icon(
          Icons.add_comment_rounded,
          color: Colors.white,
        ),

        ),
      ),

    );
  }
}
/*      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8,right: 10),
                      width :50,
                      height: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: NetworkImage("http://img.freepik.com/premium-photo/young-girl-wearing-yellow-tshirt-smiling-facing-camera-empty-space-isolated-bright-yellow_74379-2763.jpg"),fit: BoxFit.cover)
                      ),

                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Container(
                            child: Text(
                              "Cia",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            "Why aren't you picking my calls ?!",
                            style: TextStyle(
                                 fontSize: 20,
                            color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5,bottom: 5),
                          child: Text(
                            "12:27 PM",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Center(child: Text("1",style: TextStyle(color: Colors.white),)),
                        )
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8,right: 10),
                      width :50,
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIxCFp8GVRpTUmmVPwQsUt6t8MifWdMlIyNT0QBJWdf5iOKVIJe1RuQZhVwHtbBCrIgrA&usqp=CAU"),fit: BoxFit.cover)
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Yankee",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Text(
                            "Respond to Mom ",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5,bottom: 5),
                          child: Text(
                            "11:47 AM",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green
                          ),
                          child: Center(child: Text("4",style: TextStyle(color: Colors.white),)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8,right: 10),
                      width :50,
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey
                      ),
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 35,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Samosa gang",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Text(
                            "Gouri: Shit the cops caught me",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5,bottom: 5),
                          child: Text(
                            "12:27 PM",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text("1",
                            style: TextStyle(color: Colors.white),),
                          ),

                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8,right: 10),
                      width :50,
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey
                      ),
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 35,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Vinay",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.done_all_outlined,
                                color: Colors.blue,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  "Okay",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            "12:27 PM",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text("1",
                              style: TextStyle(color: Colors.white),),
                          ),

                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8,right: 10),
                      width :50,
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey
                      ),
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 35,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Kavs",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.done_all,
                                color: Colors.grey,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  "This saturday?",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            "12:27 PM",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text("1",
                              style: TextStyle(color: Colors.white),),
                          ),

                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8,right: 10),
                      width :50,
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey
                      ),
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 35,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Mihir",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Text(
                            "Blr traffic is crazy",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            "12:27 PM",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text("1",
                              style: TextStyle(color: Colors.white),),
                          ),

                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8,right: 10),
                      width :50,
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey
                      ),
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 35,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Babla",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Text(
                            "You went to Daddy's?",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            "12:27 PM",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text("1",
                              style: TextStyle(color: Colors.white),),
                          ),

                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8,right: 10),
                      width :50,
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey
                      ),
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 35,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Saurav",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Text(
                            "Hahaha lol",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5),
                          child: Text(
                            "12:27 PM",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text("1",
                              style: TextStyle(color: Colors.white),),
                          ),

                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8,right: 10),
                      width :50,
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey
                      ),
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 35,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Abinav",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.done_all_outlined,
                              color: Colors.grey),
                              Flexible(
                                fit: FlexFit.loose,
                                child: Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    "Yo you should try Chikmagal drg fgserg",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5),

                          child: Text(
                            "12:27 PM",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text("1",
                              style: TextStyle(color: Colors.white)),
                          ),

                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8,right: 10),
                      width :50,
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey
                      ),
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 35,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Kavs",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.done_all,
                                color: Colors.grey,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  "This saturday?",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            "12:27 PM",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text("1",
                              style: TextStyle(color: Colors.white),),
                          ),

                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8,right: 10),
                      width :50,
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey
                      ),
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 35,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Vinay",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.done_all_outlined,
                                color: Colors.blue,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  "Okay",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            "12:27 PM",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text("1",
                              style: TextStyle(color: Colors.white),),
                          ),

                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8,right: 10),
                      width :50,
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey
                      ),
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 35,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Babla",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Text(
                            "You went to Daddy's?",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            "12:27 PM",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text("1",
                              style: TextStyle(color: Colors.white),),
                          ),

                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8,right: 10),
                      width :50,
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey
                      ),
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 35,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Dad",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Text(
                            "Respond to Mom ",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            "11:47 AM",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green
                          ),
                          child: Center(child: Text("4",style: TextStyle(color: Colors.white),)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8,right: 10),
                      width :50,
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey
                      ),
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 35,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Kavs",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.done_all,
                                color: Colors.grey,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  "This saturday?",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            "12:27 PM",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text("1",
                              style: TextStyle(color: Colors.white),),
                          ),

                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8,right: 10),
                      width :50,
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey
                      ),
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 35,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Dad",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Text(
                            "Respond to Mom ",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            "11:47 AM",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green
                          ),
                          child: Center(child: Text("4",style: TextStyle(color: Colors.white),)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8,right: 10),
                      width :50,
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey
                      ),
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 35,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Samosa gang",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Text(
                            "Gouri: Shit the cops caught me",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 5,bottom: 5),

                          child: Text(
                            "12:27 PM",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text("1",
                              style: TextStyle(color: Colors.white),),
                          ),

                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8,right: 10),
                      width :50,
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey
                      ),
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 35,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Vinay",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.done_all_outlined,
                                color: Colors.blue,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  "Okay",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            "12:27 PM",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text("1",
                              style: TextStyle(color: Colors.white),),
                          ),

                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8,right: 10),
                      width :50,
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey
                      ),
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 35,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Kavs",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.done_all,
                                color: Colors.grey,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  "This saturday?",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            "12:27 PM",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text("1",
                              style: TextStyle(color: Colors.white),),
                          ),

                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 8,right: 10),
                      width :50,
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey
                      ),
                      child: Icon(
                        Icons.person_outline_rounded,
                        size: 35,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Mihir",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Text(
                            "Blr traffic is crazy",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            "12:27 PM",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.green),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text("1",
                              style: TextStyle(color: Colors.white),),
                          ),

                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

            ],

          ),
        ),


      ),
*/