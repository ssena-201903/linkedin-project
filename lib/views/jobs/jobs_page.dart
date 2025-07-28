import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/views/jobs/jobs_top_container.dart';
import 'package:linkedin_clone/views/messages/messages_page.dart';
import 'package:linkedin_clone/views/profile/show_all_section.dart';
import 'package:linkedin_clone/widgets/custom_drawer.dart';
import 'package:linkedin_clone/widgets/custom_sliver_appbar.dart';
import 'package:linkedin_clone/widgets/my_divider.dart';
import 'package:linkedin_clone/widgets/my_text.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({super.key});

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  // global key for drawer, can manage from everywhere easily
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Constants.bgPageColor,
        // Drawer
        drawer: CustomDrawer(),
        body: CustomScrollView(
          slivers: [
            // custom sliver appbar
            CustomSliverAppBar(
              // callback function
              onProfileTap: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              // callback function
              onMessageTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => MessagesPage()));
              },
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  // top container
                  JobsTopContainer(),
                  // job listing
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    color: Constants.mainWhiteTone,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainTitleContainer(
                          title: "Sizin için seçilen en önemli iş ilanları",
                          subtitle:
                              "Profilinize, tercihlerinize ve başvurular, aramalar, kaydedilenler gibi faaliyetlerinize göre",
                        ),
                        const SizedBox(height: 10),
                        // job listing items
                        MyJobCard(
                          companyLogo: "assets/images/nexora_soft.png",
                          jobTitle: "Yazılım Mühendisi",
                          jobLocation:
                              "Kadıköy, İstanbul, Türkiye (İş yerinde)",
                          isNew: true,
                          isEasyApply: true,
                          time: "1 saat önce",
                          companyName: "Nexora Soft",
                        ),
                        MyDivider(),
                        MyJobCard(
                          companyLogo: "assets/images/devix_solutions.png",
                          jobTitle: "Finansal Analist",
                          jobLocation: "Beşiktaş, İstanbul, Türkiye (Hibrit)",
                          isNew: false,
                          isEasyApply: false,
                          time: "2 saat önce",
                          companyName: "Devix Solutions",
                        ),
                        MyDivider(),
                        MyJobCard(
                          companyLogo: "assets/images/infogenix_labs.png",
                          jobTitle: "Veri Bilimci",
                          jobLocation: "Şişli, İstanbul, Türkiye (Uzaktan)",
                          isNew: true,
                          isEasyApply: true,
                          time: "",
                          companyName: "Infogenix Labs",
                        ),
                        ShowAllSection(text: "Tümünü gör"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // recent searches
                  SearchItem(),
                  const SizedBox(height: 8),
                  MyJobCard(
                    companyLogo: "assets/images/nexora_soft.png",
                    jobTitle: "Yazılım Mühendisi",
                    jobLocation: "Kadıköy, İstanbul, Türkiye (İş yerinde)",
                    isNew: true,
                    isEasyApply: true,
                    time: "1 saat önce",
                    companyName: "Nexora Soft",
                  ),
                  MyDivider(),
                  MyJobCard(
                    companyLogo: "assets/images/devix_solutions.png",
                    jobTitle: "Finansal Analist",
                    jobLocation: "Beşiktaş, İstanbul, Türkiye (Hibrit)",
                    isNew: false,
                    isEasyApply: false,
                    time: "2 saat önce",
                    companyName: "Devix Solutions",
                  ),
                  MyDivider(),
                  MyJobCard(
                    companyLogo: "assets/images/infogenix_labs.png",
                    jobTitle: "Veri Bilimci",
                    jobLocation: "Şişli, İstanbul, Türkiye (Uzaktan)",
                    isNew: true,
                    isEasyApply: true,
                    time: "",
                    companyName: "Infogenix Labs",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      color: Constants.mainWhiteTone,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MainTitleContainer(
                title: "En son yapılan aramalar",
                subtitle: "",
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, right: 8),
                child: MyText(
                  textContent: "Temizle",
                  textSize: 14,
                  textWeight: FontWeight.w600,
                  textColor: Constants.mainDarkGreyColor,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // job search item
              Row(
                children: [
                  MyText(
                    textContent: "Mobile developer",
                    textSize: 14,
                    textWeight: FontWeight.w600,
                    textColor: Constants.mainBlackColor,
                  ),
                  const SizedBox(width: 8),
                  MyText(
                    textContent: "59 yeni",
                    textSize: 12,
                    textWeight: FontWeight.w600,
                    textColor: Constants.mainGreenColor,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              // alert item
              MyText(
                textContent: "Uyarı Açık · Türkiye",
                textSize: 14,
                textWeight: FontWeight.w400,
                textColor: Constants.mainLightGrey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyJobCard extends StatelessWidget {
  final String companyLogo;
  final String companyName;
  final String jobTitle;
  final String jobLocation;
  final bool isNew; // update status
  final bool isEasyApply;
  final String time;

  const MyJobCard({
    super.key,
    required this.companyLogo,
    required this.jobTitle,
    required this.jobLocation,
    required this.isNew,
    required this.isEasyApply,
    required this.time,
    required this.companyName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.mainWhiteTone,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // left logo
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(companyLogo, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 12),

            // right side
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // top row with job title and close icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // job title
                      MyText(
                        textContent: jobTitle,
                        textSize: 16,
                        textWeight: FontWeight.w600,
                        textColor: Constants.mainBlackColor,
                      ),
                      // close icon
                      Icon(
                        Icons.close,
                        size: 20,
                        color: Constants.mainDarkGreyColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // company name
                  MyText(
                    textContent: companyName,
                    textSize: 14,
                    textWeight: FontWeight.w400,
                    textColor: Constants.mainDarkGreyColor,
                  ),
                  // company and location
                  MyText(
                    textContent: jobLocation,
                    textSize: 14,
                    textWeight: FontWeight.w400,
                    textColor: Constants.mainLightGrey,
                  ),
                  const SizedBox(height: 8),

                  // status
                  isNew
                      ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.check_circle,
                            size: 16,
                            color: Colors.green,
                          ),
                          SizedBox(width: 4),
                          MyText(
                            textContent: "Başvurular aktif olarak inceleniyor",
                            textSize: 12,
                            textWeight: FontWeight.w400,
                            textColor: Colors.black54,
                          ),
                        ],
                      )
                      : const SizedBox(),
                  const SizedBox(height: 8),
                  isEasyApply
                      ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MyText(
                            textContent: "Öne çıkarılan içerik",
                            textSize: 12,
                            textWeight: FontWeight.w400,
                            textColor: Colors.black54,
                          ),
                          const SizedBox(width: 8),
                          // easy apply icon and text
                          Row(
                            children: [
                              SizedBox(
                                height: 16,
                                width: 16,
                                child: Image.asset(
                                  "assets/icons/linkedin_logo_small.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(
                                "Kolay Başvuru",
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                        ],
                      )
                      : MyText(
                        textContent: "$time saat önce",
                        textSize: 12,
                        textWeight: FontWeight.w600,
                        textColor: Constants.mainGreenColor,
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainTitleContainer extends StatelessWidget {
  final String title;
  final String subtitle;

  const MainTitleContainer({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          textContent: title,
          textSize: 18,
          textWeight: FontWeight.bold,
          textColor: Constants.mainBlackColor,
        ),
        MyText(
          textContent: subtitle,
          textSize: 14,
          textWeight: FontWeight.normal,
          textColor: Constants.mainDarkGreyColor,
        ),
      ],
    );
  }
}
