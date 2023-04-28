import 'package:flutter/material.dart';
import 'package:res_builder/screens/form_page.dart';
import 'package:res_builder/screens/res_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.pink[100]!,
            Colors.pink[900]!,
          ],
        ),
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const Spacer(),
          SizedBox(
            height: 150,
            width: 150,
            child: Image.asset(
              "assets/resume.png",
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          const Text(
            'Start Building Resume',
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(20),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResList()));
                  },
                  child: const Text(
                    'Saved Resume',
                    style: TextStyle(color: Colors.white),
                  )),
              ElevatedButton(
                  style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(20),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FormPage()));
                  },
                  child: const Text('Build Resume')),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    ));
  }
}
