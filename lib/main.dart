import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'library/youtubeContext.dart';
import 'library/controller.dart';

void main() => runApp(GetMaterialApp(home: Home()));

class Home extends StatelessWidget {
  final Controller c = Get.put(Controller());

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YouTube',
        ),
        leading: Container(
          margin: EdgeInsets.fromLTRB(15, 10, 0, 10),
          child: Image.asset('images/youtube_social_icon_red.png'),
        ),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                c.addContext('a', 'b',
                    'https://dummyimage.com/600x400/000/fff&text=a', 3, 3);
              },
              icon: Icon(Icons.videocam_outlined)),
          IconButton(
              onPressed: () {
                c.context.clear();
              },
              icon: Icon(Icons.notifications_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 30,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2016/04/02/19/40/moon-1303512_1280.png'),
                ),
              ),
            ),
          )
        ],
        backgroundColor: Colors.black87,
        elevation: 20,
      ),
      body: YoutubeBody(),
    );
  }
}

class YoutubeBody extends StatelessWidget {
  final Controller c = Get.put(Controller());

  @override
  Widget build(context) {
    return Obx(
      () => Container(
        color: Colors.black87,
        child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
          itemCount: c.context.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {},
              child: Column(
                children: <Widget>[
                  Image.network(c.context[index].img,
                      width: MediaQuery.of(context).size.width),
                  Row(
                    children: <Widget>[
                      Container(
                        child: Image.network(
                            'https://cdn.pixabay.com/photo/2016/04/02/19/40/moon-1303512_1280.png',
                            width: MediaQuery.of(context).size.width / 10),
                        padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 3, 10, 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              c.context[index].title,
                              style:
                                  TextStyle(fontSize: 35, color: Colors.white),
                            ),
                            Row(
                              children: <Widget>[
                                Text(c.context[index].content,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white60)),
                                Container(
                                  padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                                  child: Text('·',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white60)),
                                ),
                                Text(
                                    '조회수${c.context[index].viewcount.toString()}회',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white60)),
                                Container(
                                  padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
                                  child: Text('·',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white60)),
                                ),
                                Text('${c.context[index].time.toString()}일전',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white60)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class YoutubeRow extends StatelessWidget {
  @override
  Widget build(context) {
    return Row(
      children: [],
    );
  }
}
