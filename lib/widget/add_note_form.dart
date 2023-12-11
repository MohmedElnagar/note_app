import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widget/color_list_view.dart';
import 'package:note_app/widget/custom_buttom.dart';
import 'package:note_app/widget/custom_text_feild.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteForemState();
}

class _AddNoteForemState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hintext: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            onSaved: (value) {
              subtitle = value;
            },
            hintext: "contect",
            maxline: 5,
          ),
          const SizedBox(
            height: 15,
          ),
          const ListViewColor(),
          const SizedBox(
            height: 15,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButtom(
                isloading: state is AddNoteLoading ? true : false,
                ontap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var currentdate = DateTime.now();
                    var formatcurrentdate =
                        DateFormat("dd-mm-yyyy").format(currentdate);

                    var noteModel = NoteModel(
                        title: title!,
                        subtitle: subtitle!,
                        date: formatcurrentdate,
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;

                    setState(() {});
                  }
                },
                text: "add",
              );
            },
          ),
        ],
      ),
    );
  }
}
