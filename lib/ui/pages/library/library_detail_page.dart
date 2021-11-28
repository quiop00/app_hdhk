import 'package:app_chua/ui/widgets/relative_post.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class LibraryDetailPage extends StatefulWidget {
  @override
  _LibraryDetailPageState createState() => _LibraryDetailPageState();
}

class _LibraryDetailPageState extends State<LibraryDetailPage> {
  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: AppColors.white,
          leading: CupertinoNavigationBarBackButton(
            color: AppColors.orange,
            onPressed: () => Navigator.of(context).pop(),
          ),
          middle: Text(
            'THƯ VIỆN',
            style: TextStyle(
                color: AppColors.orange,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          trailing: Icon(Icons.search),
        ),
        child: Container(
          height: appHeight - 30,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: appHeight * 0.3,
                  child: Stack(
                    children: [
                      Container(
                          height: appHeight * 0.28,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/background/account_page.png'),
                                  fit: BoxFit.cover))),
                      Positioned(
                          bottom: 0,
                          right: 15,
                          child: Icon(
                            Icons.bookmark_border,
                            size: 25,
                            color: AppColors.orange,
                          ))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        color: AppColors.orange,
                        child: Text(
                          'Văn thơ',
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tiêu đề bài viết',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Container(
                                height: 50,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 30,
                                        child: Row(
                                          children: [
                                            Text('Người viết'),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Icon(Icons.schedule),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text('31/12/2020')
                                          ],
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.share,
                                      color: AppColors.orange,
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider()),
                      Html(
                          onImageTap: (url, context, attributes, element) {},
                          customRender: {
                            'img': (context, child) {
                              return Container(
                                width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            context.tree.attributes['src'] ??
                                                ''),
                                        fit: BoxFit.cover)),
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 10,
                                        right: 10,
                                        child: Icon(Icons.expand)),
                                    Positioned(
                                        bottom: 10,
                                        child: Container(
                                          height: 25,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: AppColors.black
                                                  .withOpacity(0.2)),
                                          child: Text(
                                              'Đây là mô tả của bức hình này'),
                                        ))
                                  ],
                                ),
                              );
                            }
                          },
                          data: '''
                <h2 style="text-align: justify;"><span style="font-size:22px;"><strong>Huyền Không 1 – ngôi chùa mang phong cách Nhật Bản và Ấn Độ</strong></span></h2>

<p style="text-align: justify;">Xứ Huế mộng mơ đâu chỉ có ngôi chùa Thiên Mụ nổi tiếng linh thiêng, kiến trúc tuyệt đẹp. Mà vùng đất cố đô còn có chùa Huyền Không – một ngôi chùa kết hợp hài hòa giữa kiến trúc Nhật Bản và Ấn Độ. Nơi đây trở thành điểm check in không thể bỏ qua khi du khách đến <em><strong><a href="https://dulichvietnam.com.vn/thua-thien-hue.html" target="_blank"><span style="color:#0000cd;">du lịch Huế</span></a></strong></em>.&nbsp;<br />
&nbsp;</p>

<div style="text-align: center;"><img alt="chùa Huyền Không ở Huế" data-ck-zoom="yes" src="https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_1.jpg" /></div>

<div><span class="ck_desc_img">Chùa Huyền Không 1 cách chùa Thiên Mụ khoảng 3 km. Ảnh: Facebook Chùa Huyền Không </span></div>

<p style="text-align: justify;">Chùa Huyền Không còn có tên gọi Huyền Không 1/Huyền Không Sơn Trung để phân biệt với chùa Huyền Không 2/Huyền Không Sơn Thượng. Chùa an tịnh tại thôn Nham Biền, xã Hương Hồ, huyện Hương Trà, nằm cách chùa Thiên Mụ gần khoảng 3 km về hướng tây.&nbsp;</p>

<p style="text-align: justify;">Tiền thân của chùa Huyền Không ở Huế là một chùa nhỏ dựng lên bằng tre nứa vào năm 1973 ở phía Bắc đèo Hải Vân, huyện Phú Lộc. Sau đó vào năm 1978, chùa được sư Giới Đức cho chuyển về vị trí hiện tại, cửa chùa hướng về phía Đông Nam. Đến năm 1993, Chánh Điện chùa được xây dựng lại quy mô hơn, hoàn thành vào 2 năm sau đó.&nbsp;<br />
&nbsp;</p>

<div style="text-align: center;"><img alt="chùa Huyền Không ở Huế" data-ck-zoom="yes" src="https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_4_1.jpg" /><span class="ck_desc_img">Ngôi chùa với phong cách kiến trúc độc đáo. Ảnh: jinyin1918 </span></div>

<p style="text-align: justify;">Ngày nay, đến chùa Huyền Không ở Huế, du khách có cảm giác như đang du lịch nước ngoài bởi lối kiến trúc giao hòa giữa vẻ cổ kính của đất cố đô và nét đẹp ấn tượng của văn hóa Phật giáo Nhật Bản, Ấn Độ.&nbsp;</p>

<p style="text-align: justify;">Chùa được xây dựng từ các vật liệu hiện đại như bê tông, cốt thép rất vững chãi, chắc chắn và có sự uy nghiêm, trang trọng. Ngôi chùa tọa lạc trong khuôn viên khá rộng với tổng diện tích khoảng 6.000 m2, được quy hoạch thành một khung cảnh tràn ngập cây xanh, yên bình và tĩnh tại.&nbsp;<br />
&nbsp;</p>

<div style="text-align: center;"><img alt="chùa Huyền Không ở Huế" data-ck-zoom="yes" src="https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_3_1.jpg" /><span class="ck_desc_img">Tòa tháp này&nbsp;làm nên dấu ấn riêng biệt cho ngôi chùa. Ảnh: b_yennn8</span></div>

<p style="text-align: justify;">Nếu bạn là người thích khám phá triến trúc Phật giáo, thích chụp ảnh check in cùng những công trình độc đáo thì chùa Huyền Không 1 là <u>điểm đến lý tưởng ở Huế</u>. Trong khuôn viên chùa có Bảo tháp Đại Giác, được xây dựng mô phỏng theo đại tháp Mahā Bodhi Gāya nổi tiếng ở Ấn Độ. Tuy nhiên, kích thước ngôi tháp nhỏ hơn nhằm tạo được sự hài hòa với các công trình khác trong chùa.&nbsp;</p>

<p style="text-align: justify;">Người ta sử dụng gạch đất sét nung với hệ dầm và cột bê tông để làm khung chịu lực cho ngọn tháp. Trong khi đó 4 tháp phụ đảm nhận vai trò trang trí và được thực hiện đối trọng, tạo sự cân bằng cho ngọn tháp chính trong những điều kiện thời tiết khắc nghiệt như có bão hoặc động đất.<br />
&nbsp;</p>

<div style="text-align: center;"><img alt="chùa Huyền Không ở Huế" data-ck-zoom="yes" src="https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_5.jpg" /></div>

<div><span class="ck_desc_img">Cổng vào mang đậm nét kiến trúc Nhật Bản. Ảnh: tuannguyen1100</span></div>

<p style="text-align: justify;">Chóp tháp có màu vàng rực rỡ và thân tháp với màu trắng nổi bật, chạm trổ nhiều hoa văn đậm chất Ấn Độ, tạo nên một <em>góc check in đậm chất “ngoại quốc”</em> trong khuôn viên ngôi chùa Việt ở đất cố đô. Tòa bảo tháp cứ thế đứng hiên ngang giữa đất trời, tạo nên một điểm nhấn ấn tượng cho chùa Huyền Không 1 ở Huế.&nbsp;</p>

<p style="text-align: justify;">Ngoài ngôi bảo tháp nổi bật, ngôi chùa đẹp ở Huế này còn cuốn hút du khách bởi không gian cổ kính, quyện hòa giữa kiến trúc truyền thống của Huế và chút nét đẹp tinh tế đậm phong cách Nhật Bản.&nbsp;<br />
&nbsp;</p>
                '''),
                      DefaultTabController(
                        length: 1,
                        child: Column(
                          children: [
                            Container(
                              constraints: BoxConstraints.expand(height: 35),
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: TabBar(
                                  indicatorColor: AppColors.orange,
                                  indicatorWeight: 5,
                                  indicatorSize: TabBarIndicatorSize.label,
                                  labelColor: AppColors.black,
                                  isScrollable: true,
                                  tabs: [
                                    Tab(
                                        child: Text("Bài liên quan",
                                            style: TextStyle(
                                                color: AppColors.orange))),
                                  ]),
                            ),
                            ConstrainedBox(
                              constraints: new BoxConstraints(
                                minHeight: 200.0,
                                maxHeight: 300.0,
                              ),
                              child: new ListView.builder(
                                itemCount: 5,
                                itemBuilder: (context, index) =>
                                    RelativePostItem(),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
