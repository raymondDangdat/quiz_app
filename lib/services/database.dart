import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future<void> addQuizData(Map quizData, String quizId) async {
    await Firestore.instance
        .collection("Quiz")
        .document(quizId)
        .setData(quizData)
        .catchError((e) {
      print("ERROR!");
      print(e.toString());
    });
  }

  Future<void> addQuestionData(Map questionData, String quizID) async {
    await Firestore.instance
        .collection("Quiz")
        .document(quizID)
        .collection("QNA")
        .add(questionData)
        .catchError((e) {
      print(e);
    });
  }

  getQuizTopics() async {
    return Firestore.instance.collection("Quiz").snapshots();
  }

  getQuizData(String quizId) async {
    return Firestore.instance
        .collection("Quiz")
        .document(quizId)
        .collection("QNA")
        .getDocuments();
  }
}
