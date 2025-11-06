import 'package:classico_395/GlobalState/provider_395/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'next_page.dart';

void main() {
  /*runApp(ChangeNotifierProvider(
    create: (context) => ListProvider(),
    child: MyApp(),
  ),);*/

  runApp(ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage()
      /*home: ListPage()*/
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print("My home page built..");

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Home Page"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Consumer<CounterProvider>(builder: (ctx,provider,__){
              return Text(
                // '${Provider.of<CounterProvider>(context).getCountValue()}',
                // '${provider.getCountValue()}',
                '${ctx.watch<CounterProvider>().getCountValue()}',
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*///same page
          Provider.of<CounterProvider>(context, listen: false).incrementCount();*/

          Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
