import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clonecode/screen/detail_screen.dart';

import '../model/model_movie.dart';

class CarouseImage extends StatefulWidget {
  final List<Movie> movies;
  CarouseImage({required this.movies});
  _CarouseImageState createState() => _CarouseImageState();
}

class _CarouseImageState extends State<CarouseImage> {
  late List<Movie> movies;
  late List<Widget> images;
  late List<String> keyword;
  late List<bool> likes;

  int _currentPage = 0;
  late String _currentKeyword;

  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies.map((m) => Image.asset('./assets/images/' + m.poster)).toList();
    keyword = movies.map((m) => m.keyword).toList();
    likes = movies.map((m) => m.like).toList();
    _currentKeyword = keyword[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(20)
          ),
          CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                  _currentKeyword = keyword[_currentPage];
                });
              },
              // 여기에 다른 옵션들을 추가
            ),
            items: images,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(
              _currentKeyword,
              style: TextStyle(fontSize: 11),
            )
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      likes[_currentPage]
                          ? IconButton(onPressed: (){}, icon: Icon(Icons.check))
                          : IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                      Text('내가 찜한 콘텐츠', style : TextStyle(fontSize: 11))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                        ),
                        SizedBox(width: 3),
                        Text(
                          '재생',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute<Null>(fullscreenDialog: true, builder: (BuildContext context) 
                          { return DetailScreen(movie: movies[_currentPage]);  },));
                        },
                      ),
                      Text(
                        '정보',
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: makeIndicator(likes, _currentPage),
              )
          ),
        ],
      ),
    );
  }
}

List<Widget> makeIndicator(List list, int _currentPage) {
  List<Widget> results = [];
  for (var i = 0; i < list.length; i++) {
    results.add(Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == i
            ? Color.fromRGBO(255, 255, 255, 0.9)
            : Color.fromRGBO(255, 255, 255, 0.4),
      ),
    ));
  }

  return results;
}