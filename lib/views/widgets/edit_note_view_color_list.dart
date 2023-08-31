import 'package:flutter/material.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/models/note_view_model.dart';

import 'colors_item_list_view.dart';

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({Key? key, required this.note}) : super(key: key);
  final NoteViewModel note;
  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();


}


class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currentIndex;
  @override
  void initState(){
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2*36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) {
          return  Padding(
            padding:const EdgeInsets.symmetric(horizontal: 6),
            child:  GestureDetector(
              onTap: () {
                currentIndex = index;
                widget.note.color = kColors[index].value;
                setState(() {
                });
              },
              child: ColorItem(
                color: kColors[index],
                isSelected: currentIndex == index,

              ),
            ),
          );
        },
      ),
    );
  }
}
