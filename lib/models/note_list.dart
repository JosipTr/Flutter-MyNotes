import 'package:flutter/material.dart';

class NoteListModel with ChangeNotifier {
  final List<Note> _notes = [];

  int get count => _notes.length;

  List<Note> get notes => _notes;

  void addNote(
      String title,
      String subtitle,
      TextEditingController titleController,
      TextEditingController subtitleController) {
    _notes.add(Note(title, subtitle, titleController, subtitleController));
    notifyListeners();
  }

  void deleteNote(int index) {
    _notes.remove(_notes[index]);
    notifyListeners();
  }
}

class Note {
  String? _title;
  String? _subtitle;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _subtitleController = TextEditingController();

  Note(String title, String subtitle, TextEditingController titleController,
      TextEditingController subtitleController) {
    _title = title;
    _subtitle = subtitle;
    _titleController = titleController;
    _subtitleController = subtitleController;
  }

  String get title => _title!;
  String get subtitle => _subtitle!;

  TextEditingController get titleController => _titleController;
  TextEditingController get subtitleController => _subtitleController;
}
