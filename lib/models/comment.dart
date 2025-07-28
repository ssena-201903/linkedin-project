import 'package:linkedin_clone/models/person.dart';

class Comment {
  final String content;
  final int likeCount;
  final int answerCount;
  final String time;
  final Person person;

  Comment(this.content, this.likeCount, this.answerCount, this.time, this.person);
}