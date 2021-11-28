import 'package:app_chua/model/image.dart';
import 'package:app_chua/ui/widgets/image_item.dart';
import 'package:app_chua/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageInEvent extends StatefulWidget {
  final List<String> images;
  final selectImage;
  ImageInEvent({required this.images, required this.selectImage});
  @override
  _State createState() => _State();
}

class _State extends State<ImageInEvent> {
  var index;
  @override
  void initState() {
    index =
        widget.images.indexWhere((element) => element == widget.selectImage);
    index = index == -1 ? 0 : index;
    super.initState();
  }

  onSelectImage(index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height;
    final appWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      body: CupertinoPageScaffold(
        backgroundColor: AppColors.white.withOpacity(0.5),
        navigationBar: CupertinoNavigationBar(
          backgroundColor: AppColors.white,
          leading: CupertinoNavigationBarBackButton(
            color: AppColors.orange,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          middle: Text(
            'SỰ KIỆN',
            style: TextStyle(
                color: AppColors.orange,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          trailing: Icon(Icons.wrap_text),
        ),
        child: Container(
          height: appHeight - 90,
          child: Stack(
            children: [
              Positioned(
                top: appHeight * 0.2,
                child: Container(
                  height: 250,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          width: appWidth,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(width: 5, color: AppColors.white),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: (index == -1 ||
                                          index >= widget.images.length)
                                      ? NetworkImage(
                                          'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled-1150x647.png')
                                      : NetworkImage(widget.images[index]))),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        width: appWidth,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        color: AppColors.white.withOpacity(0.8),
                        child: Center(
                          child: Text(
                            'Mô tả hình ảnh sự kiện',
                            style: TextStyle(color: AppColors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: 180,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: appWidth,
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Ảnh trong bài',
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '2/12',
                                      style: TextStyle(color: AppColors.white),
                                    )),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 100,
                          width: appWidth,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.images.length,
                              itemBuilder: (context, index) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      this.index = index;
                                    });
                                  },
                                  child: ImageItem(
                                    onSelectImage: () {
                                      onSelectImage(index);
                                    },
                                    isSelected: this.index == index,
                                    url: widget.images[index],
                                  ))),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
