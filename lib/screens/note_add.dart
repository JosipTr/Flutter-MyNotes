import 'package:flutter/material.dart';
import 'package:my_notes/models/note_list.dart';
import 'package:provider/provider.dart';

class NoteAddScreen extends StatelessWidget {
  const NoteAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var note = context.watch<NoteListModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Notes"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: note.titleController,
              
              ),
            TextField(controller: note.subtitleController,),
            ElevatedButton(
              onPressed: () {
                note.addNote(note.titleControllerText, note.subtitleControllerText);
                Navigator.pop(context);
              } , 
              child: const Text("Add")
              )
          ],
        ),
      ),
    );
  }
}