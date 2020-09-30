import 'package:coronapp/localization/translation.dart';
import 'package:coronapp/type/question.dart';
import 'package:flutter/material.dart';

class FaqTab extends StatelessWidget {
  final questionsWithAnswers = [
    new Question(
      "what_covid",
      "serious",
    ),
    new Question(
      "do_corona",
      "idfk",
    ),
    new Question(
      "conspiracy",
      "official",
    ),
    new Question(
      "stop_corona",
      "why_stop",
    ),
    new Question(
      "advice",
      "school_project",
    ),
    new Question(
      "grade",
      "good",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQ"),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: questionsWithAnswers.map((Question question) {
          return Card(
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        getTranslated(context, question.question),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        getTranslated(context, question.answer),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ));
        }).toList(),
      ),
    );
  }
}
