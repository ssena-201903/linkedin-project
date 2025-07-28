class Person {
  final String profilePicture;
  final String backgroundProfilePicture;
  final String personName;
  final String companyName;
  final String personTitle;
  final String aboutText;
  final String location;
  final int profileViewCount;
  final int profileSearchCount;
  final int postViewCount;
  final double followerCount;
  final int networkCount;
  final int connectionDegree;
  final bool isPremium;
  final Person? commonPerson;

  Person(
    this.profilePicture,
    this.backgroundProfilePicture,
    this.personName,
    this.companyName,
    this.personTitle,
    this.aboutText,
    this.location,
    this.profileViewCount,
    this.profileSearchCount,
    this.postViewCount,
    this.followerCount,
    this.networkCount,
    this.connectionDegree,
    this.commonPerson,
    this.isPremium,
  );
}
