import 'package:flutter/material.dart';
import 'package:highgram/models/constants.dart';
import 'package:highgram/screens/main/pages/Withdraw.dart';
import 'package:highgram/services/auth.service.dart';
import 'package:highgram/services/helper/helper.functions.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';

class AffiliateStatistics extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<AffiliateStatistics> {
  // ignore: unused_field
  final AuthService _auth = AuthService();
  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  int NewRegistered = 746;
  int UsedCode = 5432;
  int AverageAds = 4531;
  int Balance = 456;

  List<FlSpot> graphData = [
    FlSpot(0, 1),
    FlSpot(1, 2.2),
    FlSpot(2, 2.75),
    FlSpot(3, 2.2),
    FlSpot(4, 3.5),
    FlSpot(5, 2.75),
    FlSpot(6, 4.5),
  ];

  List<Color> gradientColors = [
    const Color(0xff8c52ff),
    const Color(0xff8c52ff),
  ];

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
                            Text(
                              "New user registered with your code",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "TTCommon"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 9),
                              child: Text(
                                "${value.format(NewRegistered)}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "TTCommon"),
                              ),
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
                            Text(
                              "Users used your code",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "TTCommon"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 9),
                              child: Text(
                                "${value.format(UsedCode)}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "TTCommon"),
                              ),
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
                            Text(
                              "Average ads shown to them",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "TTCommon"),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 9),
                              child: Text(
                                "${value.format(AverageAds)}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "TTCommon"),
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
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15, top: 12),
                            child: Text(
                              "Analytics",
                              style: TextStyle(
                                  color: Color(0xFFCCCCCC),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "TTCommon"),
                            ),
                          ),
                          AspectRatio(
                            aspectRatio: 1.7,
                            child: Container(
                              margin:
                                  EdgeInsets.only(right: 20, left: 10, top: 22),
                              /*
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(18),
                                    ),
                                    color: Color(0xff232d37)), */
                              child: LineChart(
                                mainData(),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                                  Text(
                                    "Your Balance",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFFCCCCCC),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: "TTCommon"),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 4),
                                    child: Text(
                                      "\$${value.format(Balance)}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 21,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "TTCommon"),
                                    ),
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

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            strokeWidth: 0,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 18,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 13),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'Mon';
              case 1:
                return 'Tue';
              case 2:
                return 'Wen';
              case 3:
                return 'Thu';
              case 4:
                return 'Fri';
              case 5:
                return 'Sat';
              case 6:
                return 'Sun';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return '<1k';
              case 1:
                return '1k';
              case 2:
                return '2k';
              case 3:
                return '3k';
              case 4:
                return '4k';
              case 5:
                return '5k';
            }
            return '';
          },
          reservedSize: 25,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(show: true, border: Border.all(width: 0)),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: graphData,
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.17)).toList(),
          ),
        ),
      ],
    );
  }
}
