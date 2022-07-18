import 'dart:convert';
import 'package:carrot_test/repository/local_storage_repository.dart';

class ContentsRepository extends LocalStorageRepository {
  final String MY_FAVORITE_KEY = "MY_FAVORITE_KEY";
  Map<String, dynamic> data = {
    "10km": [
      {
        "cid": "1",
        "id": "abcde",
        "image": "assets/images/ara-1.jpg",
        "title": "네메시스 축구화275",
        "location": "Fischer-hallman",
        "price": "300",
        "likes": "2"
      },
      {
        "cid": "2",
        "id": "abcde",
        "image": "assets/images/ara-2.jpg",
        "title": "LA갈비 5kg팔아요~",
        "location": "Doon South",
        "price": "100",
        "likes": "5"
      },
      {
        "cid": "3",
        "id": "abcde",
        "image": "assets/images/ara-3.jpg",
        "title": "치약팝니다",
        "location": "Forest Heights",
        "price": "5",
        "likes": "0"
      },
      {
        "cid": "4",
        "id": "abcdefg",
        "image": "assets/images/ara-4.jpg",
        "title": "[풀박스]맥북프로16인치 터치바 스페이스그레이",
        "location": "Activa Ave.",
        "price": "2500",
        "likes": "6"
      },
      {
        "cid": "5",
        "id": "aaabbbg",
        "image": "assets/images/ara-5.jpg",
        "title": "디월트존기임팩",
        "location": "Bleams Rd",
        "price": "100",
        "likes": "2"
      },
      {
        "cid": "6",
        "id": "aaabbbgaf",
        "image": "assets/images/ara-6.jpg",
        "title": "갤럭시s10",
        "location": "Homer Watson",
        "price": "180",
        "likes": "2"
      },
      {
        "cid": "7",
        "id": "aaabbbgasdfsa",
        "image": "assets/images/ara-7.jpg",
        "title": "선반",
        "location": "King Street E",
        "price": "10",
        "likes": "2"
      },
    ],
    "50km": [
      {
        "cid": "8",
        "id": "aaabbbgasdfsa",
        "image": "assets/images/ara-8.jpg",
        "title": "냉장 쇼케이스",
        "location": "로렐우드",
        "price": "800",
        "likes": "3"
      },
      {
        "cid": "9",
        "id": "aaabbbgasdfsaaa",
        "image": "assets/images/ara-9.jpg",
        "title": "대우 미니냉장고",
        "location": "conestoga mall 근처",
        "price": "300",
        "likes": "3"
      },
      {
        "cid": "10",
        "id": "aaabbbgas",
        "image": "assets/images/ara-10.jpg",
        "title": "멜킨스 풀업 턱걸이 판매합니다.",
        "location": "Saint Jacobs",
        "price": "50",
        "likes": "7"
      },
      {
        "cid": "11",
        "id": "hmhmhmaaa",
        "image": "assets/images/ora-1.jpg",
        "title": "LG 통돌이세탁기 15kg(내부",
        "location": "Laurelwood",
        "price": "150",
        "likes": "13"
      },
      {
        "cid": "12",
        "id": "hmhmaa",
        "image": "assets/images/ora-2.jpg",
        "title": "3단책장 전면책장 가져가실분",
        "location": "Vista Hills",
        "price": "무료나눔",
        "likes": "6"
      },
      {
        "cid": "13",
        "id": "hmhmaa",
        "image": "assets/images/ora-3.jpg",
        "title": "브리츠 컴퓨터용 스피커",
        "location": "Rim Park",
        "price": "Free",
        "likes": "4"
      },
      {
        "cid": "14",
        "id": "hmhmaabb",
        "image": "assets/images/ora-4.jpg",
        "title": "안락 의자",
        "location": "University Ave.",
        "price": "1000",
        "likes": "1"
      },
    ],
    "100km": [
      {
        "cid": "15",
        "id": "hmhmaabbcc",
        "image": "assets/images/ora-5.jpg",
        "title": "어린이책 무료드림",
        "location": "Costco",
        "price": "무료나눔",
        "likes": "1"
      },
      {
        "cid": "16",
        "id": "hmhmaabbaad",
        "image": "assets/images/ora-6.jpg",
        "title": "어린이책 무료드림",
        "location": "Hespeler",
        "price": "무료나눔",
        "likes": "0"
      },
      {
        "cid": "17",
        "id": "hmhmaabb",
        "image": "assets/images/ora-7.jpg",
        "title": "칼세트 재제품 팝니다",
        "location": "Shade's mills",
        "price": "200",
        "likes": "5"
      },
      {
        "cid": "18",
        "id": "hmhmaabb",
        "image": "assets/images/ora-8.jpg",
        "title": "아이팜장난감정리함팔아요",
        "location": "Preston",
        "price": "30",
        "likes": "29"
      },
      {
        "cid": "19",
        "id": "hmhmaabbafaf",
        "image": "assets/images/ora-9.jpg",
        "title": "한색책상책장수납장세트 팝니다.",
        "location": "캠브리지",
        "price": "150",
        "likes": "1"
      },
      {
        "cid": "20",
        "id": "hmhmaabbaa",
        "image": "assets/images/ora-10.jpg",
        "title": "순성 데일리 오가닉 카시트",
        "location": "제어스 근처",
        "price": "60",
        "likes": "8"
      },
    ],
  };

  Future<List<Map<String, String>>> loadContentsFromLocation(
      String location) async {
    // API 통신 location값을 보내주면서
    await Future.delayed(Duration(microseconds: 1000));
    return data[location];
  }

  Future<List?> loadFavoriteContents() async {
    String? jsonString = await this.getStoredValue(MY_FAVORITE_KEY);
    if (jsonString != null) {
      List<dynamic> json = jsonDecode(jsonString);
      return json;
    } else {
      return null;
    }
  }

  addMyFavoriteContent(Map<String, String> content) async {
    String? jsonString = await this.getStoredValue(MY_FAVORITE_KEY);
    List<dynamic>? favoriteContentsList = await loadFavoriteContents();
    if (favoriteContentsList == null || !(favoriteContentsList is List)) {
      favoriteContentsList = [content];
    } else {
      favoriteContentsList.add(content);
    }
    updateFavoriteContents(favoriteContentsList);
  }

  void updateFavoriteContents(List favoriteContentsList) async {
    await this.storeValue(MY_FAVORITE_KEY, jsonEncode(favoriteContentsList));
  }

  deleteMyFavoriteContent(String cid) async {
    List<dynamic>? favoriteContentsList = await loadFavoriteContents();
    if (favoriteContentsList != null && favoriteContentsList is List) {
      favoriteContentsList.removeWhere((data) => data["cid"] == cid);
    }
    updateFavoriteContents(favoriteContentsList!);
  }

  isMyFavorite(String cid) async {
    String? jsonString = await this.getStoredValue(MY_FAVORITE_KEY);
    bool isMyFavoriteContents = false;
    List? json = await loadFavoriteContents();

    if (json == null || !(json is List)) {
      return false;
    } else {
      for (dynamic data in json) {
        if (data["cid"] == cid) {
          isMyFavoriteContents = true;
          break;
        }
      }
    }

    return isMyFavoriteContents;
  }
}
