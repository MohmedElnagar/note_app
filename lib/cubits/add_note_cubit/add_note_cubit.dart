import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constans.dart';
import 'package:note_app/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color = Color(0xffF2BAC9);

  addNote(NoteModel note) async {
    note.color = color.value;
    emit(AddNoteLoading());

    try {
      var notesbox = Hive.box<NoteModel>(kNotesBox);
      await notesbox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFalure(e.toString()));
    }
  }
}
