import 'package:flutter/material.dart';
import 'package:my_notes/models/note_list.dart';
import 'package:my_notes/screens/note_add.dart';
import 'package:my_notes/screens/notes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NoteListModel())
      ],
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          "/" : (context) => const NoteScreen(),
          "/addnote" : (context) => const NoteAddScreen(),
        },
      ),
      );
  }
}