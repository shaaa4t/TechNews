import 'package:flutter/material.dart';
import 'package:news_app/common/commons.dart';
import 'package:news_app/services/services.dart';
import 'package:news_app/widgets/widgets.dart';

class Covid19 extends StatefulWidget {
  @override
  _Covid19State createState() => _Covid19State();
}

class _Covid19State extends State<Covid19> {
  //List<String> covidList = List<String>();
  Map covidList;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCovid();
  }

  getCovid() async {
    Covid covidClass = Covid();
    await covidClass.fetchWorldWideData();
    covidList = covidClass.worldData;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Statistics of Covid 19 around the world",
                  style: TextStyle(
                    fontSize: 18,
                    color: ThemeColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: GridView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 2),
                      children: [
                        CardCovid(
                          title: 'Active',
                          count: '${covidList['active']}',
                          background: Colors.green[200],
                          colorText: Colors.green[800],
                        ),
                        CardCovid(
                          title: 'Recovered',
                          count: '${covidList['recovered']}',
                          background: Colors.blue[200],
                          colorText: Colors.blue[800],
                        ),
                        CardCovid(
                          title: 'Critical',
                          count: '${covidList['critical']}',
                          background: Colors.red[200],
                          colorText: Colors.red[800],
                        ),
                        CardCovid(
                          title: 'Deaths',
                          count: '${covidList['deaths']}',
                          background: Colors.grey[400],
                          colorText: Colors.grey[800],
                        ),
                        CardCovid(
                          title: 'Today Deaths',
                          count: '${covidList['todayDeaths']}',
                          background: Colors.brown[200],
                          colorText: Colors.brown[800],
                        ),
                        CardCovid(
                          title: 'Today Cases',
                          count: '${covidList['todayCases']}',
                          background: Colors.teal[200],
                          colorText: Colors.teal[800],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
