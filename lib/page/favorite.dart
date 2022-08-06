import 'package:carrot_test/page/detail.dart';
import 'package:carrot_test/repository/contents_repository.dart';
import 'package:carrot_test/utils/data_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyFavoriteContents extends StatefulWidget {
  const MyFavoriteContents({Key? key}) : super(key: key);

  @override
  _MyFavoriteContentsState createState() => _MyFavoriteContentsState();
}

class _MyFavoriteContentsState extends State<MyFavoriteContents> {
  ContentsRepository contentsRepository = ContentsRepository();

  @override
  void initState() {
    super.initState();
    // contentsRepository = ContentsRepository();
  }

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      title: Text(
        "관심목록",
        style: TextStyle(fontSize: 15.0),
      ),
    );
  }

  _makeDataList(List<dynamic> data) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      itemBuilder: (BuildContext _context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return DetailContentView(
                data: data[index],
              );
            }));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: Hero(
                    tag: data[index]["cid"].toString(),
                    child: Image.asset(
                      data[index]["image"].toString(),
                      width: 100.0,
                      height: 100.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  // padding: const EdgeInsets.only(left: 20.0),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[index]["title"].toString(),
                          style: TextStyle(fontSize: 15.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          data[index]["location"].toString(),
                          style: TextStyle(
                              fontSize: 13.0,
                              color: Colors.black.withOpacity(0.7)),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                            DataUtils.calcStringToCAD(
                                data[index]["price"].toString()),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SvgPicture.asset(
                              "assets/svg/heart_on.svg",
                              width: 13.0,
                              height: 13.0,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(data[index]["likes"].toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext _context, int index) {
        return Container(height: 1.0, color: Colors.black.withOpacity(0.4));
      },
      itemCount: data.length,
    );
  }

  Widget _bodyWidget() {
    return FutureBuilder(
        future: _loadMyFavoriteContentsList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("데이터오류"),
            );
          }
          if (snapshot.hasData) {
            // return _makeDataList(snapshot.data as List<Map<String, String>>);
            // return _makeDataList(snapshot.data ?? []);
            return _makeDataList(snapshot.data as List<dynamic>);
          }

          return Center(
            child: Text("No data in this place"),
          );
        });
  }

  Future<List<dynamic>?> _loadMyFavoriteContentsList() async {
    return await contentsRepository.loadFavoriteContents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbarWidget(),
      body: _bodyWidget(),
    );
  }
}
