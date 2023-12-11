import 'package:note_app/widget/add_buttom_sheet.dart';
import 'package:note_app/widget/note_view_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              context: context,
              builder: (context) {
                return AddNoteButtomSheet();
              });
        },
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
      body: const NotesViewBody(),
    );
  }
}
