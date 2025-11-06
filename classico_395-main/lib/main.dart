import 'package:classico_395/LocalStateApps/bmi/bmiRaunkPage.dart';
import 'package:classico_395/LocalStateApps/calculator/calculatorScreen.dart';
import 'package:classico_395/LocalStateApps/calculator/statefulRaunakSir.dart';
import 'package:classico_395/NotesApp/NoteAppComposeNotePage.dart';
import 'package:classico_395/NotesApp/NoteAppHome.dart';
import 'package:classico_395/NotesApp/noteAppViewNotePage.dart';
import 'package:classico_395/Whatsapp/chatsWhtsapp.dart';
import 'package:classico_395/LoginPage/loginScreens.dart';
import 'package:classico_395/pavlova28052025.dart';
import 'package:classico_395/LocalStateApps/tipCalculatorScreen.dart';
import 'package:flutter/material.dart';
import 'package:classico_395/home_page.dart';

import 'LocalStateApps/bmi/bmiScreen.dart';
import 'WallpaperApp/homeWallpaperScreen.dart';
import 'WallpaperApp/natureWallpaperScreen.dart';
import 'WallpaperApp/viewWallpaperScreen.dart';
import 'Whatsapp/updateScreen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        // home: MyHomePage());
        // home: PavlovaUI());
        home: Loginscreens());
        // home: ChatScreen());
        // home: UpdatesScreen());
        // home: ViewWallpaperScreen());
        // home: HomeWallpaperScreen());
        // home: NatureWallpaperScreen());
        // home: BmiScreen());
        // home: CalculatorScreen());
        // home: TipCalculatorScreen());
        // home: CalculatorLocalStatePage());
        // home: NoteAppHomePage());
        // home: NoteAppViewNotePage());
        // home: BmiRaunkPage());
        // home: NoteAppComposeNotePage());
  }
}


