import 'package:flutter/material.dart';
import 'package:my_notes/models/note_list.dart';
import 'package:provider/provider.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var note = context.watch<NoteListModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Notes"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => note.addNote("Something"),
            )
        ],
      ),
      body: ListView.builder(
        itemCount: note.count,
        itemBuilder: (context, index) => ListTile(
          title: Text(note.notes[index].title),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => note.deleteNote(index),
          ),
        )
        ),
    );
  }
}