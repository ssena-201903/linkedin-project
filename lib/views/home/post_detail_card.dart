import 'package:flutter/material.dart';
import 'package:linkedin_clone/widgets/my_text.dart';

class PostDetailCard extends StatefulWidget {
  final String companyLogo;
  final String companyName;
  final String textPost;
  final String postImage;
  final String followerCount;
  final String minute;
  final String commentCount;
  final String shareCount;

  const PostDetailCard({
    super.key,
    required this.companyLogo,
    required this.companyName,
    required this.postImage,
    required this.followerCount,
    required this.minute,
    required this.commentCount,
    required this.shareCount,
    required this.textPost,
  });

  @override
  State<PostDetailCard> createState() => _PostDetailCardState();
}

class _PostDetailCardState extends State<PostDetailCard> {
  bool isLikedPost = false; // is clicked post like reaction

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                // TITLE ROW
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // LOGO IMAGE AND COMPANY COLUMN
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // logo image
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              // border: Border.all(color: Colors.black),
                              image: DecorationImage(
                                image: AssetImage(widget.companyLogo),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          // COMPANY NAME, FOLLOWER COUNT AND PUBLISHED TIME
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // company name
                              MyText(
                                textContent: widget.companyName,
                                textSize: 16,
                                textWeight: FontWeight.bold,
                                textColor: Colors.black87,
                              ),
                              // follower count
                              MyText(
                                textContent: "${widget.followerCount} takipçi",
                                textSize: 12,
                                textWeight: FontWeight.w400,
                                textColor: const Color.fromARGB(
                                  221,
                                  102,
                                  102,
                                  102,
                                ),
                              ),
                              // published time
                              Row(
                                children: [
                                  MyText(
                                    textContent: "${widget.minute} dakika",
                                    textSize: 12,
                                    textWeight: FontWeight.w400,
                                    textColor: const Color.fromARGB(
                                      221,
                                      102,
                                      102,
                                      102,
                                    ),
                                  ),
                                  MyText(
                                    textContent: " ·",
                                    textSize: 18,
                                    textWeight: FontWeight.w900,
                                    textColor: Colors.black54,
                                  ),
                                  SizedBox(width: 4),
                                  SizedBox(
                                    height: 12,
                                    width: 12,
                                    child: Image.asset(
                                      "assets/icons/earth_post.png",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                // POST CONTENT TEXT
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Post text
                      MyText(
                        textContent: widget.textPost,
                        textSize: 14,
                        textWeight: FontWeight.w400,
                        textColor: Colors.black,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // IMAGE POST
                widget.postImage.isNotEmpty
                    ? Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(widget.postImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                    : SizedBox(),
                // REACTION, COMMENT CONTAINER
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: const Color.fromARGB(31, 82, 82, 82),
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            Positioned(
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: Image.asset(
                                  "assets/icons/like_reaction.png",
                                ),
                              ),
                            ),
                            Positioned(
                              left: 12,
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: Image.asset(
                                  "assets/icons/love_reaction.png",
                                ),
                              ),
                            ),
                            Positioned(
                              left: 24,
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: Image.asset(
                                  "assets/icons/applause_reaction.png",
                                ),
                              ),
                            ),
                            Positioned(
                              left: 36,
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: Image.asset(
                                  "assets/icons/idea_reaction.png",
                                ),
                              ),
                            ),
                            Positioned(
                              left: 60,
                              child: MyText(
                                textContent: isLikedPost ? "10" : "9",
                                textSize: 14,
                                textWeight: FontWeight.w400,
                                textColor: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // comment and share count
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MyText(
                              textContent: "${widget.commentCount} yorum",
                              textSize: 14,
                              textWeight: FontWeight.w400,
                              textColor: Colors.black54,
                            ),
                            SizedBox(width: 6),
                            MyText(
                              textContent: "·",
                              textSize: 16,
                              textWeight: FontWeight.bold,
                              textColor: Colors.black54,
                            ),
                            SizedBox(width: 6),
                            MyText(
                              textContent: "${widget.shareCount} paylaşım",
                              textSize: 14,
                              textWeight: FontWeight.w400,
                              textColor: Colors.black54,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // bottom reaction container (expanded)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      // beğendim container
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isLikedPost = !isLikedPost;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                isLikedPost
                                    ? SizedBox(
                                      height: 16,
                                      child: Image.asset(
                                        "assets/icons/like_reaction.png",
                                      ),
                                    )
                                    : SizedBox(
                                      height: 16,
                                      child: Image.asset(
                                        "assets/icons/like.png",
                                      ),
                                    ),
                                MyText(
                                  textContent: "Beğendim",
                                  textSize: 12,
                                  textWeight: FontWeight.w600,
                                  textColor: Colors.black87,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // yorum yap container
                      Expanded(
                        // efektif olsun diye inkwell ile sarmaladım
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 16,
                                  child: Image.asset(
                                    "assets/icons/comment.png",
                                  ),
                                ),
                                MyText(
                                  textContent: "Yorum Yap",
                                  textSize: 12,
                                  textWeight: FontWeight.w600,
                                  textColor: Colors.black87,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 16,
                                  child: Image.asset(
                                    "assets/icons/reshare.png",
                                  ),
                                ),
                                MyText(
                                  textContent: "Yeniden Yayınla",
                                  textSize: 12,
                                  textWeight: FontWeight.w600,
                                  textColor: Colors.black87,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 16,
                                  child: Image.asset(
                                    "assets/icons/send_post.png",
                                  ),
                                ),
                                MyText(
                                  textContent: "Gönder",
                                  textSize: 12,
                                  textWeight: FontWeight.w600,
                                  textColor: Colors.black87,
                                ),
                              ],
                            ),
                          ),
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
    );
  }
}
