import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constans.dart';
import 'package:note_app/cubits/notes/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/screen/homepage.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/simple_bloc_observer.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const NoteApp(),
    ),
  );
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData.dark(),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
