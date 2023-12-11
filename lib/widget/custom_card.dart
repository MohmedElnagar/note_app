import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/screen/edit_note_view.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.notes});
  final NoteModel notes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EditNoteView(
              note: notes,
            );
          }));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(notes.color),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30, left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Text(
                    notes.title,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      notes.subtitle,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black.withOpacity(.6),
                      ),
                    ),
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        notes.delete();
                        BlocProvider.of<NotesCubit>(context).fettchAllNotes();
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.black,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Text(
                    notes.date,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black.withOpacity(.6),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
