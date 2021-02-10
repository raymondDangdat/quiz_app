import 'package:flutter/material.dart';
import 'package:trivial_app2/services/database.dart';
import 'package:trivial_app2/widgets/widgets.dart';

class AddQuestion extends StatefulWidget {
  final String quizID;
  AddQuestion({this.quizID});
  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formKey = GlobalKey<FormState>();
  String question, option1, option2, option3, option4;
  bool _isLoading = false;

  DatabaseService databaseService = new DatabaseService();

  uploadQuestionData() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      Map<String, String> questionMap = {
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4,
      };

      await databaseService
          .addQuestionData(questionMap, widget.quizID)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black87),
        brightness: Brightness.light,
      ),
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                ),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter question" : null,
                        decoration: InputDecoration(
                          hintText: "Question",
                        ),
                        onChanged: (val) {
                          question = val;
                        },
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter option 1" : null,
                        decoration: InputDecoration(
                          hintText: "Option 1 (Correct Answer)",
                        ),
                        onChanged: (val) {
                          option1 = val;
                        },
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter option 2" : null,
                        decoration: InputDecoration(
                          hintText: "Option 2",
                        ),
                        onChanged: (val) {
                          option2 = val;
                        },
                      ),

                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter option 3" : null,
                        decoration: InputDecoration(
                          hintText: "Option 3",
                        ),
                        onChanged: (val) {
                          option3 = val;
                        },
                      ),

                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter option 4" : null,
                        decoration: InputDecoration(
                          hintText: "Option 4",
                        ),
                        onChanged: (val) {
                          option4 = val;
                        },
                      ),

                      // Spacer(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                // uploadQuestionData();
                              },
                              child: blueButton(
                                  context: context,
                                  label: "Submit",
                                  buttonWidth:
                                      MediaQuery.of(context).size.width / 2 -
                                          (36))),
                          SizedBox(
                            width: 24.0,
                          ),
                          InkWell(
                              onTap: () {
                                uploadQuestionData();
                              },
                              child: blueButton(
                                  context: context,
                                  label: "Add Question",
                                  buttonWidth:
                                      MediaQuery.of(context).size.width / 2 -
                                          (36))),
                        ],
                      ),
                      SizedBox(
                        height: 60.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
