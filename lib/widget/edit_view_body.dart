import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widget/custom_app_bar.dart';
import 'package:note_app/widget/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:note_app/widget/edit_note_colors.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          CustomAppBar(
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subtitle = subtitle ?? widget.note.subtitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fettchAllNotes();
                Navigator.pop(context);
              },
              text: "Edit Note",
              icon: const Icon(Icons.check_sharp)),
          const SizedBox(
            height: 40,
          ),
          CustomTextFormField(
            onChanged: (value) {
              title = value;
            },
            hintext: widget.note.title,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
              onChanged: (value) {
                subtitle = value;
              },
              hintext: widget.note.subtitle,
              maxline: 5),
          const SizedBox(
            height: 16,
          ),
          EditNotesColorList(note: widget.note),
        ],
      ),
    );
  }
}
