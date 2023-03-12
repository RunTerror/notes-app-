import 'package:flutter/material.dart';
import 'package:notes_application/models/note.dart';
import 'package:notes_application/provider/notes_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddNewPage extends StatefulWidget {
  final bool isUpdate;
  final Note? note;
  const AddNewPage({super.key, required this.isUpdate, this.note});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController contentcontroller = TextEditingController();
  FocusNode noteFocus = FocusNode();

  void addNewNote() {
    var newNote = Note(
      id: const Uuid().v1(),
      userId: "abhishekbansal",
      content: contentcontroller.text,
      title: titlecontroller.text,
      dateTime: DateTime.now(),
    );

    Provider.of<NotesProvider>(context, listen: false).addNote(newNote);
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();

    if (widget.isUpdate) {
      titlecontroller.text = widget.note!.title!;
      contentcontroller.text = widget.note!.content!;
    }
  }

  void updateNote(){
    widget.note!.title=titlecontroller.text;
    widget.note!.content=contentcontroller.text;
    Provider.of<NotesProvider>(context, listen: false).updateNote(widget.note!);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (widget.isUpdate) {
                updateNote();
              } else {
                addNewNote();
              }
            },
            icon: const Icon(
              Icons.save,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: titlecontroller,
                  autofocus: widget.isUpdate ? false : true,
                  decoration: const InputDecoration(
                    hintText: "Title",
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(fontSize: 30),
                  onSubmitted: (value) {
                    if (value != "") {
                      noteFocus.requestFocus();
                    }
                  },
                ),
                TextField(
                  focusNode: noteFocus,
                  maxLines: null,
                  controller: contentcontroller,
                  autofocus: true,
                  decoration: const InputDecoration(
                      hintText: "content", border: InputBorder.none),
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
