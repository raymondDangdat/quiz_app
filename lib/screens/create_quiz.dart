import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:trivial_app2/screens/add_question.dart';
import 'package:trivial_app2/services/database.dart';
import 'package:trivial_app2/widgets/widgets.dart';

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formKey = GlobalKey<FormState>();
  String quizUrl, quizTitle, quizDescription, quizId;
  DatabaseService databaseService = new DatabaseService();

  bool _isLoading = false;

  createQuiz() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      quizId = randomAlphaNumeric(16);
      Map<String, String> quizMap = {
        "quizId": quizId,
        "quizImgUrl": quizUrl,
        "quizTitle": quizTitle,
        "quizDescription": quizDescription,
      };

      await databaseService.addQuizData(quizMap, quizId).then((value) {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => AddQuestion(
                      quizID: quizId,
                    )));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "Enter Image URL" : null,
                      decoration: InputDecoration(
                        hintText: "Quiz Image URL",
                      ),
                      onChanged: (val) {
                        quizUrl = val;
                      },
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "Enter Image URL" : null,
                      decoration: InputDecoration(
                        hintText: "Quiz Title",
                      ),
                      onChanged: (val) {
                        quizTitle = val;
                      },
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "Enter Image URL" : null,
                      decoration: InputDecoration(
                        hintText: "Quiz Description",
                      ),
                      onChanged: (val) {
                        quizDescription = val;
                      },
                    ),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          createQuiz();
                        },
                        child:
                            blueButton(context: context, label: "Create Quiz")),
                    SizedBox(
                      height: 60.0,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
