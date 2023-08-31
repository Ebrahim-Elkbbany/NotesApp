import 'package:hive/hive.dart';
//flutter packages pub run build_runner build
part 'note_view_model.g.dart';
@HiveType(typeId: 0)
class NoteViewModel extends HiveObject{
  @HiveField(0)
   String title;
  @HiveField(1)
   String subTitle;
  @HiveField(2)
   String date;
  @HiveField(3)
   int color;
NoteViewModel({required this.title,required this.color,required this.subTitle,required this.date});

}

