import 'package:flutter/material.dart';
import 'package:notes_application/provider/notes_provider.dart';
import 'package:notes_application/style/add_new_page.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var add = 0;
  @override
  Widget build(BuildContext context) {
    var notesProvider = Provider.of<NotesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Notes App"),
      ),
      body: SafeArea(
        child:notesProvider.notes.length>0? GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AddNewPage(
                        isUpdate: true,
                        note: notesProvider.notes[index],
                      );
                    },
                  ),
                );
              },
              onLongPress: () {
                notesProvider.deleteNote(notesProvider.notes[index]);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${notesProvider.notes[index].title}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${notesProvider.notes[index].content}",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 128, 128, 128),
                        fontSize: 15,
                      ),
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: notesProvider.notes.length,
        ): const Center(child: Text("No Notes Added!"),)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) {
                return const AddNewPage(
                  isUpdate: false,
                );
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
