import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:res_builder/screens/edit_res.dart';
import 'package:res_builder/screens/preview.dart';

class ResList extends StatefulWidget {
  const ResList({super.key});

  @override
  State<ResList> createState() => _ResListState();
}

class _ResListState extends State<ResList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Resume'),
      ),
      body: StreamBuilder<dynamic>(
          stream: FirebaseFirestore.instance.collection("data").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        child: Text("${index + 1}"),
                      ),
                      title: Text(snapshot.data.docs[index]['name']),
                      subtitle: Text(snapshot.data.docs[index]['phone']),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditRes(
                                              data:
                                                  snapshot.data.docs[index])));
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection("data")
                                      .doc(snapshot.data.docs[index]['phone'])
                                      .delete()
                                      .then((value) {
                                    Fluttertoast.showToast(
                                        msg: "Deleted Successfully");
                                  });
                                },
                                icon: const Icon(Icons.delete)),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    PdfView(data: snapshot.data.docs[index]))));
                      },
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No data Found'),
              );
            }
          }),
    );
  }
}
