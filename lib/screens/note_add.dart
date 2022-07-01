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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                maxLines: null,
                controller: note.titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                maxLines: null,
                controller: note.subtitleController,
                decoration: const InputDecoration(
                  labelText: "Content",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    note.addNote(
                        note.titleControllerText, note.subtitleControllerText);
                    Navigator.pop(context);
                    note.clearController();
                  },
                  child: const Text("Add"))
            ],
          ),
        ),
      ),
    );
  }
}
