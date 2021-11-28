import 'package:app_chua/ui/pages/account/widgets/input_field.dart';
import 'package:app_chua/ui/pages/contact/widgets/contact_info.dart';
import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/pop.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final contentController = TextEditingController();
  var selected;
  @override
  void initState() {
    // TODO: implement initState
    selected = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CupertinoPageScaffold(
          backgroundColor: AppColors.white,
          child: CustomScrollView(
            physics: ScrollPhysics(),
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: appHeight * 0.09,
                backgroundColor: AppColors.orange,
                leading: CupertinoNavigationBarBackButton(
                  color: AppColors.white,
                  onPressed: () => context.read<Pop>().onBack(),
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                      child: Center(
                          child: Text(
                    "LIÊN HỆ",
                    style: TextStyle(color: AppColors.white, fontSize: 18),
                  ))),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  child: Stack(
                    children: [
                      Container(
                        color: AppColors.orange,
                        height: appHeight,
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          height: appHeight,
                          width: appWidth,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50))),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Thông tin liên hệ đến chùa",
                                          style: TextStyle(
                                              color: AppColors.orange,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        DropdownSearch<String>(
                                          dropdownSearchDecoration:
                                              InputDecoration(
                                                  border: UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: AppColors
                                                              .orange))),
                                          mode: Mode.MENU,
                                          showSelectedItems: true,
                                          showSearchBox: true,
                                          items: [
                                            "Huyền Không",
                                            "Italia",
                                            "Tunisia",
                                            'Canada'
                                          ],
                                          hint:
                                              'Vui lòng chọn hoặc nhập tên chùa',
                                          onChanged: (text) {
                                            setState(() {
                                              this.selected = text;
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Visibility(
                                          visible: selected != '',
                                          child: ContactInfo(
                                            info: selected,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Text('Liên hệ Ban Quản Trị ứng dụng',
                                            style: TextStyle(
                                                color: AppColors.orange,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: nameController,
                                          validator: (input) {
                                            if (input == '') {
                                              return 'Vui lòng nhập họ và tên';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                              hintText: 'Họ và tên'),
                                        ),
                                        TextFormField(
                                          controller: emailController,
                                          validator: (input) {
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                              hintText: 'Email'),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Stack(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(bottom: 30),
                                        child: TextFormField(
                                          controller: contentController,
                                          maxLines: 8,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: AppColors.semiGrey,
                                            hintText:
                                                "Mời bạn nhập nội dung liên hệ tại đây",
                                            contentPadding:
                                                EdgeInsets.all(25.0),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                          bottom: 2,
                                          left: 20,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                            Color>(
                                                        AppColors.orange),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                ))),
                                            onPressed: () {},
                                            child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10,
                                                    horizontal: 20),
                                                child: Text('Gửi')),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
