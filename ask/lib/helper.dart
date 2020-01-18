import 'package:flutter/material.dart';
import 'Question.dart';

final black = Color(0xFF000000);
final red = Color(0xFFC33C3C);
final gray = Color(0xFF939393);

final Map<String, List<Question>> questions = {
  'MATH': [
    Question(0, 'How are you?', 'I am great', [
      'I am good',
      'I am not good',
      'I am great',
    ]),
    Question(1, 'What happened in 1999?', 'I was born', [
      'I was born',
      'I like someone',
      'bad data',
    ]),
    Question(2, 'What happened to good data?', 'I will repeate it', [
      'I will repeate it',
      'I will repeate it all day',
      'I will repeate it all day every day',
    ]),
  ],
  'Computer Science': [
    Question(0, 'How are you?', 'I am great', [
      'I am good',
      'I am not good',
      'I am great',
    ]),
    Question(1, 'What happened in 1999?', 'I was born', [
      'I was born',
      'I like someone',
      'bad data',
    ]),
    Question(2, 'What happened to good data?', 'I will repeate it', [
      'I will repeate it',
      'I will repeate it all day',
      'I will repeate it all day every day',
    ]),
  ],
  'PHYSICS': [
    Question(0, 'How are you?', 'I am great', [
      'I am good',
      'I am not good',
      'I am great',
    ]),
    Question(1, 'What happened in 1999?', 'I was born', [
      'I was born',
      'I like someone',
      'bad data',
    ]),
    Question(2, 'What happened to good data?', 'I will repeate it', [
      'I will repeate it',
      'I will repeate it all day',
      'I will repeate it all day every day',
    ]),
  ],
  'LOGIC': [
    Question(0, 'How are you?', 'I am great', [
      'I am good',
      'I am not good',
      'I am great',
    ]),
    Question(1, 'What happened in 1999?', 'I was born', [
      'I was born',
      'I like someone',
      'bad data',
    ]),
    Question(2, 'What happened to good data?', 'I will repeate it', [
      'I will repeate it',
      'I will repeate it all day',
      'I will repeate it all day every day',
    ]),
  ],
};
