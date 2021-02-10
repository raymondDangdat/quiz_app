import 'package:flutter/material.dart';
import 'package:trivial_app2/screens/home.dart';
import 'package:trivial_app2/screens/play_quiz.dart';
import '../widgets/widgets.dart';

class Result extends StatefulWidget {
  final int correct, incorrect, total;
  Result(
      {@required this.correct, @required this.incorrect, @required this.total});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${widget.correct} / ${widget.total}",
              style: TextStyle(fontSize: 25.0),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              "You answered ${widget.correct} answers correctly and ${widget.incorrect} answers incorrectly",
              style: TextStyle(fontSize: 15.0, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 14.0,
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: blueButton(
                    context: context,
                    label: "Try Again",
                    buttonWidth: MediaQuery.of(context).size.width / 2)),
          ],
        ),
      ),
    );
  }
}
