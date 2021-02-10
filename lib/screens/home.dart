import 'package:flutter/material.dart';
import 'package:trivial_app2/services/database.dart';
import './create_quiz.dart';
import 'package:trivial_app2/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream quizStream;


  DatabaseService databaseService = new DatabaseService();
  Widget quizList() {
    return Container(
        child: StreamBuilder(
            stream: quizStream,
            builder: (context, snapshot) {
              return snapshot.data == null
                  ? Container(child: Center(child: Text("No quiz available"),),)
                  : ListView.builder(
                itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index){
                  print(snapshot.data.documents.length);
                    return QuizTile(imgUrl: "images/java.jpg", title: snapshot.data.documents[index].data['quizTitle'], description: snapshot.data.documents[index].data['quizDescription']);
                  });
            }));
  }

  @override
  void initState() {
    databaseService.getQuizData().then((val){
      setState(() {
        quizStream = val;
      });
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
        brightness: Brightness.light,
      ),
      body: quizList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateQuiz()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class QuizTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String description;

  QuizTile({@required this.imgUrl, @required this.title, @required this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: Stack(
        children: [
          Image.asset(imgUrl, width:  MediaQuery.of(context).size.width - 48.0,),
          Container(
            child: Column(
              children: [
                Text(title),
                Text(description),
              ],
            ),
          )
        ],
      ),
    );
  }
}

