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
            onPressed: () => showAddDialog(context, note),
            )
        ],
      ),
      body: ListView.builder(
        itemCount: note.count,
        itemBuilder: (context, index) => ListTile(
          title: Text(note.notes[index].title),
          subtitle: Text("sdfsadf\nasdfasdf\nsdafasd",maxLines: 2,),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => note.deleteNote(index),
          ),
        )
        ),
    );
  }
}

void showAddDialog(context, note) {
  showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      title: Text("Add item"),
      content: TextField(controller: note.controller),
      actions: [
        ElevatedButton(
          onPressed: () => note.addNote(note.controllerText), 
          child: Text("Add")
          )
      ],
    )
    );
}