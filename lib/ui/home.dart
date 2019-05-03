import 'package:flutter/material.dart';
import 'package:flutterigapi/bloc/profileBloc.dart';
import 'package:flutterigapi/models/mediaModel.dart';
import 'package:flutterigapi/models/profileModel.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    bloc.fetchAllProfile();
    bloc.fetchAllMedia();
    super.initState();
  }

  @override
  void dispose() {
    //matikan dispose kalau menggunakan bottom navigation bar
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram App'),
      ),
      body: Column(
        children: <Widget>[
          StreamBuilder(
            stream: bloc.allProfil,
            builder: (context, AsyncSnapshot<Profile> snapshot) {
              if (snapshot.hasData) {
                return profileDetail(snapshot);
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              //return Text(snapshot.error.toString());
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: StreamBuilder(
              stream: bloc.allMedia,
              builder: (context, AsyncSnapshot<Media> snapshot) {
                if (snapshot.hasData) {
                  return mediaDetail(snapshot);
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                //return Text(snapshot.error.toString());
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget mediaDetail(AsyncSnapshot<Media> snapshot) {
    return GridView.builder(
      padding: EdgeInsets.all(3),
      itemCount: snapshot.data.data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 3, crossAxisSpacing: 3),
      itemBuilder: (BuildContext context, int index) {
        return Image.network(
          snapshot.data.data[index].images.thumbnail.url,
        );
      },
    );
  }

  Widget profileDetail(AsyncSnapshot<Profile> snapshot) {
    return Padding(
      padding: EdgeInsets.only(left: 25, top: 10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 40,
                backgroundImage:
                    NetworkImage(snapshot.data.data.profilePicture),
                backgroundColor: Colors.transparent,
              ),
              Expanded(
                child: Container(
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  snapshot.data.data.counts.media.toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Postingan',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  snapshot.data.data.counts.followedBy
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Pengikut',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  snapshot.data.data.counts.follows.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Mengikuti',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              child: Text('Promosi'),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RaisedButton(
                              child: Text('Edit Profil'),
                              color: Colors.white,
                              onPressed: () {},
                            )
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    snapshot.data.data.fullName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(snapshot.data.data.bio),
                  InkWell(
                    child: Text(
                      snapshot.data.data.website,
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    onTap: () async {
                      if (await canLaunch(snapshot.data.data.website)) {
                        await launch(snapshot.data.data.website);
                      }
                    },
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
