import 'package:app_chua/ui/pages/favourite/favourite_page.dart';
import 'package:app_chua/ui/pages/home/home_page.dart';
import 'package:app_chua/ui/pages/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabModel {
  final Widget tabContent;
  final Icon icon;
  TabModel({required this.tabContent, required this.icon});
}
