import 'package:ask/Question.dart';
import 'package:ask/helper.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Answer extends StatefulWidget {
  final String subject;

  Answer({this.subject});

  @override
  _AnswerState createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  final PageController pageController = PageController(
    viewportFraction: 0.8,
  );

  int currentPage;

  @override
  void initState() {
    super.initState();
    currentPage = 0;
    pageController.addListener(() {
      int next = pageController.page.round();
      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  back() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: red,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Center(
                  child: Text(
                    widget.subject,
                    style: TextStyle(
                      color: black,
                      fontSize: data.size.width * 0.15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                height: data.size.height * 0.6,
                child: Center(
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    itemCount: questions[widget.subject].length,
                    itemBuilder: (context, index) {
                      bool active =
                          currentPage == questions[widget.subject][index].id;
                      return pageBuilder(
                        questions[widget.subject][index],
                        active,
                        data,
                      );
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: back,
                child: Container(
                  child: Center(
                    child: Image.asset(
                      'assets/back.png',
                      height: data.size.width * 0.18,
                      width: data.size.width * 0.18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget pageBuilder(Question question, bool active, MediaQueryData data) {
    double height = active ? data.size.height * 0.6 : data.size.height * 0.45;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: data.size.width * 0.05),
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          height: height,
          decoration: BoxDecoration(
            color: black,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Center(
                  child: Text(
                    (question.id + 1).toString() + '/3',
                    style: TextStyle(
                      color: gray,
                      fontSize: data.size.width * 0.08,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Text(
                    question.text,
                    style: TextStyle(
                      color: gray,
                      fontSize: data.size.width * 0.1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: options(question.options, data, active),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> options(List<String> list, MediaQueryData data, bool active) {
    double height = active ? data.size.height * 0.05 : 0;
    double width = active ? data.size.width * 0.6 : 0;
    double fontSize = active ? data.size.width * 0.05 : 0;
    Color color = active ? gray : black;

    List<Widget> optionsContainer = List();
    for (int i = 0; i < list.length; i++) {
      optionsContainer.add(
        AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          height: height,
          width: width,
          margin: EdgeInsets.symmetric(
            horizontal: data.size.width * 0.07,
            vertical: 10.0,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Align(
            alignment: Alignment.center,
            child: AutoSizeText(
              list[i],
              style: TextStyle(
                color: black,
                fontSize: fontSize,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              minFontSize: 0,
            ),
          ),
        ),
      );
    }
    return optionsContainer;
  }
}
