import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/widget/custom_app_bar.dart';
import 'package:note_app/widget/note_list_view.dart';
import 'package:flutter/material.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fettchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          CustomAppBar(
            text: "Note",
            icon: Icon(Icons.search),
          ),
          NoteListView(),
        ],
      ),
    );
  }
}
