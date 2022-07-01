import 'package:flutter/material.dart';

class NoteDetailScreen extends StatelessWidget {
  final TextEditingController _titleController;
  final TextEditingController _subtitleController;

  const NoteDetailScreen(this._titleController, this._subtitleController, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
                controller: _titleController,
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
                controller: _subtitleController,
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
    );
  }
}
