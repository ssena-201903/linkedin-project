import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/widgets/my_text.dart';

class PostProfile extends StatefulWidget {
  final String profilePicture;
  final String name;
  final String postImage;
  final String minute;
  final String commentCount;
  final String title;

  const PostProfile({
    super.key,
    required this.profilePicture,
    required this.name,
    required this.postImage,
    required this.minute,
    required this.commentCount, required this.title,
  });

  @override
  State<PostProfile> createState() => _PostProfileState();
}

class _PostProfileState extends State<PostProfile> {
  bool isExpanded = false; // is post text expanded
  final String postText =
      "💡 Gelecek, birlikte yazılıyor.Son aylarda ekibimizle birlikte üzerinde çalıştığımız yapay zekâ tabanlı proje nihayet lansman aşamasına geldi. 🚀Bu süreç boyunca sadece teknolojik bir ürün geliştirmedik; aynı zamanda takım ruhunu, esnek çalışma kültürünü ve yaratıcı problem çözme yöntemlerini de yeniden tanımladık.Gece geç saatlere kadar süren beyin fırtınaları, başarısız olan denemeler, küçük zaferler ve büyük derslerle dolu bir yolculuktu bu. 🔍📈 Projemiz, kullanıcıların verimliliğini artırmakla kalmıyor, aynı zamanda kişiselleştirilmiş öneri motoru sayesinde iş süreçlerine yeni bir boyut kazandırıyor.Kısacası: sadece bir yazılım değil, bir vizyon inşa ediyoruz.💬 Bir ekip arkadaşıma göre:Artık toplantılarda konuştuğumuz her şey, sistemin bir sonraki önerisine yön veriyor.Bu cümle bile geldiğimiz noktayı özetliyor aslında.🙏 Başta proje yöneticimiz [@isim] olmak üzere emeği geçen herkese minnettarım.Bir fikrin hayale, hayalin ürüne dönüşmesini hep birlikte yaşamak çok eğerliydi.👉 Sizin de benzer dönüşüm hikâyeleriniz varsa, yorumlara yazmanızı çok isterim.Hadi birlikte öğrenelim, birlikte büyüyelim. 🌱#YapayZeka #AI #TechLeadership #TeamWork #StartupJourney #Innovation";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
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
                                  image: AssetImage(widget.profilePicture),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            // COMPANY NAME, FOLLOWER COUNT AND PUBLISHED TIME
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // person name
                                MyText(
                                  textContent: widget.name,
                                  textSize: 16,
                                  textWeight: FontWeight.bold,
                                  textColor: Colors.black87,
                                ),
                                MyText(
                                  textContent: "${widget. title}",
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
                        Spacer(),
                        // MORE VERT AND CROSS ICONS
                        Row(
                          children: [
                            // more vert icon
                            SizedBox(
                              height: 16,
                              width: 16,
                              child: Image.asset(
                                "assets/icons/more_vert_post.png",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  // POST CONTENT TEXT AND SEE MORE TEXT
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Post text
                        MyText(
                          textContent: postText,
                          textSize: 14,
                          textWeight: FontWeight.w400,
                          textColor: Colors.black,
                          maxLines: isExpanded ? null : 3,
                          textOverflow:
                              isExpanded
                                  ? TextOverflow.visible
                                  : TextOverflow.ellipsis,
                          textHeight: 1.5,
                        ),
                        // see more text
                        if (_shouldShowSeeMore(postText))
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isExpanded = !isExpanded;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: MyText(
                                textContent:
                                    isExpanded ? "daha az" : "daha fazla",
                                textSize: 14,
                                textWeight: FontWeight.w400,
                                textColor: Colors.black45,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // IMAGE POST
                  Row(
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
                  ),
                  // REACTION, COMMENT CONTAINER
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Constants.horizontalDividerColor,
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
                                  textContent: "2",
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
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  SizedBox(
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
      ),
    );
  }

  // should text expanded or not
  bool _shouldShowSeeMore(String postText) {
    // if text length is higher than 3 lines
    return postText.length > 120;
  }
}
