import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/widget/add_note_form.dart';

class AddNoteButtomSheet extends StatelessWidget {
  const AddNoteButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AddNoteCubit(),
          ),
        ],
        child: Padding(
            padding: EdgeInsets.only(
                top: 18,
                right: 18,
                left: 18,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: BlocConsumer<AddNoteCubit, AddNoteState>(
                listener: (context, state) {
              if (state is AddNoteFalure) {
                // print("failed${state.errMessage}");
              }
              if (state is AddNoteSuccess) {
                BlocProvider.of<NotesCubit>(context).fettchAllNotes();

                Navigator.pop(context);
              }
            }, builder: (context, state) {
              return AbsorbPointer(
                  absorbing: state is AddNoteLoading ? true : false,
                  child: const SingleChildScrollView(child: AddNoteForm()));
            })));
  }
}
