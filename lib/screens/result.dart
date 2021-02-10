import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
class Result extends StatefulWidget {
  final int correct, incorrect, total;
  Result({this.correct, this.incorrect, this.total});

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
      ),
      body: Container(
        child: Column(
          children: [
            Text(""),
            SizedBox(height: 8.0,),
            Text("You answered ${widget.correct} answers correctly and ${widget.incorrect} answers incorrectly"),
          ],
        ),
      ),
    );
  }
}
