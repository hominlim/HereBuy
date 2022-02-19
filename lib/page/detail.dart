import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DetailContentView extends StatefulWidget {
  Map<String, String> data;
  DetailContentView({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailContentView> createState() => _DetailContentViewState();
}

class _DetailContentViewState extends State<DetailContentView> {
  Size? size;
  List<Map<String, String>>? imgList;
  int _current = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
    imgList = [
      {"id": "0", "url": widget.data["image"].toString()},
      {"id": "1", "url": widget.data["image"].toString()},
      {"id": "2", "url": widget.data["image"].toString()},
      {"id": "3", "url": widget.data["image"].toString()},
      {"id": "4", "url": widget.data["image"].toString()},
    ];
    _current = 0;
  }

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ]);
  }

  Widget _bodyWidget() {
    return Container(
      child: Stack(children: [
        Hero(
          tag: widget.data["cid"].toString(),
          child: CarouselSlider(
            items: imgList?.map(
              (map) {
                return Image.asset(
                  map["url"].toString(),
                  width: size?.width,
                  fit: BoxFit.fill,
                );
              },
            ).toList(),
            // carouselController: _controller,
            options: CarouselOptions(
                height: size?.width,
                initialPage: 0,
                enableInfiniteScroll: true,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                  print(index);
                }),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList!.map((map) {
              return Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == int.parse(map["id"].toString())
                        ? Colors.white
                        : Colors.white.withOpacity(0.4)),
              );
            }).toList(),
          ),
        ),
      ]),
    );
  }

  Widget _bottomBarWidget() {
    return Container(
      width: size?.width,
      height: 55.0,
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomBarWidget(),
    );
  }
}
