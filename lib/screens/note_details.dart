import 'package:flutter/material.dart';

import '../models/note_list.dart';

class NoteDetailScreen extends StatelessWidget {
  final Note _note;
  final NoteListModel _notes;

  const NoteDetailScreen(this._note, this._notes, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Notes"),
      ),
      body: WillPopScope(
        onWillPop: () async{
          _notes.update(_note, _note.title, _note.subtitle, _note.titleController, _note.subtitleController);
          // _note.setTitle(_note.titleController.text.trim());
          // _note.setSubtitle(_note.subtitleController.text.trim());
          return true;
        },
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextField(
                  maxLines: null,
                  controller: _note.titleController,
                  decoration: const InputDecoration(
                    labelText: "Title",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                  ),
                  onChanged: (value) => _note.setTitle(_note.titleController.text.trim())
                ),
                const SizedBox(height: 20),
                TextField(
                  maxLines: null,
                  controller: _note.subtitleController,
                  decoration: const InputDecoration(
                    labelText: "Content",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
