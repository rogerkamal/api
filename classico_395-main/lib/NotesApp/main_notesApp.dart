import 'package:classico_395/NotesApp/NoteAppHome.dart';
import 'package:flutter/material.dart';

void main(){
  return runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notes",
      debugShowCheckedModeBanner: false,
      home: NoteAppHomePage(),
    );
  }
}