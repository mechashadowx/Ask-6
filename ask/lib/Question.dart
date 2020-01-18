class Question {
  final int id;
  final String text, answer;
  final List<String> options;

  Question(this.id, this.text, this.answer, this.options);

  bool correct(String option) {
    return option == answer;
  }
}
