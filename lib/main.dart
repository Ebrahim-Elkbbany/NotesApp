import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/app_bloc_observer.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/models/note_view_model.dart';
import 'package:notes_app/views/notes_view.dart';
import 'cubits/notes_cubit/notes_view_cubit.dart';

void main() async {
  //الترتيب مهم
  await Hive.initFlutter();
  Hive.registerAdapter(NoteViewModelAdapter());
  await Hive.openBox<NoteViewModel>(kNoteBox);
  Bloc.observer = AppBlocObserver();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesViewCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        home: const NotesView(),
      ),
    );
  }
}
