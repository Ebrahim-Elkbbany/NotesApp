import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/models/note_view_model.dart';

part 'notes_view_state.dart';

class NotesViewCubit extends Cubit<NotesViewState> {
  NotesViewCubit() : super(NotesViewInitial());
  List<NoteViewModel> ?notes;
  fetchAllNotes(){
    var notesBox =Hive.box<NoteViewModel>(kNoteBox);
    notes= notesBox.values.toList();
    emit(NotesViewSuccess());

  }

}
