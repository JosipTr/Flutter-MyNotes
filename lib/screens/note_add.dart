import 'package:flutter/material.dart';
import 'package:my_notes/models/note_list.dart';
import 'package:provider/provider.dart';

class NoteAddScreen extends StatelessWidget {
  const NoteAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var note = context.watch<NoteListModel>();
    TextEditingController titleController = TextEditingController();
    TextEditingController subtitleController = TextEditingController();

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
                controller: titleController,
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
                controller: subtitleController,
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

                    note.addNote(titleController.text.trim(), subtitleController.text.trim(), titleController, subtitleController);
                    Navigator.pop(context);
                  },
                  child: const Text("Add"))
            ],
          ),
        ),
      ),
    );
  }
}
