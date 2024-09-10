class ProjectModel{

  String? playStoreLink;
  String? appStoreLink;
  String appName;
  String appIcon;
  List<String> screenshots;
  String description;

  ProjectModel({
    required this.playStoreLink,
    required this.appStoreLink,
    required this.appName,
    required this.description,
    required this.appIcon,
    required this.screenshots,
  });
}