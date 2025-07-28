import 'package:linkedin_clone/models/comment.dart';
import 'package:linkedin_clone/models/person.dart';

class Post {
  final String postContent;
  final String postTime;
  final String postImage;
  final int reShareCount;
  final int likeCount;
  final Person person;
  final List<Comment> comments;

  Post(this.postContent, this.postTime, this.postImage, this.reShareCount, this.likeCount, this.person, this.comments);
}