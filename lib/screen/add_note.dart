import 'package:flutter/material.dart';
import 'package:note_app/screen/home.dart';
import 'package:note_app/sql/my_db.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerGraph = TextEditingController();
  bool checkTitle = false;
  bool checkGraph = false;
  DateTime dateTime = DateTime.now();
  MyDB myDB = MyDB();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () async{
            int response = await myDB.insertData(title: _controllerTitle.text.isNotEmpty ? _controllerTitle.text : 'title',
                subTitle: _controllerGraph.text.isNotEmpty ? _controllerGraph.text : 'write ...',
                date: '${dateTime.day} - ${dateTime.month} - ${dateTime.year}',
                time: '${dateTime.hour} : ${dateTime.minute} : ${dateTime.second}');
            print(response);
            Navigator.pop(context);
          }, icon: const Icon(
            Icons.add,
          ),)
        ],
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _controllerTitle,
            onTap: () {
              setState(() {
                checkTitle = true;
              });
            },
            style: TextStyle(fontSize: mediaQuery(context, 1) * 0.1),
            maxLines: 1,
            decoration: InputDecoration(
                label: checkTitle
                    ? null
                    : Text(
                  'Title',
                  style:
                  TextStyle(fontSize: mediaQuery(context, 1) * 0.1),
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme
                            .of(context)
                            .scaffoldBackgroundColor)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme
                            .of(context)
                            .scaffoldBackgroundColor))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${dateTime.day} - ${dateTime.month} - ${dateTime.year}'),
                Text('${dateTime.hour} : ${dateTime.minute} : ${dateTime
                    .second}'),
              ],
            ),
          ),
          TextFormField(
            controller: _controllerGraph,
            onTap: () {
              setState(() {
                checkTitle = true;
              });
            },
            maxLines: checkGraph ? 10 : 2,
            decoration: InputDecoration(
                label: checkGraph
                    ? null
                    : Text(
                  'write ...',

                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme
                            .of(context)
                            .scaffoldBackgroundColor)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme
                            .of(context)
                            .scaffoldBackgroundColor))),
          ),
        ],
      ),
    );
  }
}
