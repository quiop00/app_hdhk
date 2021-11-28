import 'package:app_chua/enums/resource_type.dart';

const monks = {
  "monks": [
    {
      "id": 1,
      "name": "Viên Minh",
      "image": "assets/background/account_page.png",
      "filters": ["Khóa Thiền", "Pháp Thoại"]
    },
    {
      "id": 2,
      "name": "Giới Đức",
      "image": "assets/background/account_page.png",
      "filters": [
        "Phật Học",
        "Thiền Tập",
        "Trà Đàm Huyền Không Sơn Thượng",
        "Pháp Thoại",
        "Chia Sẻ Giáo Pháp"
      ]
    },
    {
      "id": 3,
      "name": "Pháp Tông",
      "image": "assets/background/account_page.png",
      "filters": [
        "Vấn Đáp Phật Pháp",
        "Soi Sáng Lời Dạy",
        "Lớp Phật Học (Cho tất cả mọi người)",
        "Kinh Tụng",
        "Pháp Thoại"
      ]
    },
    {
      "id": 4,
      "name": "Tuệ Tâm",
      "image": "assets/background/account_page.png",
      "filters": null
    }
  ]
};

const resource = {
  "resource": [
    {
      "id": 1,
      "type": ResourceType.AUDIO,
      "url":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      "author": "Viên Minh",
      "description": "Mô tả video",
      "bookmark": false,
      "place": "Chùa Bửu Long",
      "title": "Tựa đề audio"
    },
    {
      "id": 1,
      "type": ResourceType.AUDIO,
      "url":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      "author": "Viên Minh",
      "description": "Mô tả video",
      "bookmark": false,
      "place": "Chùa Bửu Long",
      "title": "Tựa đề audio"
    },
    {
      "id": 1,
      "type": ResourceType.AUDIO,
      "url":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      "author": "Viên Minh",
      "description": "Mô tả video",
      "bookmark": false,
      "place": "Chùa Bửu Long",
      "title": "Tựa đề audio"
    },
    {
      "id": 1,
      "type": ResourceType.AUDIO,
      "url":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      "author": "Viên Minh",
      "description": "Mô tả video",
      "bookmark": false,
      "place": "Chùa Bửu Long",
      "title": "Tựa đề audio"
    },
    {
      "id": 1,
      "type": ResourceType.VIDEO,
      "url":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      "author": "Viên Minh",
      "description": "Mô tả video",
      "bookmark": false,
      "place": "Chùa Bửu Long",
      "title": "Tựa đề audio"
    },
    {
      "id": 1,
      "type": ResourceType.VIDEO,
      "url":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      "author": "Viên Minh",
      "description": "Mô tả video",
      "bookmark": false,
      "place": "Chùa Bửu Long",
      "title": "Tựa đề audio"
    },
    {
      "id": 1,
      "type": ResourceType.VIDEO,
      "url":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      "author": "Viên Minh",
      "description": "Mô tả video",
      "bookmark": false,
      "place": "Chùa Bửu Long",
      "title": "Tựa đề audio"
    },
    {
      "id": 1,
      "type": ResourceType.VIDEO,
      "url":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      "author": "Viên Minh",
      "description": "Mô tả video",
      "bookmark": false,
      "place": "Chùa Bửu Long",
      "title": "Tựa đề video"
    },
    {
      "id": 1,
      "type": ResourceType.AUDIO,
      "url":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      "author": "Viên Minh",
      "description": "Mô tả audio",
      "bookmark": true,
      "place": "Chùa Bửu Long",
      "title": "Tựa đề audio"
    },
    {
      "id": 1,
      "type": ResourceType.AUDIO,
      "url":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      "author": "Viên Minh",
      "description": "Mô tả video",
      "bookmark": false,
      "place": "Chùa Bửu Long",
      "title": "Tựa đề audio"
    },
    {
      "id": 1,
      "type": ResourceType.VIDEO,
      "url":
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      "author": "Tuệ Tâm",
      "description": "Mô tả video",
      "bookmark": false,
      "place": "Chùa Bửu Long",
      "title": "Tựa đề audio"
    }
  ]
};
const playList = [
  {
    "id": "1",
    "name": "Tuyển tập số 1",
    "date": "10/11/2021",
    "bookmark": true,
    "items": [
      {
        "id": 1,
        "type": ResourceType.AUDIO,
        "url":
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "author": "Tuệ Tâm",
        "description": "Mô tả audio",
        "bookmark": false,
        "place": "Chùa Bửu Long",
        "title": "Tựa đề audio"
      },
      {
        "id": 2,
        "type": ResourceType.AUDIO,
        "url":
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "author": "Tuệ Tâm",
        "description": "Mô tả audio",
        "bookmark": false,
        "place": "Chùa Bửu Long",
        "title": "Tựa đề audio"
      }
    ]
  },
  {
    "id": "2",
    "name": "Tuyển tập số 2",
    "date": "10/11/2020",
    "bookmark": false,
    "items": [
      {
        "id": 1,
        "type": ResourceType.AUDIO,
        "url":
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "author": "Tuệ Tâm",
        "description": "Mô tả audio",
        "bookmark": false,
        "place": "Chùa Bửu Long",
        "title": "Tựa đề audio"
      },
      {
        "id": 2,
        "type": ResourceType.AUDIO,
        "url":
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "author": "Tuệ Tâm",
        "description": "Mô tả audio",
        "bookmark": false,
        "place": "Chùa Bửu Long",
        "title": "Tựa đề audio"
      }
    ]
  },
  {
    "id": "1",
    "name": "Tuyển tập số 1",
    "date": "10/11/2021",
    "bookmark": true,
    "items": [
      {
        "id": 1,
        "type": ResourceType.AUDIO,
        "url":
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "author": "Tuệ Tâm",
        "description": "Mô tả audio",
        "bookmark": false,
        "place": "Chùa Bửu Long",
        "title": "Tựa đề audio"
      },
      {
        "id": 2,
        "type": ResourceType.AUDIO,
        "url":
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "author": "Tuệ Tâm",
        "description": "Mô tả audio",
        "bookmark": false,
        "place": "Chùa Bửu Long",
        "title": "Tựa đề audio"
      }
    ]
  },
  {
    "id": "2",
    "name": "Tuyển tập số 2",
    "date": "10/11/2020",
    "bookmark": false,
    "items": [
      {
        "id": 1,
        "type": ResourceType.AUDIO,
        "url":
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "author": "Tuệ Tâm",
        "description": "Mô tả audio",
        "bookmark": false,
        "place": "Chùa Bửu Long",
        "title": "Tựa đề audio"
      },
      {
        "id": 2,
        "type": ResourceType.AUDIO,
        "url":
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "author": "Tuệ Tâm",
        "description": "Mô tả audio",
        "bookmark": false,
        "place": "Chùa Bửu Long",
        "title": "Tựa đề audio"
      }
    ]
  },
  {
    "id": "1",
    "name": "Tuyển tập số 1",
    "date": "10/11/2021",
    "bookmark": true,
    "items": [
      {
        "id": 1,
        "type": ResourceType.AUDIO,
        "url":
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "author": "Tuệ Tâm",
        "description": "Mô tả audio",
        "bookmark": false,
        "place": "Chùa Bửu Long",
        "title": "Tựa đề audio"
      },
      {
        "id": 2,
        "type": ResourceType.AUDIO,
        "url":
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "author": "Tuệ Tâm",
        "description": "Mô tả audio",
        "bookmark": false,
        "place": "Chùa Bửu Long",
        "title": "Tựa đề audio"
      }
    ]
  },
  {
    "id": "2",
    "name": "Tuyển tập số 2",
    "date": "10/11/2020",
    "bookmark": false,
    "items": [
      {
        "id": 1,
        "type": ResourceType.AUDIO,
        "url":
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "author": "Tuệ Tâm",
        "description": "Mô tả audio",
        "bookmark": false,
        "place": "Chùa Bửu Long",
        "title": "Tựa đề audio"
      },
      {
        "id": 2,
        "type": ResourceType.AUDIO,
        "url":
            "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "author": "Tuệ Tâm",
        "description": "Mô tả audio",
        "bookmark": false,
        "place": "Chùa Bửu Long",
        "title": "Tựa đề audio"
      }
    ]
  }
];
const sliderEvents = [
  {
    "id": "1",
    "title": "Chùa Huyền Không Sơn Thượng",
    "image":
        "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_1.jpg",
    "events": [
      {
        "id": "2",
        "parentEventId": "1",
        "title": "Tựa đề bài viết 2",
        "images": [
          {
            "alt": "chùa Huyền Không ở Huế",
            "url":
                "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_1.jpg"
          },
          {
            "alt": "chùa Huyền Không ở Huế",
            "url":
                "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_4_1.jpg"
          },
          {
            "alt": "chùa Huyền Không ở Huế",
            "url":
                "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_1.jpg"
          },
          {
            "alt": "chùa Huyền Không ở Huế",
            "url":
                "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_4_1.jpg"
          },
          {
            "alt": "chùa Huyền Không ở Huế",
            "url":
                "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_1.jpg"
          },
          {
            "alt": "chùa Huyền Không ở Huế",
            "url":
                "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_4_1.jpg"
          },
        ],
        "time": "20/10/2021",
        "place": "Chùa Bửu Long",
        "description":
            "Đây là nội dung của sự kiện. Đây là nội dung của sự kiện. Đây là nội dung của sự kiện.",
        "content":
            '''<h2 style="text-align: justify;"><span style="font-size:22px;"><strong>Huyền Không 1 – ngôi chùa mang phong cách Nhật Bản và Ấn Độ</strong></span></h2>

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
&nbsp;</p>''',
        "isSetNotify": true,
        "urlThumb":
            "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_5.jpg"
      },
      {
        "id": "3",
        "parentEventId": "1",
        "title": "Tựa đề bài viết 3",
        "time": "20/11/2021",
        "place": "Chùa Huyền Không",
        "images": [
          {
            "alt": "chùa Huyền Không ở Huế",
            "url":
                "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_1.jpg"
          },
          {
            "alt": "chùa Huyền Không ở Huế",
            "url":
                "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_4_1.jpg"
          },
          {
            "alt": "chùa Huyền Không ở Huế",
            "url":
                "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_1.jpg"
          },
          {
            "alt": "chùa Huyền Không ở Huế",
            "url":
                "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_4_1.jpg"
          },
          {
            "alt": "chùa Huyền Không ở Huế",
            "url":
                "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_1.jpg"
          },
          {
            "alt": "chùa Huyền Không ở Huế",
            "url":
                "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_4_1.jpg"
          },
        ],
        "description":
            "Đây là nội dung của sự kiện. Đây là nội dung của sự kiện. Đây là nội dung của sự kiện.",
        "content":
            '''<h2 style="text-align: justify;"><span style="font-size:22px;"><strong>Huyền Không 1 – ngôi chùa mang phong cách Nhật Bản và Ấn Độ</strong></span></h2>

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
&nbsp;</p>''',
        "isSetNotify": false,
        "urlThumb":
            "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_5.jpg"
      }
    ]
  },
  {
    "id": "2",
    "title": "Lễ Hội Huyền Không",
    "image":
        "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_4_1.jpg",
    "events": [
      {
        "id": "2",
        "parentEventId": "2",
        "title": "Tựa đề bài viết 2",
        "time": "20/10/2021",
        "place": "Chùa Huyền Không",
        "images": [
          {
            "alt": "chùa Huyền Không ở Huế",
            "url":
                "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_1.jpg"
          },
          {
            "alt": "chùa Huyền Không ở Huế",
            "url":
                "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_4_1.jpg"
          },
          {
            "alt": "chùa Huyền Không ở Huế",
            "url":
                "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_1.jpg"
          },
          {
            "alt": "chùa Huyền Không ở Huế",
            "url":
                "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_4_1.jpg"
          },
          {
            "alt": "chùa Huyền Không ở Huế",
            "url":
                "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_1.jpg"
          },
          {
            "alt": "chùa Huyền Không ở Huế",
            "url":
                "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_4_1.jpg"
          },
        ],
        "description":
            "Đây là nội dung của sự kiện. Đây là nội dung của sự kiện. Đây là nội dung của sự kiện.",
        "content":
            '''<h2 style="text-align: justify;"><span style="font-size:22px;"><strong>Huyền Không 1 – ngôi chùa mang phong cách Nhật Bản và Ấn Độ</strong></span></h2>

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
&nbsp;</p>''',
        "isSetNotify": false,
        "urlThumb":
            "https://dulichvietnam.com.vn/vnt_upload/news/03_2020/chua_huyen_khong_o_hue_5.jpg"
      },
    ]
  },
];
const contents = [
  {
    "id": 1,
    "content": 'Phục vụ để hoàn toàn\n\nHoàn toàn để phục vụ',
    "author": "Viên Minh"
  },
  {
    "id": 2,
    "content":
        '\tHọc đạo quý vô tâm\n\nLàm nghĩ không nói làm\n\n\tSáng trong và lặng lẽ\n\nGiản dị mới uyên thâm',
    "author": "Tuệ Tâm"
  },
  {
    "id": 3,
    "content":
        '\tHọc đạo quý vô tâm\n\nLàm nghĩ không nói làm\n\n\tSáng trong và lặng lẽ\n\nGiản dị mới uyên thâm',
    "author": "Pháp Tâm"
  },
  {
    "id": 4,
    "content": '\tHọc đạo quý vô tâm\n\nLàm nghĩ không nói làm',
    "author": "Viên Minh"
  }
];
const assetAudios = [
  "audios/audio1.mp3",
  "audios/audio2.mp3",
  "audios/audio3.mp3",
];
const books = {
  'books': [
    {
      'id': "1",
      'author': 'Viên Minh',
      'authorId': 1,
      'title': 'Tựa đề sách 01',
      'description': 'Đây là mô tả, đây là mô tả đây là mô tả, đây là mô tả',
      'content':
          '''<h2 style="text-align: justify;"><span style="font-size:22px;"><strong>Huyền Không 1 – ngôi chùa mang phong cách Nhật Bản và Ấn Độ</strong></span></h2>

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
&nbsp;</p>''',
    }
  ]
};
const poetries = [];
const scriptures = [];
