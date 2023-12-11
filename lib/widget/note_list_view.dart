import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widget/custom_card.dart';
import 'package:flutter/material.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          List<NoteModel> notes =
              BlocProvider.of<NotesCubit>(context).notes ?? [];

          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    notes: notes[index],
                  );
                }),
          );
        },
      ),
    );
  }
}
