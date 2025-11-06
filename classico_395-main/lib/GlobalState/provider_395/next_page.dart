import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_provider.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Next Page")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                context.read<CounterProvider>().incrementCount(); ///alternative
                /*Provider.of<CounterProvider>(
                  context,
                  listen: false,
                ).incrementCount();*/
                Navigator.pop(context);
              },
              icon: Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {
                context.read<CounterProvider>().decrementCount();
                /*Provider.of<CounterProvider>(
                  context,
                  listen: false,
                ).decrementCount();*/
                Navigator.pop(context);
              },
              icon: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
