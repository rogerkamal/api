import 'package:classico_395/GlobalState/provider_395/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // List<Map<String,dynamic>> alldata = Provider.of<ListProvider>(context).getData(); ///without consumer
    return Scaffold(
      appBar: AppBar(
        title: Text("List Page"),
      ),
      body: Consumer<ListProvider>(
        builder: (ctx,provider,__){
          List<Map<String,dynamic>> alldata = provider.getData();
          // List<Map<String,dynamic>> alldata = ctx.watch<ListProvider>().getData();

          return alldata.isNotEmpty ? ListView.builder(
              itemCount: alldata.length,
              itemBuilder: (_,index){
                return Card(
                  child: ListTile(
                    title: Text(alldata[index]["title"]),
                    subtitle: Text(alldata[index]["desc"]),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(onPressed: (){
                            context.read<ListProvider>().updateMap(updateMap: {
                              "title" : "note is updated",
                              "desc" : "description is updated"
                            }, index: index);
                          }, icon: Icon(Icons.edit)),
                          IconButton(onPressed: (){
                            context.read<ListProvider>().deleteMap(index: index);
                          }, icon: Icon(Icons.delete,color: Colors.red,)),
                        ],
                      ),
                    ),
                  ),
                );
              }) : Center(child: Text("No Data"));
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        context.read<ListProvider>().addMap(map: {
          "title" : "Created new note",
          "desc" : "Creted new description"
        });
      },child: Icon(Icons.add),),
    );

  }
}
