import 'package:coronapp/type/question.dart';
import 'package:flutter/material.dart';

class FaqTab extends StatelessWidget {
  final questionsWithAnswers = [
    new Question(
      "What is COVID-19?",
      "You serious? Are you dead? Don't you read the news?",
    ),
    new Question(
      "Do I have corona?",
      "Idfk dumb ass... for god's sake test yourself and stay the hell away from me",
    ),
    new Question(
      "Is COVID-19 a conspiracy theory created by the Belgian government to distract us from the fact that 573 days after the election we still have no 'real' government?",
      "Officially, no",
    ),
    new Question(
      "How do we stop corona?",
      "Why do you want to stop it? It's a great time to be alive!",
    ),
    new Question(
      "Is the advice considered medically approved?",
      "No, this is a f*cking school project you idiot.",
    ),
    new Question(
      "What grade are you going to get for this project?",
      "Most likely a 19 out of 20, but a 20 is also good.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FAQ"),
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
                        question.question,
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
                        question.answer,
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
