import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/models/comment.dart';
import 'package:linkedin_clone/models/person.dart';
import 'package:linkedin_clone/models/post.dart';
import 'package:linkedin_clone/views/home/post_detail_card.dart';
import 'package:linkedin_clone/widgets/custom_outlined_button.dart';
import 'package:linkedin_clone/widgets/my_text.dart';

class PostDetailPage extends StatefulWidget {
  final Post detailPost;
  const PostDetailPage({super.key, required this.detailPost});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  bool isCommentButtonVisible = false; // is comment button visible
  bool isCommentTextValid = false; // is user typing comment
  // text editing controller for adding comment to the list
  late TextEditingController tfComment;
  // initialize a person who adds comment
  final Person currentUser = Person(
    "assets/images/profile_picture_placeholder.png",
    "",
    "Safiye Sena Merdin",
    "Infogenix Labs",
    "Mobile Developer",
    "",
    "",
    0,
    0,
    0,
    0,
    0,
    1,
    null,
    true,
  );

  @override
  void initState() {
    super.initState();
    tfComment = TextEditingController();
  }

  void _addComment() {
    if (tfComment.text.trim().isEmpty) return;

    final Comment newComment = Comment(
      tfComment.text.trim(),
      0,
      0,
      "1",
      currentUser,
    );

    // run set state to update page
    setState(() {
      // adding comment to the list and ui
      widget.detailPost.comments.add(newComment);
      // after adding make invisible comment button
      isCommentButtonVisible = false;
      isCommentTextValid = false;
      // clear controller
      tfComment.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Yorum başarıyla eklendi!",
            style: TextStyle(color: Constants.mainWhiteTone, fontSize: 16),
          ),
          duration: Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Constants.mainGreenColor,
          margin: EdgeInsets.symmetric(vertical: 140, horizontal: 20),
        ),
      );
    });
  }

  @override
  void dispose() {
    tfComment.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        actionsPadding: EdgeInsets.all(20),
        actions: [Icon(Icons.more_vert)],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                PostDetailCard(
                  companyLogo: widget.detailPost.person.profilePicture,
                  companyName: widget.detailPost.person.personName,
                  textPost: widget.detailPost.postContent,
                  postImage: widget.detailPost.postImage,
                  followerCount: "${widget.detailPost.person.followerCount}",
                  minute: widget.detailPost.postTime,
                  commentCount: "${widget.detailPost.comments.length}",
                  shareCount: "${widget.detailPost.reShareCount}",
                ),
                // reaksiyonlar title
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      MyText(
                        textContent: "Reaksiyonlar",
                        textSize: 16,
                        textWeight: FontWeight.w400,
                        textColor: Colors.black87,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            child: Image.asset("assets/images/pp_woman1.png"),
                          ),
                          Positioned(
                            bottom: 2,
                            left: 26,
                            child: SizedBox(
                              height: 16,
                              width: 16,
                              child: Image.asset(
                                "assets/icons/applause_reaction.png",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 12),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            child: Image.asset("assets/images/pp_woman2.png"),
                          ),
                          Positioned(
                            bottom: 2,
                            left: 26,
                            child: SizedBox(
                              height: 16,
                              width: 16,
                              child: Image.asset(
                                "assets/icons/like_reaction.png",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 12),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            child: Image.asset("assets/images/pp_man1.png"),
                          ),
                          Positioned(
                            bottom: 2,
                            left: 26,
                            child: SizedBox(
                              height: 16,
                              width: 16,
                              child: Image.asset(
                                "assets/icons/love_reaction.png",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 12),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            child: Image.asset("assets/images/pp_man2.png"),
                          ),
                          Positioned(
                            bottom: 2,
                            left: 26,
                            child: SizedBox(
                              height: 16,
                              width: 16,
                              child: Image.asset(
                                "assets/icons/idea_reaction.png",
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 12),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: 20,
                            child: Image.asset("assets/images/pp_man3.png"),
                          ),
                          Positioned(
                            bottom: 2,
                            left: 26,
                            child: SizedBox(
                              height: 16,
                              width: 16,
                              child: Image.asset(
                                "assets/icons/like_reaction.png",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // comments list
                Expanded(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.detailPost.comments.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return MyCommentContainer(
                        detailComment: widget.detailPost.comments[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, -2),
                        blurRadius: 20,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              CustomOutlinedButton(
                                textButton: "Size katılıyorum",
                              ),
                              SizedBox(width: 10),
                              CustomOutlinedButton(
                                textButton: "Doğru söylediniz",
                              ),
                              SizedBox(width: 10),
                              CustomOutlinedButton(
                                textButton: "Çok iyi bir bakış açısı",
                              ),
                              SizedBox(width: 10),
                              CustomOutlinedButton(textButton: "Katılıyorum"),
                              SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ),
                      // comment text field
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                  backgroundImage: AssetImage(
                                    currentUser.profilePicture,
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: TextField(
                                    controller: tfComment,
                                    onChanged: (value) {
                                      isCommentTextValid =
                                          tfComment.text.trim().isNotEmpty;
                                    },
                                    onTap: () {
                                      setState(() {
                                        isCommentButtonVisible = true;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Yorum ekle...",
                                      hintStyle: TextStyle(fontSize: 14),
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 10,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.black12,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.black26,
                                        ), // veya başka renk
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Visibility(
                              visible: isCommentButtonVisible,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Image.asset(
                                      "assets/icons/picture_icon.png",
                                    ),
                                  ),
                                  Spacer(),
                                  ElevatedButton(
                                    onPressed: () {
                                      isCommentTextValid ? _addComment() : null;
                                    },
                                    child: Text("Yorum Yap"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyCommentContainer extends StatelessWidget {
  final Comment detailComment;
  const MyCommentContainer({super.key, required this.detailComment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // user profile picture
          CircleAvatar(
            radius: 15,
            child: Image.asset(detailComment.person.profilePicture),
          ),
          SizedBox(width: 10),
          // info section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        MyText(
                          textContent: detailComment.person.personName,
                          textSize: 14,
                          textWeight: FontWeight.bold,
                          textColor: Colors.black87,
                        ),
                        MyText(
                          textContent: " ·",
                          textSize: 18,
                          textWeight: FontWeight.w900,
                          textColor: Colors.black54,
                        ),
                        SizedBox(width: 4),
                        MyText(
                          textContent:
                              "${detailComment.person.connectionDegree}.",
                          textSize: 12,
                          textWeight: FontWeight.w400,
                          textColor: const Color.fromARGB(221, 83, 83, 83),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MyText(
                          textContent: "${detailComment.time} dakika",
                          textSize: 12,
                          textWeight: FontWeight.w400,
                          textColor: const Color.fromARGB(221, 83, 83, 83),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.more_vert, color: Colors.black45, size: 20),
                      ],
                    ),
                  ],
                ),
                MyText(
                  textContent: detailComment.person.companyName,
                  textSize: 12,
                  textWeight: FontWeight.w400,
                  textColor: Colors.black54,
                ),
                SizedBox(height: 10),
                MyText(
                  textContent: detailComment.content,
                  textSize: 14,
                  textWeight: FontWeight.w400,
                  textColor: Colors.black87,
                ),
                SizedBox(height: 10),
                // like section
                Container(
                  height: 30,
                  child: Row(
                    children: [
                      MyText(
                        textContent: "Beğendim",
                        textSize: 12,
                        textWeight: FontWeight.w600,
                        textColor: Colors.black54,
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 16,
                        width: 16,
                        child: Image.asset("assets/icons/like_reaction.png"),
                      ),
                      SizedBox(width: 5),
                      MyText(
                        textContent: "1",
                        textSize: 12,
                        textWeight: FontWeight.w400,
                        textColor: Colors.black54,
                      ),
                      // vertical divider
                      VerticalDivider(
                        indent: 5,
                        endIndent: 5,
                        color: Colors.black12,
                      ),
                      MyText(
                        textContent: "Yanıtla",
                        textSize: 12,
                        textWeight: FontWeight.w600,
                        textColor: Colors.black54,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
