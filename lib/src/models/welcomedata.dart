import '../../generated/l10n.dart';


class Items {
  String  description ;
  String image;
  //IconData icon;

  Items({ this.description, this.image, });
}

class ItemsListBuilder {
  List<Items> itemList = new List();

  Items item1 = new Items(
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry",
      image: 'assets/img/mylogo2.png',
      );
  Items item2 = new Items(

      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industryY",
      image: 'assets/img/mylogo.png',
      );
  Items item3 = new Items(

      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry",
      image:'assets/img/mylogo2.png' ,
      );

  ItemsListBuilder() {
    itemList.add(item1);
    itemList.add(item2);
    itemList.add(item3);
  }
}
