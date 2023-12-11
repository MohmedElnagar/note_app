part of 'add_note_cubit.dart';

abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddNoteFalure extends AddNoteState {
  final String errMessage;

  AddNoteFalure(this.errMessage);
}
