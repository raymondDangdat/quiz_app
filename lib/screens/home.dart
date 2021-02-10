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
      margin: EdgeInsets.symmetric(horizontal: 24.0),
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
      margin: EdgeInsets.only(bottom: 8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(imgUrl, width:  MediaQuery.of(context).size.width - 48.0, fit: BoxFit.cover,)),
          Container(
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(8.0),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: TextStyle(color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.w600),),
                SizedBox(height: 6.0,),
                Text(description, style: TextStyle(color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w400),),
              ],
            ),
          )
        ],
      ),
    );
  }
}

