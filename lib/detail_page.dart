import 'package:flutter/cupertino.dart';
import 'package:istqbglossary/word.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Word word;

  DetailPage({Key key, this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTopAppBar = AppBar(
      centerTitle: true,
      elevation: 10,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text(
        "ISTQB Glossary", textAlign: TextAlign.center,

        //textAlign: TextAlign.right,
      ),
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          //height: MediaQuery.of(context).size.height * 0.5,
          /*
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("drive-steering-wheel.jpg"),
                fit: BoxFit.cover,
              ),
            )


             */
        ),
        Container(
          //height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: appTopAppBar,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContent = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      //color: Colors.grey,

      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              word.wordName,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
    final bottomContent2 = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      //color: Colors.grey,
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              word.definition,
              style: TextStyle(fontSize: 18.0),
            )
          ],
        ),
      ),
    );

    final synonym = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      //color: Colors.grey,
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              "Synonym: " + word.synonym,
              style: TextStyle(fontSize: 18.0),
            )

          ],
        ),
      ),
    );
    final seeAlso = Container(
      // height: MediaQuery.of(context).size.height,
      //width: MediaQuery.of(context).size.width,
      //color: Colors.grey,

      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              "See Also: " + word.seeAlso,
              style: TextStyle(fontSize: 18.0),
            )

          ],
        ),
      ),
    );

    //contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
/*
    final syylabus = ListTile(
        contentPadding: EdgeInsets.all(10.0),

      title: Text(
        "Used in Syllabus:",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal,fontSize: 18),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Container(
        padding: EdgeInsets.all(5.0),

        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(5.0)
              ),
              //Icon(Icons.check_box, color: Colors.indigo[100]),
              Text(word.bold.split(",").join("\n"),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
              Text(word.light.split(",").join("\n"),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15)),
            ],
          ),
        ),
      ),
    );

    */

    final ref = Container(
      // height: MediaQuery.of(context).size.height,
      //width: MediaQuery.of(context).size.width,
      //color: Colors.grey,

      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              "Reference: " + word.reference,
              style: TextStyle(fontSize: 18.0),
            )

          ],
        ),
      ),
    );
/*





    Text("Reference: " + word.reference)

 */

    return Scaffold(
      body: Column(
        children: <Widget>[
          appTopAppBar,
          bottomContent,
          bottomContent2,
          synonym,
          seeAlso,
          ref
        ],
      ),
    );
  }
}
