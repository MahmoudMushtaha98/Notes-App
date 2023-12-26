import 'package:flutter/material.dart';
import 'package:note_app/model/note_details_model.dart';

import '../sql/my_db.dart';
import 'home.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({
    super.key,
    required this.noteDetailsModel,
  });

  final NoteDetailsModel noteDetailsModel;

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerGraph = TextEditingController();
  MyDB myDB = MyDB();
  String aa = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              myDB.updateData(_controllerTitle.text, _controllerGraph.text,
                  widget.noteDetailsModel.id);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                  (route) => false);
            },
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          TextFormField(
            onChanged: (value) {
              _controllerTitle.text = value;
            },
            controller: _controllerTitle.text.isEmpty
                ? TextEditingController(text: widget.noteDetailsModel.title)
                : _controllerTitle,
            style: TextStyle(fontSize: mediaQuery(context, 1) * 0.1),
            maxLines: 1,
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).scaffoldBackgroundColor)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).scaffoldBackgroundColor))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.noteDetailsModel.date),
                Text(widget.noteDetailsModel.time),
              ],
            ),
          ),
          TextFormField(
            onChanged: (value) {
              _controllerGraph.text = value;
            },
            controller: _controllerGraph.text.isEmpty
                ? TextEditingController(text: widget.noteDetailsModel.subTitle)
                : _controllerGraph,
            maxLines: 10,
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).scaffoldBackgroundColor)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).scaffoldBackgroundColor))),
          ),
        ],
      ),
    );
  }
}
