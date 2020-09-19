import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:istqbglossary/word.dart';
import 'package:flutter/material.dart';
import 'package:istqbglossary/detail_page.dart';
import 'package:istqbglossary/personDataBuilder.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ISTQB Glossary',
      theme: new ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0), fontFamily: 'Raleway'),
      home: new ListPage(title: 'Lessons'),
      // home: DetailPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  //---
  List<Word> _wordList = [];
  List<Word> _filteredList = [];

  //TextEditingController controller = new TextEditingController();
  String filter = "";

  //Icon actionIcon = new Icon(Icons.search);

  //---

  //--

  //---
  void _onSearch(value) {
    setState(() {
      _filteredList = _wordList
          .where((item) =>
          item.wordName.toLowerCase().contains(('$value').toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    //words = getWords();
    //--
    PersonDataBuilder pdb = new PersonDataBuilder();
    List<Word> tmpList = new List<Word>();
    for (int i = 0; i < pdb.getWords().length; i++) {
      tmpList.add(pdb.getWords()[i]);
    }
    setState(() {
      _wordList = tmpList;
      _filteredList = _wordList;
    });

    super.initState();
    //--
  }

  @override
  Widget build(BuildContext context) {
    final appTopAppBar = AppBar(
      centerTitle: true,
      elevation: 50,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),

      title: Text(
        "ISTQB Glossary", textAlign: TextAlign.center,


        //textAlign: TextAlign.right,
      ),

    );

    ListTile personListTile(Word word) => ListTile(
      trailing: Icon(Icons.keyboard_arrow_right,
          color: Color.fromRGBO(58, 66, 86, 1.0), size: 30.0),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(word: word)));
      },
      title: Text(
        '${word.wordName}',
        style: TextStyle(
            color: Color.fromRGBO(58, 66, 86, 1.0),
            fontWeight: FontWeight.bold,
            fontSize: 18.0),
      ),
    );

    Card personCard(Word word) => Card(
      margin: EdgeInsets.all(8.0),

      elevation: 5,
      child: Container(

        decoration: BoxDecoration(

          // color: Color.fromRGBO(64, 75, 96, .9
            color: Colors.grey[50]),
        child: personListTile(word),
      ),
    );

/*
    if ((filter.isNotEmpty)) {
      List<Word> tmpList = new List<Word>();
      for (int i = 0; i < _filteredList.length; i++) {
        if (_filteredList[i]
            .wordName
            .toLowerCase()
            .contains(filter.toLowerCase()) ) {
          tmpList.add(_filteredList[i]);
        }
      }
      _filteredList = tmpList;
    }


 */

    final appBody = Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              fillColor: Colors.grey[100],
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
            onChanged: _onSearch,
          ),
        ),
        Expanded(
          child: Container(
            //color: Color.fromRGBO(58, 66, 86, 1.0),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _filteredList.length,
              itemBuilder: (BuildContext context, int index) {
                return personCard(_filteredList[index]);
              },
            ),
          ),
        )
      ],
    );

    return Scaffold(
      appBar: appTopAppBar,
      body: appBody,
    );
  }
}
