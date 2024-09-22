////////////////////////////
import 'package:flutter/material.dart';
import 'Question.dart';

void main() {
  runApp(const quizpage());
}

class quizpage extends StatelessWidget {
  const quizpage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: quizz(),
        ),
      ),
    );
  }
}

class quizz extends StatefulWidget {
  const quizz({super.key});

  @override
  State<quizz> createState() => _quizzState();
}

class _quizzState extends State<quizz> {
  List<Icon> MyList = [];
  List<Question> bankofQuestion = [
    Question(Q: "You can lead a cow down stairs but not up stairs.", A: false),
    Question(
        Q: "Approximately one quarter of human bones are in the feet.",
        A: true),
    Question(Q: "A slug\'s blood is green.", A: true),
  ];

  int numberOfq = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                bankofQuestion[numberOfq].Q,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red)),
                  onPressed: () {
                    bool ans = bankofQuestion[numberOfq].A;
                    if (ans == true) {
                      print("true");
                    } else {
                      print("flase");
                    }
                    setState(() {
                      numberOfq++;
                      MyList.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                    });
                    print(numberOfq);
                  },
                  child: Text(
                    "YES",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                  ),
                  onPressed: () {
                    bool ans = bankofQuestion[numberOfq].A;
                    if (ans == false) {
                      print("true");
                    } else {
                      print("flase");
                    }
                    setState(() {
                      numberOfq = numberOfq + 1;
                      MyList.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      );
                    });
                  },
                  child: Text(
                    "NO",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                Row(
                  children: MyList,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
