import 'package:flutter/material.dart';

class NoteListModel with ChangeNotifier {
  final List<Note> _notes = [];

  int get count => _notes.length;

  List<Note> get notes => _notes;

  Note getNoteById(id) => (id % _notes[_notes.length]);

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

  void update(Note note,
      String title,
      String subtitle,
      TextEditingController titleController,
      TextEditingController subtitleController) {
        note.setTitle(title);
        note.setSubtitle(subtitle);
        note.setTitleController(titleController);
        note.setsubtitleController(subtitleController);
  notifyListeners();
  }

}

class Note with ChangeNotifier{
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

  void setTitle(String value) {
    _title = value;
  }

  void setSubtitle(String value) {
    _subtitle = value;
  }

  TextEditingController get titleController => _titleController;
  TextEditingController get subtitleController => _subtitleController;

  void setTitleController(TextEditingController titleController) {
    _titleController = titleController;
  }

    void setsubtitleController(TextEditingController subtitleController) {
    _subtitleController = subtitleController;
  }
}
