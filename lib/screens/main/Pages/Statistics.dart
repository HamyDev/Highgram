import 'package:flutter/material.dart';
import 'package:highgram/models/constants.dart';
import 'package:highgram/screens/main/pages/Withdraw.dart';
import 'package:highgram/services/database.service.dart';
import 'package:highgram/services/helper/helper.functions.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AffiliateStatistics extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<AffiliateStatistics> {
  // ignore: unused_field
  final DatabaseMethods _databaseMethods = DatabaseMethods();
  TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    getUserInfo();
    super.initState();
  }

  dynamic graphData = <GraphData>[
    GraphData('Mon', 1),
    GraphData('Tue', 2.3),
    GraphData('Wen', 1.75),
    GraphData('Thu', 3),
    GraphData('Fri', 4.2),
    GraphData('Sat', 3.7),
    GraphData('Sun', 4.7),
  ];

  TextStyle headerTextStyle = TextStyle(
      color: Color(0xFFCCCCCC),
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: "TTCommon");

  TextStyle valueTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 21,
      fontWeight: FontWeight.w600,
      fontFamily: "TTCommon");

  final value = new NumberFormat("#,##0", "en_US");

  Future getUserInfo() async {
    Constants.email = await HelperFunctions.getUserEmailSharedPreference();
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: const FractionalOffset(0.5, 0.14),
              colors: [Color(0xFF1222ac), Color(0xFF090e45)],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    //! NavBar
                    Container(
                      margin: EdgeInsets.only(
                          left: 24.5,
                          right: MediaQuery.of(context).size.width / 2 - 115.5,
                          top: 30),
                      child: GestureDetector(
                          child: Icon(
                            Icons.arrow_back_ios_new_sharp,
                            color: Colors.white,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          }),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 34,
                        ),
                        child: Text(
                          "Affiliate Statistics",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              fontFamily: "TTCommon"),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    //!Users registered
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      alignment: AlignmentDirectional.topCenter,
                      clipBehavior: Clip.none,
                      child: Container(
                        padding: EdgeInsets.only(left: 28, right: 28, top: 18),
                        height: 86,
                        width: 328,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(width: 2, color: Color(0xFF181d53)),
                          color: Color(0xFF12185F),
                        ),
                        child: Column(
                          children: [
                            Text("New user registered with your code",
                                textAlign: TextAlign.center,
                                style: headerTextStyle),
                            FutureBuilder(
                              future: _databaseMethods.GetNewRegistered(
                                  Constants.myName),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return Container(
                                    margin: EdgeInsets.only(top: 9),
                                    child: Text(
                                        "${value.format(snapshot.data)}",
                                        textAlign: TextAlign.center,
                                        style: valueTextStyle),
                                  );
                                } else {
                                  return loadingWidget();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    //!Users used your code
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      alignment: AlignmentDirectional.topCenter,
                      clipBehavior: Clip.none,
                      child: Container(
                        padding: EdgeInsets.only(left: 28, right: 28, top: 18),
                        height: 86,
                        width: 328,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(width: 2, color: Color(0xFF181d53)),
                          color: Color(0xFF12185F),
                        ),
                        child: Column(
                          children: [
                            Text("Users used your code",
                                textAlign: TextAlign.center,
                                style: headerTextStyle),
                            FutureBuilder(
                              future: _databaseMethods.GetUsedCode(
                                  Constants.myName),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return Container(
                                    margin: EdgeInsets.only(top: 9),
                                    child: Text(
                                        "${value.format(snapshot.data)}",
                                        textAlign: TextAlign.center,
                                        style: valueTextStyle),
                                  );
                                } else {
                                  return loadingWidget();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    //!Avergae Ads shown
                    Container(
                      margin: EdgeInsets.only(top: 25),
                      alignment: AlignmentDirectional.topCenter,
                      clipBehavior: Clip.none,
                      child: Container(
                        padding: EdgeInsets.only(left: 28, right: 28, top: 18),
                        height: 86,
                        width: 328,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(width: 2, color: Color(0xFF181d53)),
                          color: Color(0xFF12185F),
                        ),
                        child: Column(
                          children: [
                            Text("Average ads shown to them",
                                textAlign: TextAlign.center,
                                style: headerTextStyle),
                            Container(
                              margin: EdgeInsets.only(top: 9),
                              child: FutureBuilder(
                                future: _databaseMethods.GetAverageAds(
                                    Constants.myName),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    return Text(
                                        "${value.format(snapshot.data)}",
                                        textAlign: TextAlign.center,
                                        style: valueTextStyle);
                                  } else {
                                    return loadingWidget();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: 25),
                      width: 328,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Color(0xFF181d53)),
                        color: Color(0xFF12185F),
                      ),
                      child: FutureBuilder(
                          future:
                              _databaseMethods.GetAnalytics(Constants.myName),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return SfCartesianChart(
                                tooltipBehavior: _tooltipBehavior,
                                title: ChartTitle(
                                    text: "Analytics",
                                    textStyle: TextStyle(
                                        color: Color(0xFFCCCCCC),
                                        fontSize: 11)),
                                plotAreaBorderColor: Colors.transparent,
                                plotAreaBackgroundColor: Colors.transparent,
                                // Initialize category axis
                                primaryXAxis: CategoryAxis(
                                  majorGridLines: MajorGridLines(
                                    width: 0,
                                  ),
                                ),
                                //primaryYAxis: CategoryAxis(),
                                series: <ChartSeries<GraphData, String>>[
                                  SplineSeries<GraphData, String>(
                                      name: "Ads Watched Analytics",
                                      color: Color(0xff8c52ff),
                                      // Bind data source
                                      dataSource: <GraphData>[
                                        GraphData('Mon',
                                            snapshot.data["mon"].toDouble()),
                                        GraphData('Tue',
                                            snapshot.data["tue"].toDouble()),
                                        GraphData('Wen',
                                            snapshot.data["wen"].toDouble()),
                                        GraphData('Thu',
                                            snapshot.data["thu"].toDouble()),
                                        GraphData('Fri',
                                            snapshot.data["fri"].toDouble()),
                                        GraphData('Sat',
                                            snapshot.data["sat"].toDouble()),
                                        GraphData('Sun',
                                            snapshot.data["sun"].toDouble()),
                                      ],
                                      xValueMapper: (GraphData amount, _) =>
                                          amount.day,
                                      yValueMapper: (GraphData amount, _) =>
                                          amount.amount,
                                      enableTooltip: true)
                                ],
                              );
                            } else {
                              return loadingWidget();
                            }
                          }),
                    ),

                    Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 37, bottom: 75),
                          width: 328,
                          height: 86,
                          padding: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 2,
                                color: Color(0xFF12185f).withOpacity(0.5)),
                            image: DecorationImage(
                              image: AssetImage("assets/images/Money.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Text("Your Balance",
                                      textAlign: TextAlign.center,
                                      style: headerTextStyle),
                                  FutureBuilder(
                                    future: _databaseMethods.GetBalance(
                                        Constants.myName),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        return Container(
                                          margin: EdgeInsets.only(top: 4),
                                          child: Text(
                                            "\$${value.format(snapshot.data)}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 21,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: "TTCommon"),
                                          ),
                                        );
                                      } else {
                                        return loadingWidget();
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //!Withdraw button
                        Positioned(
                          top: 100,
                          child: GestureDetector(
                            child: Container(
                              width: 116,
                              height: 50,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color(0xFF5FD0FF),
                                    Color(0xFF2880FF),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(69),
                              ),
                              child: Center(
                                child: Text(
                                  "Withdraw",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AffiliateWithdraw(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loadingWidget() {
    return Container(
      margin: EdgeInsets.only(top: 4),
      child: Text("Loading...",
          textAlign: TextAlign.center, style: valueTextStyle),
    );
  }
}

class GraphData {
  GraphData(this.day, this.amount);
  final String day;
  final double amount;
}
