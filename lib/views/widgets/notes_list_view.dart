import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_view_cubit.dart';
import 'package:notes_app/models/note_view_model.dart';

import 'custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesViewCubit, NotesViewState>(
      builder: (context, state) {
     List<NoteViewModel> notesList =BlocProvider.of<NotesViewCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            itemCount: notesList.length ,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: CustomNoteItem(
                   note: notesList[index],
                  ),
                );
              }),
        );
      },
    );
  }
}