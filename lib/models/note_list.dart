import 'package:flutter/material.dart';

class NoteListModel with ChangeNotifier {
  final List<Note> _notes = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();

  int get count => _notes.length;

  List<Note> get notes => _notes;

  TextEditingController get titleController => _titleController;

  String get titleControllerText => _titleController.text.trim();

  TextEditingController get subtitleController => _subtitleController;

  String get subtitleControllerText => _subtitleController.text.trim();

  void clearController() {
    _titleController.clear();
    _subtitleController.clear();
  }

  void addNote(String title, String subtitle) {
    _notes.add(Note(title, subtitle));
    notifyListeners();
  }

  void deleteNote(int index) {
    _notes.remove(_notes[index]);
    notifyListeners();
  }
}

class Note{
  final String _title;
  final String _subtitle;

  Note(this._title, this._subtitle);

  String get title => _title;
  String get subtitle => _subtitle;
}
