import 'package:animation_search_bar/animation_search_bar.dart'
    show AnimationSearchBar;
import 'package:flutter/material.dart';

/// animation_search_bar
void main() =>
    runApp(const MaterialApp(home: Home(), debugShowCheckedModeBanner: false));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController controller;
  late List<String> countries;

  @override
  void initState() {
    super.initState();
    countries = _countries;
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(75),
          // here the desired height
          child: AnimationSearchBar(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            iconsColor: Colors.white,
            hintStyle: const TextStyle(
              color: Colors.white,
            ),
            title: const Row(
              children: [
                Icon(
                  Icons.waving_hand_sharp,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 4,
                ),
                Text('Animation Search Bar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
              ],
            ),
            onChanged: (text) {},
          ),
        ),
        body: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              color: Colors.white,
            ),
            child: ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) =>
                  ListTile(title: Text(countries[index])),
            )));
  }
}

const _countries = [
  'Afghanistan',
  'Albania',
  'Algeria',
  'Andorra',
  'Azerbaijan',
  'Bahrain',
  'Bangladesh',
  'Bosnia and Herzegovina',
  'Brunei',
  'Burkina Faso',
  'Chad',
  'Djibouti',
  'Egypt',
  'Eritrea',
  'Ethiopia',
  'Gambia',
  'Ghana'
];
