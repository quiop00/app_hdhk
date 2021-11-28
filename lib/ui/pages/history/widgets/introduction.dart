import 'package:app_chua/utils/color.dart';
import 'package:app_chua/view_model/monk_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class Introduction extends StatefulWidget {
  MonkViewModel model;
  bool scrollable;
  Introduction({required this.model, this.scrollable = false});
  @override
  State<StatefulWidget> createState() {
    return _Introduction();
  }
}

class _Introduction extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: RawScrollbar(
        thumbColor: AppColors.orange,
        child: SingleChildScrollView(
          physics: widget.scrollable
              ? ScrollPhysics()
              : NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Html(shrinkWrap: true, data: """<span>
                          <p>
                          - Từ năm 1965 đến năm 1971 học Đại Học Vạn Hạnh, đồng thời nghiên cứu các Tông phái Phật giáo, tư tưởng các Tôn giáo và triết học Đông Tây.
                          </p>
                          <p style="text-align: justify;">
                          - Năm 1972 làm giám học và giảng dạy Trường trung cấp Phật học Phật Bảo, Quận Tân Bình.
                          </p>
                          <p style="text-align: justify;">
                          - Năm 1973 sáng lập chùa Huyền Không ở Lăng Cô, Thừa Thiên Huế để hành thiền Vipassanā.
                          </p>
                          <p style="text-align: justify;">
                          - Năm 1976, làm Tổng thư ký Giáo hội Tăng Già Nguyên Thuỷ Việt Nam và bắt đầu viết sách.
                          </p>
                          <p style="text-align: justify;">
                          - Năm 1986 trụ trì Kỳ Viên tự trụ sở trung ương giáo hội Tăng già Nguyên Thủy Việt Nam.
                          </p>
                          <p style="text-align: justify;">
                          - Năm 1988 trụ trì chùa Tổ Bửu Long xây dựng cơ sở và đào tạo Tăng Ni tại chùa Tổ- Năm 1995, Hoà thượng đã giảng " Thực tại hiện tiền"
                          </p>
                          </span>"""),
            ],
          ),
        ),
      ),
    );
  }
}
