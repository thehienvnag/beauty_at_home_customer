import 'package:flutter/material.dart';
import 'package:flutter_app/src/view/blank_search.dart';
import 'package:flutter_app/src/widgets/shared_widget/outlined_card.dart';

class ListSearchScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ListSearchScreenState();
}

class ListSearchScreenState extends State<ListSearchScreen> {
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String keySearch = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildBar(context),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Row(
            children: [
              Text('  Bộ lọc', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              Container(
                height: 40,
                child: Card(
                  color: Colors.grey[350],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        color: Colors.grey.withOpacity(1),
                        width: 0.2,
                      )),
                  child: Row(
                    children: [
                      Text('  $keySearch', style: TextStyle(fontSize: 18),),
                      IconButton(
                        iconSize: 18,
                        onPressed: () {
                          _controller.clear();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BlankScreen(),
                          ));
                        },
                        icon: Icon(Icons.clear),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text('   #Tìm thấy 15 dịch vụ',style: TextStyle(fontSize: 15), ),
          OutlinedCard(
            margin: EdgeInsets.only(top: 10),
            sections: [
              myDetailsContainer1(),
              ItemsList(itemList: listItem)
            ],
          ),
          OutlinedCard(
            margin: EdgeInsets.only(top: 10),
            sections: [
              myDetailsContainer2(),
              ItemsList(itemList: listItem)
            ],
          ),
          OutlinedCard(
            margin: EdgeInsets.only(top: 10),
            sections: [
              myDetailsContainer3(),
              ItemsList(itemList: listItem)
            ],
          ),
        ],
      ),
    );
  }

  Widget myDetailsContainer1() {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15, top: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                   Text(
                      'Hani Nguyễn  ',
                      style: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  Row(
                      children: [
                        Icon(Icons.star, color: Color(0xffFFCC00),),
                        Text('5')
                      ],
                    ),
                ],
              ),
              Text('Massage - Bấm huyệt',
                style: TextStyle(
                    letterSpacing: 1,
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                    color: Colors.black),
              ),
              Row(
                children: [
                  Text('4 km',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.grey),
                  ),
                  Text(' | Quận 3, TP. Hồ Chí Minh',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15,top: 10,),
          width: size.width * 0.2,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('public/img/beautician1.png'),
            ),
          ),
        ),
      ],
    );
  }
  Widget myDetailsContainer2() {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15, top: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    'Tony Đặng ',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Color(0xffFFCC00),),
                      Text('5')
                    ],
                  ),
                ],
              ),
              Text('Massage - Giác hơi',
                style: TextStyle(
                    letterSpacing: 1,
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                    color: Colors.black),
              ),
              Row(
                children: [
                  Text('4 km',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.grey),
                  ),
                  Text(' | Quận 3, TP. Hồ Chí Minh',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15,top: 10,),
          width: size.width * 0.2,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('public/img/beautician2.png'),
            ),
          ),
        ),
      ],
    );
  }
  Widget myDetailsContainer3() {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15, top: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    'Marry Trần  ',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Color(0xffFFCC00),),
                      Text('5')
                    ],
                  ),
                ],
              ),
              Text('Massage',
                style: TextStyle(
                    letterSpacing: 1,
                    fontWeight: FontWeight.normal,
                    fontSize: 13,
                    color: Colors.black),
              ),
              Row(
                children: [
                  Text('5 km',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.grey),
                  ),
                  Text(' | Quận 2, TP. Hồ Chí Minh',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15,top: 10,),
          width: size.width * 0.2,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('public/img/beautician3.png'),
            ),
          ),
        ),
      ],
    );
  }


  List<CartItem> listItem = List.from(
    <CartItem>[
      CartItem(
        content: '90 phút massage body toàn thân',
        price: '200.000',
        image: "public/img/beautician1.png",
      ),
      CartItem(
        content: '60 phút massage body toàn thân',
        price: '150.000',
        image: "public/img/beautician2.png",
      ),
      CartItem(
        content: '30 phút massage body toàn thân',
        price: '100.000',
        image: "public/img/beautician3.png",
      ),
    ],
  );
}

class CartItem {
  final String content, image ,price;
  CartItem({
    this.content,
    this.price,
    this.image,
  });
}

class ItemsList extends StatelessWidget {
  final List<CartItem> itemList;

  const ItemsList({
    Key key,
    this.itemList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: itemList.length,
          itemBuilder: (context, index) => Column(
            children: [
              ItemDescriptionRow(
                content: itemList[index].content,
                price: itemList[index].price,
                image: itemList[index].image,
              ),
              if (index + 1 < itemList.length)
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
class ItemDescriptionRow extends StatelessWidget {
  final String content, image ,price;
  const ItemDescriptionRow({
    Key key,
    this.content,
    this.price,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 35),
            ),
            Container(
              width: 250,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '${this.content}',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                          width: 28,height: 22,
                          child: Icon(Icons.attach_money_sharp,color: Colors.black,size: 20,)
                      ),
                      Text(' ${this.price}', style: TextStyle(color: Colors.black,),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: 50,
              height: 50,
              child: Image(image: AssetImage('${this.image}',),fit: BoxFit.cover,),
            ),
          ],
        ), SizedBox(height: 5,),
        Container(width: size.width, height: 1, color: Colors.black.withOpacity(0.2)),
      ],
    );
  }
}

Widget _buildBar(BuildContext context) {
  final String keySearch = ModalRoute.of(context).settings.arguments;
  Size size = MediaQuery.of(context).size;
  var _controller = TextEditingController();
  return new AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leadingWidth: 0,
    title:
    Container(
      margin: EdgeInsets.only(top: 12),
      height: 45,
      width: size.width,
      color: Color(0xffF2F2F2),
      child: TextField(
        textInputAction: TextInputAction.search,
        controller: _controller..text = '$keySearch',
        cursorColor: Colors.red,
        cursorHeight: 20,
        style: TextStyle(
          height: 1,
        ),
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => ListSearchScreen(),
                    settings: RouteSettings(arguments: value)));
          }
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 6.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.2), width: 0.5)),
            hintText: 'Tìm kiếm dịch vụ...',
            prefixIcon: Icon(
              Icons.search,
              size: 25.0,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlankScreen(),
                ));
                _controller.clear();
              },
              icon: Icon(Icons.clear),
            )),
      ),
    ),
  );
}
