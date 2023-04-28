import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PdfView extends StatefulWidget {
  final dynamic data;
  const PdfView({super.key, required this.data});

  @override
  State<PdfView> createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: StreamBuilder<dynamic>(
              stream: FirebaseFirestore.instance
                  .collection("data")
                  .doc(widget.data['phone'])
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Resume',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration:
                                        BoxDecoration(color: Colors.grey[300]),
                                    child: const Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        "Personal Information:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          flex: 8,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4.0, bottom: 8.0),
                                                child: Text(
                                                  "${snapshot.data['name']}",
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              Text(
                                                  "\u2022 Email:  ${snapshot.data['email']}"),
                                              Text(
                                                  "\u2022 Phone:  ${snapshot.data['phone']}"),
                                              Text(
                                                  "\u2022 Address:  ${snapshot.data['address']}")
                                            ],
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  image: const DecorationImage(
                                                      image: AssetImage(
                                                          "assets/user.jpg"))),
                                              height: 80,
                                            ),
                                          ))
                                    ],
                                  )
                                ]),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration:
                                      BoxDecoration(color: Colors.grey[300]),
                                  child: const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      "Qualifications:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    "\u2022 ${snapshot.data['qualification']}"),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration:
                                      BoxDecoration(color: Colors.grey[300]),
                                  child: const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      "Skills:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("\u2022 ${snapshot.data['skills']}"),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration:
                                      BoxDecoration(color: Colors.grey[300]),
                                  child: const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      "Achievements:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("\u2022 ${snapshot.data['achievements']}"),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration:
                                      BoxDecoration(color: Colors.grey[300]),
                                  child: const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      "Training and Certification:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    "\u2022 ${snapshot.data['certification']}"),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration:
                                      BoxDecoration(color: Colors.grey[300]),
                                  child: const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      "Experience:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("\u2022 ${snapshot.data['experience']}"),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration:
                                      BoxDecoration(color: Colors.grey[300]),
                                  child: const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      "Projects:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("\u2022 ${snapshot.data['projects']}"),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration:
                                      BoxDecoration(color: Colors.grey[300]),
                                  child: const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      "Hobbies:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text("\u2022 ${snapshot.data['hobbies']}"),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ]),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('No data Found'),
                  );
                }
              }),
        ),
      ),
    );
  }
}
