import 'package:app_chua/config/route_manager.dart';

class MenuOption {
  String name;
  String routePath;
  MenuOption({required this.name, required this.routePath});
  factory MenuOption.fromJson(Map<String, dynamic> json) =>
      MenuOption(name: json["name"], routePath: json["routePath"]);
  static final menuOptions = [
    {"name": "SỬ LIỆU", "routePath": RouteName.history},
    {"name": "THƯ VIỆN", "routePath": RouteName.library},
    {"name": "PHÁP THOẠI", "routePath": RouteName.dialogue},
    {"name": "TRIỂN LÃM", "routePath": RouteName.exhibition},
    {"name": "SỰ KIỆN", "routePath": RouteName.event},
    {"name": "LIÊN HỆ", "routePath": RouteName.contact},
  ];
  static getOptions() {
    return menuOptions.map((e) => MenuOption.fromJson(e)).toList();
  }
}
