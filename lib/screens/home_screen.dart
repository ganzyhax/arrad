import 'package:ar_rad/playlistVideo.dart';
import 'package:flutter/material.dart';
import 'package:ar_rad/models/channel_model.dart';
import 'package:ar_rad/models/video_model.dart';
import 'package:ar_rad/screens/video_screen.dart';
import 'package:ar_rad/services/api_service.dart';

class YoutubeAll extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<YoutubeAll> {
  Channel _channel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UCVoBRGSVtkbxFKUXtlIeGfA');
    setState(() {
      _channel = channel;
    });
  }

  _buildProfileInfo() {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35.0,
            backgroundImage: NetworkImage(_channel.profilePictureUrl),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _channel.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${_channel.subscriberCount} subscribers',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoScreen(
            id: video.id,
            title: video.title,
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: EdgeInsets.all(10.0),
        height: 170.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Image(
              width: 150.0,
              image: NetworkImage(video.thumbnailUrl),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Text(
                video.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: _channel.uploadPlaylistId);
    List<Video> allVideos = _channel.videos..addAll(moreVideos);
    setState(() {
      _channel.videos = allVideos;
    });
    _isLoading = false;
  }

  _loadPlayList() async {
    _isLoading = true;
    List<Video> moreVideos = await APIService.instance.fetchVideosFromPlaylist2(
        playlistId: 'PLEiHLa2nI_cE7VcOr8HjzBYKAnftWsGej');
    setState(() {
      _channel.videos = moreVideos;
    });
    _isLoading = false;
  }

  Widget playListView(imageUrl, title, url) {
    var tt = _channel;
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PlaylistList(
            urlss: url,
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: EdgeInsets.all(10.0),
        height: 110.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.values,
          children: <Widget>[
            Image(
              width: 150.0,
              image: NetworkImage(imageUrl),
            ),
            SizedBox(width: 10.0),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Плейлист',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> containers = [Container(), Container()];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Видео из Youtube'),
            bottom: TabBar(tabs: <Widget>[
              Tab(
                text: 'Видео',
              ),
              Tab(
                text: 'Плэйлисты',
              ),
            ]),
          ),
          body: TabBarView(
            children: [
              _channel != null
                  ? NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification scrollDetails) {
                        if (!_isLoading &&
                            _channel.videos.length !=
                                int.parse(_channel.videoCount) &&
                            scrollDetails.metrics.pixels ==
                                scrollDetails.metrics.maxScrollExtent) {
                          _loadMoreVideos();
                        }
                        return false;
                      },
                      child: ListView.builder(
                        itemCount: 1 + _channel.videos.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return _buildProfileInfo();
                          }
                          Video video = _channel.videos[index - 1];
                          return _buildVideo(video);
                        },
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor, // Red
                        ),
                      ),
                    ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    playListView(
                        'https://i.ytimg.com/vi/LF51VByIgsY/hqdefault.jpg?sqp=-oaymwEXCOADEI4CSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLD5JyMcdCzZvlnuSLY6vE__Eu-CGQ',
                        'Прочие рудуды',
                        'PLEiHLa2nI_cFS0OM7TcVgS3Ago9zTvfre'),
                    playListView(
                        'https://i.ytimg.com/vi/XDdxcqRFsWI/hqdefault.jpg?sqp=-oaymwEXCOADEI4CSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLBP5ZHMHLejgLpJKr2kExFf6mMnAg',
                        'Аниме',
                        'PLEiHLa2nI_cE7VcOr8HjzBYKAnftWsGej'),
                    playListView(
                        'https://i.ytimg.com/vi/-PV3uaro-dA/hqdefault.jpg?sqp=-oaymwEXCOADEI4CSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLDqS_Y8Oan3QsbEyre_RiQrFeYPAw',
                        'Книги, издания и тахкики',
                        'PLEiHLa2nI_cG_x0DVPLFQt1qfv6vSPQgz'),
                    playListView(
                        'https://i.ytimg.com/vi/u94nzvkjrE4/hqdefault.jpg?sqp=-oaymwEXCOADEI4CSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLD07H2gsI1Gq0aObIq1YJcDVJ9X2g',
                        'Биографии и сира',
                        'PLEiHLa2nI_cFqsLWTBCrZN7opE3zKNon4'),
                    playListView(
                        'https://i.ytimg.com/vi/XO3DBQWjFMQ/hqdefault.jpg?sqp=-oaymwEXCOADEI4CSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLAGyl8fZ1jsXWlxAxX1On1WR7p-RA',
                        'Разные вопросы фикха',
                        'PLEiHLa2nI_cGn8bkrAI2Jd9lMWCrIlhKv'),
                    playListView(
                        'https://i.ytimg.com/vi/RvoVkinbS9M/hqdefault.jpg?sqp=-oaymwEXCOADEI4CSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLCxC4ytNJ4ZwwGppIsfr4Wa3toitw',
                        "Фикх аль-'Ибадат'",
                        'PLEiHLa2nI_cGxfeXb2eIOoRYJxEVbLXBY'),
                    playListView(
                        'https://i.ytimg.com/vi/OoakZO2u5_o/hqdefault.jpg?sqp=-oaymwEXCOADEI4CSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLA55huBj_8-mjbNl4tzTIdd6l-4Ig',
                        "Хадисы и 'иляль",
                        'PLEiHLa2nI_cG2WN0jFhFl00E3GgmFH8Ai'),
                    playListView(
                        'https://i.ytimg.com/vi/lsWhROmjSKI/hqdefault.jpg?sqp=-oaymwEXCOADEI4CSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLBO_iW_N0lSY0hDnBriX53wQhO74Q',
                        "Христиане",
                        'PLEiHLa2nI_cFh1Q6lGh3-GUuvZrc5UMgm'),
                    playListView(
                        'https://i.ytimg.com/vi/oUPb_0NgPAE/hqdefault.jpg?sqp=-oaymwEXCOADEI4CSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLBrZ9DLdyLU3MUIe2koA_EKnzdJaQ',
                        "Хариджиты/такфириты",
                        'PLEiHLa2nI_cGIfReVBOtLPPhDdaqtUDbc'),
                    playListView(
                        'https://i.ytimg.com/vi/zyZ0FGeSdQ8/hqdefault.jpg?sqp=-oaymwEXCOADEI4CSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLBBH_-nH1-nCzqpPpY75iP2MauVpQ',
                        "Абдурахман Ас Сухейм",
                        'PLEiHLa2nI_cEJ4XUbA2t7SVxl3ZuR0-Kq'),
                    playListView(
                        'https://i.ytimg.com/vi/LPzYD9TZwRg/hqdefault.jpg?sqp=-oaymwEXCOADEI4CSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLCZRp_6GGO5m4-cSgASeKlmx08qSA',
                        "Джарх-мурджиа",
                        'PLEiHLa2nI_cFA6yyH3CdYDrUXypnFfWB7'),
                    playListView(
                        'https://i.ytimg.com/vi/fxJ4WkFaRyQ/hqdefault.jpg?sqp=-oaymwEXCOADEI4CSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLC-_8kVIYKlxoJRh5FKRlkKQolOBQ',
                        "Шииты",
                        'PLEiHLa2nI_cH2vD7RM71hTWYLKMdzImDZ'),
                    playListView(
                        'https://i.ytimg.com/vi/CTAd_wQBJPc/hqdefault.jpg?sqp=-oaymwEXCOADEI4CSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLBN6aoidg_1c7Snw3N1QrNnHTi6RQ',
                        "Джахмиты и ашариты",
                        'PLEiHLa2nI_cE1GbJy6UdI_gz5rxOcGR4v'),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
// _channel != null
//     ? NotificationListener<ScrollNotification>(
//         onNotification: (ScrollNotification scrollDetails) {
//           if (!_isLoading &&
//               _channel.videos.length !=
//                   int.parse(_channel.videoCount) &&
//               scrollDetails.metrics.pixels ==
//                   scrollDetails.metrics.maxScrollExtent) {
//             _loadPlayList();
//           }
//           return false;
//         },
//         child: ListView.builder(
//           itemCount: 1 + _channel.videos.length,
//           itemBuilder: (BuildContext context, int index) {
//             if (index == 0) {
//               return _buildProfileInfo();
//             }
//             Video video = _channel.videos[index - 1];
//             return _buildVideo(video);
//           },
//         ),
//       )
//     : Center(
//         child: CircularProgressIndicator(
//           valueColor: AlwaysStoppedAnimation<Color>(
//             Theme.of(context).primaryColor, // Red
//           ),
//         ),
//       ),
