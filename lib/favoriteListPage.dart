
import 'package:flutter/material.dart';
import 'package:portpolio_favorite_flutter/homeScreen.dart';
import 'item.dart';

class favoriteListPage extends StatefulWidget {
  const favoriteListPage({super.key});

  @override
  State<favoriteListPage> createState() => _favoriteListPageState();
}

class _favoriteListPageState extends State<favoriteListPage> {

  List<Item> favoriteList = ITEM_LIST.where((element) => element.favorite==1).toList();


  @override
  Widget build(BuildContext context) {
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
            onPressed: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );

              /* Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const HomeScreen();
                },
              ));*/
            },


            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size:30,
            ),
          )
        ],
      ),
      body: ListView.builder(
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
                        favoriteList[index].imageUrl,
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
                                favoriteList[index].name, //그림들 위에있는 이름
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
                                  favoriteList[index].favorite == 0
                                      ? Padding( //?앞이 조건이고 ? 다음이 조건문 첫번째 표현
                                    padding: const EdgeInsets.all(0.9),
                                          child: IconButton(
                                            icon: Icon(Icons.star_border),
                                            color: Colors.amber[300],
                                            onPressed: () {
                                              setState(() {
                                                favoriteList[index].favorite++;
                                              });
                                            },
                                    ),
                                  )
                                      : Row(  // : 이표시 다음이 두번째 표현 0이면 빈하트 1이면 하트
                                    children: <Widget>[
                                      IconButton(
                                          onPressed: (){setState(() {
                                            favoriteList[index].favorite--;
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
        itemCount: favoriteList.length,
      ),


    );
  }
}
