import 'package:flutter/material.dart';

class NoteListModel with ChangeNotifier {
  final List<Note> _notes = [];

  int get count => _notes.length;

  List<Note> get notes => _notes;

  void addNote(String title) {
    _notes.add(Note(title));
    notifyListeners();
  }

  void deleteNote(int index) {
    _notes.remove(_notes[index]);
    notifyListeners();
  }
}

class Note {
  final String _title;

  Note(this._title);

  String get title => _title;
}