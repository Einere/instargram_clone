import "package:flutter/material.dart";

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: renderBody(),
    );
  }

  final String profilePicUrl =
      'https://i2.wp.com/gyogamman.com/wp-content/uploads/2020/04/dog-3753706_1280_Pixabay%EB%A1%9C%EB%B6%80%ED%84%B0-%EC%9E%85%EC%88%98%EB%90%9C-monicore%EB%8B%98%EC%9D%98-%EC%9D%B4%EB%AF%B8%EC%A7%80-%EC%9E%85%EB%8B%88%EB%8B%A4..jpg?w=1280&ssl=1';

  Widget renderAppBar() {
    return AppBar(
      actions: [
        IconButton(icon: Icon(Icons.exit_to_app), onPressed: onPressed)
      ],
    );
  }

  void onPressed() {}

  Widget renderBody() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: Stack(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 1,
                      heightFactor: 1,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(profilePicUrl),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                              width: 28,
                              height: 28,
                              child: FloatingActionButton(
                                  onPressed: () {},
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.add ))),
                          SizedBox(
                              width: 25,
                              height: 25,
                              child: FloatingActionButton(
                                  onPressed: () {},
                                  backgroundColor: Colors.blue,
                                  child: Icon(Icons.add)))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  '이름',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ],
          ),
          AlignedCenterText('0\n게시물'),
          AlignedCenterText('1\n팔로워'),
          AlignedCenterText('1\n팔로잉')
        ],
      ),
    );
  }

  Widget AlignedCenterText(text) {
    return Text(text,
        textAlign: TextAlign.center, style: TextStyle(fontSize: 16));
  }
}
