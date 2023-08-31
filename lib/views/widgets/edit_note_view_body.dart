import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes_app/cubits/notes_cubit/notes_view_cubit.dart';
import 'package:notes_app/models/note_view_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:notes_app/views/widgets/snack_bar.dart';

import '../../constant.dart';
import 'colors_item_list_view.dart';
import 'edit_note_view_color_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key, required this.note}) : super(key: key);
  final NoteViewModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = subTitle ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesViewCubit>(context).fetchAllNotes();
              Navigator.pop(context);
              snackStatus(context);
            },
            icon: Icons.check,
            title: 'Edit Note',
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextField(
            hint: widget.note.title,
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hint: widget.note.subTitle,
            maxLine: 5,
            onChanged: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          EditNoteColorsList(note: widget.note)
        ],
      ),
    );
  }

  void snackStatus(BuildContext context) {
    if (widget.note.title == title && widget.note.subTitle == subTitle) {
      showSnackBarMessage(
        context: context,
        message: 'The note title and subtitle has been edited',
        color: Colors.green,
      );
    } else if (widget.note.title == title && widget.note.subTitle != subTitle) {
      showSnackBarMessage(
        context: context,
        message: 'The note title only has been edited',
        color: Colors.green,
      );
    } else if (widget.note.title != title && widget.note.subTitle == subTitle) {
      showSnackBarMessage(
        context: context,
        message: 'The note subtitle only has been edited',
        color:Colors.green,
      );

    } else {
      showSnackBarMessage(
        context: context,
        message: 'The note subtitle only has been edited',
        color: Colors.red,
      );
    }
  }
}
