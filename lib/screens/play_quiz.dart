import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trivial_app2/models/question_model.dart';
import 'package:trivial_app2/screens/result.dart';
import 'package:trivial_app2/services/database.dart';
import 'package:trivial_app2/widgets/quiz_play_widgets.dart';
import '../widgets/widgets.dart';

class PlayQuiz extends StatefulWidget {
  final String quizId;
  PlayQuiz(this.quizId);
  @override
  _PlayQuizState createState() => _PlayQuizState();
}

int total = 0;
int _correct = 0;
int _inCorrect = 0;
int _notAttempted = 0;

class _PlayQuizState extends State<PlayQuiz> {
  DatabaseService databaseService = new DatabaseService();
  QuerySnapshot questionsSnapshot;

  QuestionModel getQuestionModelFromDatasnapshot(
      DocumentSnapshot questionSnapshot) {
    QuestionModel questionModel = new QuestionModel();

    questionModel.question = questionSnapshot.data["question"];

    List<String> options = [
      questionSnapshot.data["option1"],
      questionSnapshot.data["option2"],
      questionSnapshot.data["option3"],
      questionSnapshot.data["option4"],
    ];

    options.shuffle();
    questionModel.option1 = options[0];
    questionModel.option2 = options[1];
    questionModel.option3 = options[2];
    questionModel.option4 = options[3];
    questionModel.correctAnswer = questionSnapshot.data["option1"];
    questionModel.answered = false;

    return questionModel;
  }

  @override
  void initState() {
    databaseService.getQuizData(widget.quizId).then((val) {
      questionsSnapshot = val;

      _notAttempted = 0;
      _correct = 0;
      _inCorrect = 0;
      total = questionsSnapshot.documents.length;

      print("Total :  $total Correct : ");

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black54),
        brightness: Brightness.light,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              questionsSnapshot == null
                  ? Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: questionsSnapshot.documents.length,
                      itemBuilder: (context, index) {
                        return QuizPlayTile(
                          questionModel: getQuestionModelFromDatasnapshot(
                              questionsSnapshot.documents[index]),
                          index: index,
                        );
                      })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Result(
                        correct: _correct,
                        incorrect: _inCorrect,
                        total: total)));
          }),
    );
  }
}

class QuizPlayTile extends StatefulWidget {
  final QuestionModel questionModel;
  final int index;
  QuizPlayTile({this.questionModel, this.index});
  @override
  _QuizPlayTileState createState() => _QuizPlayTileState();
}

class _QuizPlayTileState extends State<QuizPlayTile> {
  String optionSelected = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Q${widget.index + 1} ${widget.questionModel.question}",
            style: TextStyle(fontSize: 17.0, color: Colors.black87),
          ),
          SizedBox(
            height: 12.0,
          ),
          InkWell(
              onTap: () {
                if (!widget.questionModel.answered) {
                  if (widget.questionModel.option1 ==
                      widget.questionModel.correctAnswer) {
                    optionSelected = widget.questionModel.option1;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted - 1;
                    setState(() {});
                  } else {
                    optionSelected = widget.questionModel.option1;
                    widget.questionModel.answered = true;
                    _inCorrect = _inCorrect + 1;
                    _notAttempted = _notAttempted - 1;

                    setState(() {});
                  }
                }
              },
              child: OptionTile(
                  optionSelected: optionSelected,
                  correctAnswer: widget.questionModel.correctAnswer,
                  option: "A",
                  description: widget.questionModel.option1)),
          SizedBox(
            height: 4.0,
          ),
          InkWell(
              onTap: () {
                if (!widget.questionModel.answered) {
                  if (widget.questionModel.option2 ==
                      widget.questionModel.correctAnswer) {
                    optionSelected = widget.questionModel.option2;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted - 1;
                    setState(() {});
                  } else {
                    optionSelected = widget.questionModel.option2;
                    widget.questionModel.answered = true;
                    _inCorrect = _inCorrect + 1;
                    _notAttempted = _notAttempted - 1;

                    setState(() {});
                  }
                }
              },
              child: OptionTile(
                  optionSelected: optionSelected,
                  correctAnswer: widget.questionModel.correctAnswer,
                  option: "B",
                  description: widget.questionModel.option2)),
          SizedBox(
            height: 4.0,
          ),
          InkWell(
              onTap: () {
                if (!widget.questionModel.answered) {
                  if (widget.questionModel.option3 ==
                      widget.questionModel.correctAnswer) {
                    optionSelected = widget.questionModel.option3;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted - 1;
                    setState(() {});
                  } else {
                    optionSelected = widget.questionModel.option3;
                    widget.questionModel.answered = true;
                    _inCorrect = _inCorrect + 1;
                    _notAttempted = _notAttempted - 1;

                    setState(() {});
                  }
                }
              },
              child: OptionTile(
                  optionSelected: optionSelected,
                  correctAnswer: widget.questionModel.correctAnswer,
                  option: "C",
                  description: widget.questionModel.option3)),
          SizedBox(
            height: 4.0,
          ),
          InkWell(
              onTap: () {
                if (!widget.questionModel.answered) {
                  if (widget.questionModel.option4 ==
                      widget.questionModel.correctAnswer) {
                    optionSelected = widget.questionModel.option4;
                    widget.questionModel.answered = true;
                    _correct = _correct + 1;
                    _notAttempted = _notAttempted - 1;
                    setState(() {});
                  } else {
                    optionSelected = widget.questionModel.option4;
                    widget.questionModel.answered = true;
                    _inCorrect = _inCorrect + 1;
                    _notAttempted = _notAttempted - 1;

                    setState(() {});
                  }
                }
              },
              child: OptionTile(
                  optionSelected: optionSelected,
                  correctAnswer: widget.questionModel.correctAnswer,
                  option: "D",
                  description: widget.questionModel.option4)),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
