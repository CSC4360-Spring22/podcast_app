import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class favorite extends StatefulWidget {
  const favorite({Key? key}) : super(key: key);

  @override
  _favoriteState createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
  final CollectionReference _favorite =
      FirebaseFirestore.instance.collection('favorites');

  final TextEditingController _favController = TextEditingController();

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                // prevent the soft keyboard from covering text fields
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _favController,
                  decoration: const InputDecoration(labelText: 'favorite'),
                ),
                ElevatedButton(
                  child: Text(action == 'create' ? 'Create' : 'Update'),
                  onPressed: () async {
                    final String? fav = _favController.text;

                    if (fav != null) {
                      if (action == 'create') {
                        // add user information
                        await _favorite.add({"episode": fav});
                      }

                      // Clear the text fields
                      _favController.text = '';

                      // Hide the bottom sheet
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: <Widget>[
        Text(
          "Favorites",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 30),
        ElevatedButton(
          child: const Text(
            "Star wars: episode 221",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 25, 184, 208),
            padding: const EdgeInsets.all(20),
          ),
          onPressed: () async {},
        ),
        SizedBox(height: 15),
        ElevatedButton(
          child: const Text(
            "Shiela James 29th April 2016",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 25, 184, 208),
            padding: const EdgeInsets.all(20),
          ),
          onPressed: () async {},
        ),
        SizedBox(height: 15),
        ElevatedButton(
          child: const Text(
            "Fine Art Photographer Osamu",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 25, 184, 208),
            padding: const EdgeInsets.all(20),
          ),
          onPressed: () async {},
        ),
      ],
    ))

        /*
      // Using StreamBuilder to display all admin messages from "Admin" collection
      body: StreamBuilder(
        stream: _favorite.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['episode']),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // Add new user
      floatingActionButton: FloatingActionButton(
        onPressed: () => _create(),
        child: const Icon(Icons.add),
      ),
      */
        );
  }
}
