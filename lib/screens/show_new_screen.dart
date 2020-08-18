import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/common/commons.dart';
import 'package:news_app/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class ShowNewScreen extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String content;
  final String authorName;
  final String publishTime;
  final String url;

  const ShowNewScreen({
    @required this.imageUrl,
    @required this.title,
    @required this.content,
    @required this.authorName,
    @required this.publishTime,
    @required this.url,
  });

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    String timeConvert =
        DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(publishTime));

    return Scaffold(
      backgroundColor: ThemeColors.scaffoldBackground,
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
           /* SliverAppBar(
              backgroundColor: ThemeColors.scaffoldBackground,
              elevation: 0.0,
              iconTheme: IconThemeData(color: Colors.black87),
              floating: true,
            ),*/
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              pinned: false,
              floating: true,
              expandedHeight: MediaQuery.of(context).size.height*0.3,
              stretch: true,
              iconTheme: IconThemeData(color: ThemeColors.scaffoldBackground),

              flexibleSpace: FlexibleSpaceBar(
                stretchModes: [
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle,
                ],
                background: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            /*SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                ),
              ),
            ),*/
            SliverToBoxAdapter(
              child: Container(
                color: ThemeColors.scaffoldBackground,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TitleNew(
                      title: title,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    ContentNew(
                      content: content+"\n\nLorem Ipsum is simply dummy text of the printing and"
                          " typesetting industry. Lorem Ipsum has been the industry's standard"
                          " dummy text ever since the 1500s, when an unknown printer took a galley"
                          " of type and scrambled it to make a type specimen book. It has survived "
                          "not only five centuries, but also the leap into electronic typesetting, "
                          "remaining essentially unchanged. It was popularised in the 1960s with "
                          "the release of Letraset sheets containing Lorem Ipsum passages, and more"
                          " recently with desktop publishing software like Aldus PageMaker including "
                          "versions of Lorem Ipsum.\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CardAuthor(
                      authorName: authorName,
                      publishTime: timeConvert,
                      textBtn: "website",
                      onPressed: () => _launchURL(url),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
