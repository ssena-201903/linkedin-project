import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/helpers/data_helper.dart';
import 'package:linkedin_clone/models/experience.dart';
import 'package:linkedin_clone/views/profile/dashed_border_box.dart';
import 'package:linkedin_clone/views/profile/experience_section_widget.dart';
import 'package:linkedin_clone/views/profile/post_profile.dart';
import 'package:linkedin_clone/views/profile/show_all_section.dart';
import 'package:linkedin_clone/widgets/my_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController tfAppbar = TextEditingController(
    text: "Safiye Sena Merdin",
  );

  late List<Experience> myExperiences = [];
  late List<Experience> myEducations = [];
  late List<Experience> myCertificates = [];

  @override
  void initState() {
    super.initState();

    myExperiences = DataHelper.experienceList;
    myEducations = DataHelper.educationList;
    myCertificates = DataHelper.certicificateList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.mainWhiteTone,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Constants.mainWhiteTone,
        actionsPadding: EdgeInsets.only(right: 10),
        title: Expanded(
          // Search TextField
          child: Container(
            height: Constants.appbarSearchHeight,
            child: TextField(
              controller: tfAppbar,
              decoration: InputDecoration(
                prefixIcon: SizedBox(
                  height: Constants.appbarSearchIconSize,
                  width: Constants.appbarSearchIconSize,
                  child: Icon(Icons.search),
                ),
                contentPadding: EdgeInsets.zero,
                filled: true,
                fillColor: Color(0xffEEF3F7),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide.none,
                ),
                hintText: "Arama Yap",
              ),
            ),
          ),
        ),
        actions: [
          SizedBox(
            height: Constants.appbarIconSize,
            width: Constants.appbarIconSize,
            child: Icon(Icons.settings, color: Constants.mainDarkGreyColor),
          ),
        ],
      ),
      // body
      body: ListView(
        children: [
          // profile image section
          _buildTitleSection(),
          const SizedBox(height: 20),
          // views analysis section
          _buildAnalysis(),
          const SizedBox(height: 20),
          // about section
          _buildAbout(),
          const SizedBox(height: 30),
          // posts section
          _buildPosts(),
          const SizedBox(height: 20),
          // experience section
          ExperienceSectionWidget(
            myExperiences: myExperiences,
            title: "Deneyim",
          ),
          // education section
          const SizedBox(height: 20),
          ExperienceSectionWidget(myExperiences: myEducations, title: "Eğitim"),
          // sertificates
          const SizedBox(height: 20),
          _buildCertificates(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // certificates section
  _buildCertificates() {
    return Column(
      children: [
        ExperienceSectionWidget(
          myExperiences: myCertificates,
          title: "Lisanslar ve sertifikalar",
        ),
        ShowAllSection(text: "19 sertifikanın tümünü gör"),
      ],
    );
  }

  // header section, general info
  Stack _buildTitleSection() {
    return Stack(
      children: [
        SizedBox(
          height: 520,
          child: Column(
            children: [
              // top placeholder image
              Expanded(
                flex: 2,
                // stack: profile image, pencil icon and photo symbol
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/profile_top_placeholder.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  width: double.infinity,
                  // infos column
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            MyText(
                              textContent: "Safiye Sena Merdin",
                              textSize: 24,
                              textWeight: FontWeight.w600,
                              textColor: Constants.mainBlackColor,
                            ),
                            const SizedBox(width: 10),
                            // premium icon
                            Image.asset(
                              "assets/icons/premium_logo.png",
                              height: 16,
                              width: 16,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // dotted border elevated button
                        DashedBorderBox(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.verified_user_outlined,
                                color: Constants.mainColor,
                                size: 16,
                              ),
                              SizedBox(width: 4),
                              MyText(
                                textContent: "Doğrulama rozeti ekleyin",
                                textSize: 12,
                                textWeight: FontWeight.w700,
                                textColor: Constants.mainColor,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        // person title
                        Row(
                          children: [
                            SizedBox(
                              width: 300,
                              child: MyText(
                                textContent:
                                    "CE | Mobile Developer | UI/UX Principles | Firebase | Flutter",
                                textSize: 16,
                                textWeight: FontWeight.w500,
                                textColor: Constants.mainBlackColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        MyText(
                          textContent: "İstanbul, Türkiye",
                          textSize: 14,
                          textWeight: FontWeight.normal,
                          textColor: Constants.mainLightGrey,
                        ),
                        const SizedBox(height: 10),
                        // follower and connection count
                        MyText(
                          textContent: "233 takipçi · 223 bağlantı",
                          textSize: 14,
                          textWeight: FontWeight.bold,
                          textColor: Constants.mainColor,
                        ),
                        const SizedBox(height: 10),
                        // buttons row
                        Row(
                          children: [
                            // "Açık" button
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Açık",
                                  style: TextStyle(
                                    color: Constants.mainWhiteTone,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),

                            // "Bölüm Ekle" button
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Constants.mainColor),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Bölüm Ekle",
                                  style: TextStyle(
                                    color: Constants.mainColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),

                            // circle more button
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: EdgeInsets.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  side: BorderSide(
                                    color: Constants.mainDarkGreyColor,
                                  ),
                                ),
                                child: Icon(
                                  Icons.more_horiz,
                                  size: 20,
                                  color: Constants.mainDarkGreyColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        // "profili geliştir" button
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Constants.mainColor),
                                ),
                                onPressed: () {},
                                child: Text(
                                  "Profili geliştir",
                                  style: TextStyle(
                                    color: Constants.mainColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // profile image
        Positioned(
          top: 50,
          left: 30,
          child: Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Constants.mainWhiteTone, width: 4),
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                "assets/images/profile_picture_placeholder.png",
              ),
            ),
          ),
        ),

        // photo symbol
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Constants.mainWhiteTone,
              image: DecorationImage(
                image: AssetImage("assets/icons/camera_blue_icon.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),

        // pencil icon
        Positioned(
          top: 120,
          right: 10,
          child: SizedBox(
            height: 25,
            width: 25,
            child: Image.asset("assets/icons/pencil.png"),
          ),
        ),
      ],
    );
  }

  // analysis section
  Padding _buildAnalysis() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // "analizler" text
          Row(
            children: [
              MyText(
                textContent: "Analizler",
                textSize: Constants.textHeaderSize,
                textWeight: Constants.textHeaderWeight,
                textColor: Constants.textHeaderColor,
              ),
            ],
          ),
          // "size özel" row
          Row(
            children: [
              // icon
              Icon(
                Icons.visibility,
                color: Constants.mainDarkGreyColor,
                size: 16,
              ),
              const SizedBox(width: 4),
              // text
              MyText(
                textContent: "Size özel",
                textSize: 14,
                textWeight: FontWeight.w500,
                textColor: Constants.mainLightGrey,
              ),
            ],
          ),
          // analysis widgets
          // profile view count
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Constants.horizontalDividerColor),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset("assets/icons/network_dark.png"),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      textContent: "139 profil görüntülemesi",
                      textSize: 16,
                      textWeight: FontWeight.bold,
                      textColor: Constants.mainBlackColor,
                    ),
                    MyText(
                      textContent: "Profilinize kimlerin baktığını keşfedin",
                      textSize: 14,
                      textWeight: FontWeight.w400,
                      textColor: Constants.mainBlackColor,
                    ),

                    //
                  ],
                ),
              ],
            ),
          ),
          // post view count
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Constants.horizontalDividerColor),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 26,
                  width: 26,
                  child: Image.asset("assets/icons/analytic_icon.png"),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      textContent: "806 gönderi gösterimi",
                      textSize: 16,
                      textWeight: FontWeight.bold,
                      textColor: Constants.mainBlackColor,
                    ),
                    MyText(
                      textContent:
                          "Gönderiniz ile etkileşim kuran kişileri görün",
                      textSize: 14,
                      textWeight: FontWeight.w400,
                      textColor: Constants.mainBlackColor,
                    ),
                    SizedBox(height: 2),
                    MyText(
                      textContent: "Son 7 gün",
                      textSize: 14,
                      textWeight: FontWeight.w400,
                      textColor: Constants.mainLightGrey,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // search view count
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Constants.horizontalDividerColor),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 26,
                  width: 26,
                  child: Image.asset("assets/icons/analytic_icon.png"),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      textContent: "135 arama görünümü",
                      textSize: 16,
                      textWeight: FontWeight.bold,
                      textColor: Constants.mainBlackColor,
                    ),
                    SizedBox(
                      width: 280,
                      child: MyText(
                        textContent:
                            "Arama sonuçlarında ne kadar sık göründüğünüzü görün.",
                        textSize: 14,
                        textWeight: FontWeight.w400,
                        textColor: Constants.mainBlackColor,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // "Tüm analizleri göster" text and arrow icon
          ShowAllSection(text: "Tüm analizleri göster"),
        ],
      ),
    );
  }

  // about section
  Padding _buildAbout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // "hakkında" title and edit icon row
          Row(
            children: [
              MyText(
                textContent: "Hakkında",
                textSize: Constants.textHeaderSize,
                textWeight: Constants.textHeaderWeight,
                textColor: Constants.textHeaderColor,
              ),
              Spacer(),
              SizedBox(
                height: 25,
                width: 25,
                child: Image.asset("assets/icons/pencil.png"),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // about text content
          MyText(
            textContent:
                "Flutter ile mobil uygulama geliştirme alanında uzmanlaşmış bir yazılım geliştiriciyim. Temiz kod yazımı, performans odaklı geliştirme ve kullanıcı deneyimi önceliğimdir.Firebase, REST API ve modern UI/UX prensipleriyle projeler üretmekteyim.Takım çalışmasına yatkın, sürekli öğrenmeye açık bir geliştiriciyim.Yeni teknolojileri takip ederek kendimi sürekli geliştirmeye devam ediyorum.",
            textSize: 14,
            textWeight: FontWeight.normal,
            textColor: Constants.mainBlackColor,
            maxLines: 3,
            textOverflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 20),
          // "en önemli yetenekler" container
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Constants.horizontalDividerColor),
              borderRadius: BorderRadius.circular(8),
            ),
            // general container row
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // 1.row
                Row(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset("assets/icons/diamond_icon2.png"),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          textContent: "En önemli yetenekler",
                          textSize: 16,
                          textWeight: FontWeight.bold,
                          textColor: Constants.mainBlackColor,
                        ),
                        SizedBox(
                          width: 200,
                          child: MyText(
                            textContent:
                                "Kullanıcı Arabirimi Tasarımı · Flutter · React.js · Android",
                            textSize: 14,
                            textWeight: FontWeight.w400,
                            textColor: Constants.mainBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                // 2.row
                Icon(Icons.arrow_forward, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPosts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // "faaliyet" text
                  MyText(
                    textContent: "Faaliyet",
                    textSize: Constants.textHeaderSize,
                    textWeight: Constants.textHeaderWeight,
                    textColor: Constants.textHeaderColor,
                  ),
                  Spacer(),
                  // "gönderi oluşturun" button and edit icon
                  Row(
                    children: [
                      // "gönderi oluşturun" button
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Constants.mainColor),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Gönderi oluşturun",
                          style: TextStyle(
                            color: Constants.mainColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        height: 25,
                        width: 25,
                        child: Image.asset("assets/icons/pencil.png"),
                      ),
                    ],
                  ),
                ],
              ),
              // takipçi text
              MyText(
                textContent: "233 takipçi",
                textSize: 14,
                textWeight: FontWeight.bold,
                textColor: Constants.mainColor,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constants.mainGreenColor,
                      foregroundColor: Constants.mainWhiteTone,
                    ),
                    onPressed: () {},
                    child: Text("Gönderiler"),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Yorumlar",
                      style: TextStyle(
                        color: Constants.buttonGreyTextColor,
                        fontWeight: Constants.buttonTextWeight,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "Resimler",
                      style: TextStyle(
                        color: Constants.buttonGreyTextColor,
                        fontWeight: Constants.buttonTextWeight,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // post profile page
        Column(
          children: [
            PostProfile(
              profilePicture: "assets/images/profile_picture_placeholder.png",
              name: "Safiye Sena Merdin",
              postImage: "assets/images/post_image1.png",
              minute: "7",
              commentCount: "2",
              title: "CE | Mobile Developer | UI/UX Principles | Firebase",
            ),

            // "Tüm gönderileri göster" container
            ShowAllSection(text: "Tüm gönderileri göster"),
          ],
        ),
      ],
    );
  }
}
