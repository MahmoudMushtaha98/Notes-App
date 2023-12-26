import 'package:flutter/material.dart';
import 'package:note_app/model/note_details_model.dart';
import 'package:note_app/screen/note_screen.dart';
import 'package:note_app/sql/my_db.dart';

import '../widget/notes_widgets.dart';
import 'add_note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MyDB myDB = MyDB();

  List<Map> notes = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {

    notes = await myDB.readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNote(),
            )),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(notes.length, (index) {
              return Column(
                children: [
                  SizedBox(
                    height: mediaQuery(context, 0) * 0.05,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NoteScreen(
                              noteDetailsModel: NoteDetailsModel(
                                  id: notes[index]['id'],
                                  title: notes[index]['title'],
                                  subTitle: notes[index]['subTitle'],
                                  date: notes[index]['date'],
                                  time: notes[index]['time']),
                            ),
                          ));
                    },
                    child: BuildNotesWidget(
                      time: notes[index]['time'],
                      date: notes[index]['date'],
                      subTitle: notes[index]['subTitle'],
                      title: notes[index]['title'],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

double mediaQuery(BuildContext context, int number) {
  return number == 0
      ? MediaQuery.of(context).size.height
      : MediaQuery.of(context).size.width;
}
