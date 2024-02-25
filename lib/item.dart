class Item {
  final String name;
  final String id;
  int favorite;
  final String imageUrl;

  Item({
    required this.name,
    required this.imageUrl,
    required this.favorite,
    required this.id,
    });


  // 아래부터 파이어베이스 사용할 부분
  Item.fromJson(Map<String, Object?>json)
      : this(
    name: json['name']as String,
    favorite: json['favorite']as int,
    imageUrl: json['imageUrl']as String,
    id: json['id']as String,
  );
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['favorite'] = favorite;
    data['imageUrl'] = imageUrl;
    data['id'] = id;
    return data;
  }
  //여기까지 파이어베이스부분

}

String text = "";

List<Item>ITEM_LIST = [
  Item(
    name: "Favorite Icon",
    favorite: 0,
    imageUrl: "https://wallpapers.com/images/high/clash-royale-king-on-the-throne-nempygeoevv2tf9t.webp",
    id: "Icon",
  ),
  Item(
    name: "Elevation Button Icon",
    favorite: 0,
    imageUrl: "https://wallpapers.com/images/high/clash-royale-characters-25k7atrk9zl1zsvn.webp",
    id: "Button",
  ),
  Item(
    name: "Animation Transition Page",
    favorite: 0,
    imageUrl: "https://wallpapers.com/images/high/clash-royale-dart-goblin-tpzjqgalt1olh9fh.webp",
    id: "Page",
  ),
  Item(
    name: "Fade Text Animation",
    favorite: 0,
    imageUrl: "https://wallpapers.com/images/high/clash-royale-happy-king-avatar-y275jgu4av1cq5kw.webp",
    id: "Text",
  ),
  Item(
    name: "Login Page UI",
    favorite: 0,
    imageUrl: "https://wallpapers.com/images/high/clash-royale-the-king-tye8zcnpzejbwru4.webp",
    id: "Page",
  ),
  Item(
    name: "Custom Drawer",
    favorite: 0,
    imageUrl: "https://wallpapers.com/images/high/clash-royale-the-king-tye8zcnpzejbwru4.webp",
    id: "Drawer",
  ),
  Item(
    name: "Splash Screen Background",
    favorite: 0,
    imageUrl: "https://wallpapers.com/images/high/clash-royale-the-king-tye8zcnpzejbwru4.webp",
    id: "Background",
  ),
  Item(
    name: "Loop Animation",
    favorite: 0,
    imageUrl: "https://wallpapers.com/images/high/clash-royale-the-king-tye8zcnpzejbwru4.webp",
    id: "Animation",
  ),
  Item(
    name: "ListView Animation",
    favorite: 0,
    imageUrl: "https://wallpapers.com/images/high/clash-royale-the-king-tye8zcnpzejbwru4.webp",
    id: "Animation",
  ),
];


