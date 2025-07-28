import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/helpers/data_helper.dart';
import 'package:linkedin_clone/models/person.dart';
import 'package:linkedin_clone/widgets/my_text.dart';
import 'package:linkedin_clone/views/network/person_request_card.dart';

class NetworkBuyut extends StatefulWidget {
  const NetworkBuyut({super.key});

  @override
  State<NetworkBuyut> createState() => _NetworkBuyutState();
}

class _NetworkBuyutState extends State<NetworkBuyut> {
  // to get person data from data helper
  late final List<Person> allPersons;
  // visible person list after some card is closed
  late final List<Person> visiblePersons;

  @override
  void initState() {
    super.initState();

    // initializing person list
    allPersons = DataHelper.getPersons();
    // get copy from all persons list
    visiblePersons = List.from(allPersons);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.bgPageColor,
        body: ListView(
          padding: EdgeInsets.zero, // Varsayılan padding'i kaldırır
          children: [
            // network requests gelecek
            Container(
              child: Column(
                children: [
                  // davetler title gelecek
                  _buildSectionTitle("Davetler (2)"),
                  // davetler listesi gelecek
                  // davet kartı
                  _buildInvitationCard(
                    "Linkedin",
                    3,
                    "assets/icons/linkedin_logo.png",
                    "In the loop",
                  ),
                  _buildInvitationCard(
                    "Hyundai",
                    6,
                    "assets/icons/hyundai_logo.png",
                    "hello",
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            // games horizontal listview gelecek
            _buildGames(),
            SizedBox(height: 8),
            // ağımı yönet gelecek
            _buildSectionTitle("Ağımı yönet"),
            SizedBox(height: 8),
            // öneriler girdview gelecek
            _buildGridContainer(allPersons),
          ],
        ),
      ),
    );
  }

  Container _buildGames() {
    return Container(
      padding: Constants.paddingCard,
      decoration: BoxDecoration(color: Constants.mainWhiteTone),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // games title
          _buildTitleText("Günlük oyunlar aracılığıyla iletişimde kalın"),
          SizedBox(height: 10),
          // games horizontal listview
          SizedBox(
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                // games single container
                _buildSingleGameContainer(
                  "assets/icons/queens_logo.png",
                  "Queens",
                  "438",
                  "2 Tem, Çarşamba",
                  "Çöz",
                ),
                SizedBox(width: 10),
                _buildSingleGameContainer(
                  "assets/icons/tango_logo.png",
                  "Tango",
                  "278",
                  "2 Tem, Çarşamba",
                  "Çöz",
                ),
                SizedBox(width: 10),
                _buildSingleGameContainer(
                  "assets/icons/zip_logo.png",
                  "Zip",
                  "117",
                  "2 Tem, Çarşamba",
                  "Sonuçlar",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  MyText _buildTitleText(String textTitle) {
    return MyText(
      textContent: textTitle,
      textSize: Constants.fontSizeMidTitle,
      textWeight: FontWeight.w400,
      textColor: Constants.mainBlackColor,
    );
  }

  Container _buildSectionTitle(String textTitle) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Constants.mainWhiteTone,
        border: Border(
          bottom: BorderSide(color: Constants.horizontalDividerColor),
        ),
      ),
      child: Row(
        children: [
          // davetler text
          MyText(
            textContent: "$textTitle",
            textSize: Constants.fontSizeMidTitle,
            textWeight: FontWeight.bold,
            textColor: Constants.mainBlackColor,
          ),
          Spacer(),
          Icon(Icons.arrow_forward_sharp, color: Constants.mainDarkGreyColor),
        ],
      ),
    );
  }

  Widget _buildSingleGameContainer(
    String imagePath,
    String name,
    String dayCount,
    String date,
    String buttonText,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Container(
        padding: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: Constants.verticalDividerColor),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40, width: 40, child: Image.asset(imagePath)),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // rich text
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "$name",
                        style: TextStyle(
                          color: Constants.mainBlackColor,
                          fontSize: Constants.fontSizeMidTitle,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: " #$dayCount",
                        style: TextStyle(
                          color: Constants.mainBlackColor,
                          fontSize: Constants.fontSizeMidTitle,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),

                MyText(
                  textContent: "$date",
                  textSize: Constants.fontSizeMiniTitle,
                  textWeight: FontWeight.normal,
                  textColor: Constants.mainBlackColor,
                ),
              ],
            ),
            SizedBox(width: 30),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Constants.mainColor),
              ),
              onPressed: () {},
              child: MyText(
                textContent: "$buttonText",
                textSize: Constants.fontSizeMidTitle,
                textWeight: FontWeight.w600,
                textColor: Constants.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInvitationCard(
    String name,
    int dayCount,
    String image,
    String reason,
  ) {
    return Container(
      padding: Constants.paddingCard,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Constants.horizontalDividerColor),
        ),
        color: Constants.mainWhiteTone,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // card image
          Stack(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                right: 2,
                bottom: 2,
                child: Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Constants.mainWhiteTone,
                      width: 3,
                    ),
                    color: Constants.mainLigthGreenColor,
                  ),
                  child: SizedBox(
                    height: 16,
                    width: 16,
                    child: Image.asset("assets/icons/news_icon.png"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
          // card infos
          Flexible(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    textContent: "Haber Bülteni · Haftalık",
                    textSize: Constants.fontSizeMiniTitle,
                    textWeight: FontWeight.normal,
                    textColor: Constants.mainLightGrey,
                  ),
                  SizedBox(height: 4),
                  // rich text for card content
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$name",
                          style: TextStyle(
                            color: Constants.mainBlackColor,
                            fontSize: Constants.fontSizeMidTitle,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: " sizi",
                          style: TextStyle(
                            color: Constants.mainBlackColor,
                            fontSize: Constants.fontSizeMidTitle,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        TextSpan(
                          text: " $reason",
                          style: TextStyle(
                            color: Constants.mainBlackColor,
                            fontSize: Constants.fontSizeMidTitle,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: " için abone olmaya davet etti",
                          style: TextStyle(
                            color: Constants.mainBlackColor,
                            fontSize: Constants.fontSizeMidTitle,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4),
                  MyText(
                    textContent: "$dayCount gün önce",
                    textSize: Constants.fontSizeMiniTitle,
                    textWeight: FontWeight.normal,
                    textColor: Constants.mainLightGrey,
                  ),
                ],
              ),
            ),
          ),
          // spacer for responsive
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: Row(
              children: [
                // cross button
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Constants.mainLightGrey),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.close, color: Constants.mainDarkGreyColor),
                ),
                SizedBox(width: 14),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Constants.mainColor),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check, color: Constants.mainColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildGridContainer(List<Person> allPerson) {
    return Container(
      padding: Constants.paddingCard,
      color: Constants.mainWhiteTone,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitleText(
            "Son faaliyetlerinize göre tanıyabileceğiniz kişiler",
          ),
          SizedBox(height: 10),
          // GridView
          LayoutBuilder(
            builder: (context, constraints) {
              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200, // bir kartın maksimum genişliği
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3 / 4, // biraz daha dik kartlar
                ),
                itemCount: visiblePersons.length,
                itemBuilder: (context, index) {
                  final person = visiblePersons[index];
                  return PersonRequestCard(
                    person: person,
                    onClose: () {
                      setState(() {
                        visiblePersons.removeAt(index);
                      });
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
