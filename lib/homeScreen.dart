
import 'package:flutter/material.dart';

import 'favoriteListPage.dart';
import 'item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    TextEditingController controller = TextEditingController();

    List<Item> searchList = ITEM_LIST  //이거 어려움!!! 찾는거 없을땐 리스트전부가 들어가야함
        .where((element) =>
            element.name.toLowerCase().contains(text.toLowerCase()))
        .toList();



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "MY FAVORITE STARS",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 20,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: (){  //여기{}안에 비어있었는데 즐겨찾기 목록으로 전송기능 만들것 !!!

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>favoriteListPage()));

              /*Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const favoriteListPage();
                },
            ));*/
              },
            icon: const Icon(
              Icons.star,
              color: Colors.amber,
              size:30,
            ),
          )
        ],

        bottom: PreferredSize(
          preferredSize: const Size(3, 130),  //바텀에 프리퍼사이즈 수치변경해볼것!!!
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(7.0), //7.0수치하고 45수치 비교해보기!!!
                child: Container( //검색창 흰색 박스 안에 폼필드
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white
                    ),
                  child: TextFormField(
                    controller: controller, //사실 TextFormField에서는 걍 controller만 설정해도 UI적으로는 충분
                    onFieldSubmitted: (covariant) { //이거 어려움!!! covariant 대신 스트링 넣어도되나 확인하기!!!
                      setState((){  //즉 onFieldSubmitted는 넘겨주는 역할을 하는데 text에 입력값인 covariant를 넣어줌
                        text = covariant; //여기 covariant는윗쪽의 covariant에 의존함 텍스트는 입력값인듯
                      });
                    },
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                        ),
                        hintText:  "Search",
                        hintStyle: TextStyle(fontSize:  15)),
                    )),
                  ),

                Container(  //필터링부분
                  height: 50,
                  color: Colors.white.withOpacity(0.7), //어디색깔이지???
                  child:  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly, //공간균등배분
                      children: [
                        SizedBox(width: 10),
                        _allItems(""),
                        SizedBox(width: 10),
                        _singleItem("Icon"),
                        SizedBox(width: 10),
                        _singleItem("Button"),
                        SizedBox(width: 10),
                        _singleItem("Page"),
                        SizedBox(width: 10),
                        _singleItem("Text"),
                        SizedBox(width: 10),
                        _singleItem("UI"),
                        SizedBox(width: 10),
                        _singleItem("Drawer"),
                        SizedBox(width: 10),
                        _singleItem("Background"),
                        SizedBox(width: 10),
                        _singleItem("Animation"),
                        ],
                    ),
                  ),
                ),

                Container(
                  height: 30,
                  width: double.infinity,
                  color: Colors.white.withOpacity(0.9),
                  child: Padding(
                      padding: EdgeInsets.only(left: 15,top: 3),
                      child: Text(
                          "Search for: $text",   //search for 적힌부분
                          style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
            )
            ],
          ),
        ),
      ),

      body: ListView.builder(  /*실제 화면에서 보여주는 부분 그러니까 searchList로 표현됨 즉
      searchList[index].xxx로 표시되는 부분들로 인해서 사용자가 검색한 부분만 나옴*/
          itemBuilder: (context, index){
            return Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 16),
                  height: 100,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 75,
                        width: 75,
                        child: Image.network( //영상에서는 플러터이미지로 떠있는 부분
                          searchList[index].imageUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(  //플러터이미지 오른쪽에 나올부분의 패딩부분
                          padding: const EdgeInsets.only(
                            top: 24,
                            left: 40,
                          ) ,
                          child: Column(  //이름과 그 밑에 아이콘들
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                              searchList[index].name, //그림들 위에있는 이름
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                            Row(  //굳이 row를 두번쓸 필요는 없는듯
                              children: [
                                Row(
                                  children: <Widget>[
                                    IconButton(
                                        onPressed: (){},//여기다 인스타 연결 적어놔야할듯
                                        icon: Icon(
                                            Icons.home,
                                            color: Colors.blue,
                                        ),
                                    ),
                                  ],
                                ),
                              searchList[index].favorite == 0
                                ? Padding( //?앞이 조건이고 ? 다음이 조건문 첫번째 표현
                                  padding: const EdgeInsets.all(0.9),
                                  child: IconButton(
                                    icon: Icon(Icons.star_border),
                                    color: Colors.amber[300],
                                    onPressed: () {
                                      setState(() {
                                        searchList[index].favorite++;
                                      });
                                    },
                                  ),
                              )
                              : Row(  // : 이표시 다음이 두번째 표현 0이면 빈하트 1이면 하트
                                  children: <Widget>[
                                    IconButton(
                                        onPressed: (){setState(() {
                                          searchList[index].favorite--;
                                            });
                                          },
                                        icon: Icon(
                                          Icons.star,
                                          color: Colors.amber[300],)
                                    )
                                  ],
                                )
                           ],
                          ),
                         ])),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 3,
                )
              ],
            );
      },
      itemCount: searchList.length,
      ));
    }


//14분
Widget _allItems(String searchText) {  //좌우로 넘겨지는 스크롤뷰 구성하는 필터버튼
  return ElevatedButton(
    style: ElevatedButton.styleFrom(elevation: 2, backgroundColor: Colors.teal),
    child: const Text(
      "all",
      style: TextStyle(color: Colors.white),
    ),
    onPressed: () {
      setState((){    // 이거 누르면 화면전환! 이러는게 아니라 searchText를 넘겨주고 리스트뷰에서 실시간으로 받아와서 화면구성
        text = searchText; //searchText 대신 "" 이거해도 됨 왜냐면 213번 줄에 searchText가 84번줄에서 ""로 표시됨
      });
    },
  );
}

Widget _singleItem(String searchText) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(elevation: 2, backgroundColor: Colors.teal),
    child: Text(
      searchText,
      style: const TextStyle(color: Colors.white),
    ),
    onPressed: () {
      setState(() {
        text = searchText;
      });
    },

  );
}}