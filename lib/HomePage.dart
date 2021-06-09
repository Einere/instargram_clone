import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram clone',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(),
    );
  }

  final ButtonStyle _buttonStyle =
      ElevatedButton.styleFrom(primary: Colors.blueAccent);
  final String profilePicUrl =
      'https://i2.wp.com/gyogamman.com/wp-content/uploads/2020/04/dog-3753706_1280_Pixabay%EB%A1%9C%EB%B6%80%ED%84%B0-%EC%9E%85%EC%88%98%EB%90%9C-monicore%EB%8B%98%EC%9D%98-%EC%9D%B4%EB%AF%B8%EC%A7%80-%EC%9E%85%EB%8B%88%EB%8B%A4..jpg?w=1280&ssl=1';
  final String email = 'example@gmail.com';
  final String name = 'some name';
  final List<String> thumbnailUrlList = [
    'https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F27118F4259357D530B',
    'https://post-phinf.pstatic.net/MjAxNzA5MThfMjI5/MDAxNTA1NzE3NDM4MDA0.3EsIQDdcf_dzKDGA_a_juRE5eyO34bQOk7bExZFo12kg.MIsKRJNOyJtlGhgebqYeT8eUa4CM9F6CP6lPQh4YzDcg.JPEG/21149049_2386188334939837_7495688851826933760_n.jpg?type=w1200',
    'https://t1.daumcdn.net/cfile/blog/21227A42531BEF2422',
  ];

  Widget _getThumbnail(url) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Image.network(
        url,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Center(
              child: Column(
            children: <Widget>[
              Text(
                'Instagram에 오신 것을 환영합니다',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Padding(padding: EdgeInsets.all(8)),
              Text(
                '사진과 동영상을 보려면 팔로우하세요',
              ),
              // Padding(padding: EdgeInsets.all(8)),
              const SizedBox(height: 8),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(profilePicUrl),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            children: <Widget>[
                              Text(
                                email,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(name),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: thumbnailUrlList
                              .map((url) => _getThumbnail(url))
                              .toList(),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 4,
                          ),
                          child: Text('페이스북 친구'),
                        ),
                        ElevatedButton(
                          onPressed: () => {},
                          style: _buttonStyle,
                          child: Text('팔로우'),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
        )));
  }
}
