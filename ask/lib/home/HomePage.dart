import 'package:ask/answer/Answer.dart';
import 'package:ask/helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String title = 'Subjects';

  List<String> subjectsMapping;

  @override
  void initState() {
    super.initState();
    subjectsMapping = List();
    questions.forEach((k, v) {
      subjectsMapping.add(k);
    });
  }

  go(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Answer(
          subject: subjectsMapping[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: red,
      body: Center(
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(top: data.size.height * 0.35),
                child: Center(
                  child: ListView.builder(
                    itemCount: subjectsMapping.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          go(index);
                        },
                        child: Container(
                          height: data.size.height * 0.12,
                          margin: EdgeInsets.symmetric(
                              horizontal: data.size.width * 0.15,
                              vertical: data.size.height * 0.02),
                          decoration: BoxDecoration(
                            color: black,
                            borderRadius:
                                BorderRadius.circular(data.size.width * 0.05),
                          ),
                          child: Center(
                            child: Text(
                              subjectsMapping[index],
                              style: TextStyle(
                                color: gray,
                                fontSize: data.size.width * 0.08,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    },
                    shrinkWrap: true,
                  ),
                ),
              ),
            ),
            Container(
              height: data.size.height * 0.35,
              width: data.size.width,
              child: Center(
                child: Text(
                  this.title,
                  style: TextStyle(
                    color: black,
                    fontSize: data.size.width * 0.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
