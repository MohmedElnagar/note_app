import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constans.dart';
import 'package:note_app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  fettchAllNotes() async {
    var notesbox = Hive.box<NoteModel>(kNotesBox);
    notes = notesbox.values.toList();
    emit(NotesSucces());
  }
}
