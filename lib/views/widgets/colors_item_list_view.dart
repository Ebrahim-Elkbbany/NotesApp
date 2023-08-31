import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, required this.isSelected, required this.color}) : super(key: key);
  final bool isSelected ;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isSelected  ?  CircleAvatar(
      radius: 36,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 32,
        backgroundColor: color,
      ),
    ) :  CircleAvatar(
      radius: 36,
      backgroundColor: color,
    );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({Key? key}) : super(key: key);

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {

  int currentIndex =0;
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
                BlocProvider.of<AddNoteCubit>(context).color=kColors[index];
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
