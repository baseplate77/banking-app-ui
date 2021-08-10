import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onbank/constant.dart';
import 'package:onbank/main.dart';
import 'package:onbank/widget/expense_chart.dart';
import 'package:onbank/widget/income_chart.dart';
import 'package:onbank/widget/line_graph.dart';
import 'package:onbank/widget/line_graph_2.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _textAnimation;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _graphAnimation;

  final Curve curve = Curves.fastOutSlowIn;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1750),
    );

    _textAnimation =
        Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0,
          0.6,
          curve: curve,
        ),
      ),
    );

    _graphAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.5,
          1,
          curve: curve,
        ),
      ),
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.3,
          0.8,
          curve: curve,
        ),
      ),
    );

    _animationController.forward();
  }

  changeIndex(int value) {
    currentPage = value;
    setState(() {});
  }

  int currentPage = 0;

  List<Widget> charts = [
    ExpenseChart(),
    IncomeChart(),
  ];
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  int currentChart = 1;
  @override
  Widget build(BuildContext context) {
    final Size deviceData = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: mainColor),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/category_icon.svg",
                width: 28,
                height: 28,
                color: secondaryColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/wallet_icon.svg",
                width: 28,
                height: 28,
                color: Colors.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/pie_icon.svg",
                width: 28,
                height: 28,
                color: Colors.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/notification_icon.svg",
                width: 28,
                height: 28,
                color: Colors.grey,
              ),
              label: '',
            ),
          ],
        ),
      ),
      backgroundColor: mainColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Column(
            children: [
              SlideTransition(
                position: _textAnimation,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/profile.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Welcome", style: kText14.copyWith(fontSize: 16)),
                        Text(
                          "James!",
                          style: kText18.copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.add,
                      size: 32,
                      color: secondaryColor,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).primaryColor),
              ),
              Hero(
                tag: "circular_pattern",
                child: Material(
                  type: MaterialType.transparency,
                  child: Container(
                    width: deviceData.width * 0.9,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: mainColor,
                    ),
                    child: ClipRRect(
                      borderRadius: borderRadius,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Transform.scale(
                              scale: 2.3,
                              child: Image.asset(
                                "assets/images/circular_pattern_4x.jpg",
                              ),
                            ),
                          ),
                          FadeTransition(
                            opacity: _fadeAnimation,
                            child: PageView(
                              onPageChanged: (value) => changeIndex(value),
                              children: [
                                CardInfo(
                                  deviceData: deviceData,
                                  balance: "123,546",
                                  cardNum: '3425',
                                ),
                                CardInfo(
                                  deviceData: deviceData,
                                  balance: "1,824,000",
                                  cardNum: '1142',
                                ),
                                CardInfo(
                                  deviceData: deviceData,
                                  balance: "13,510",
                                  cardNum: '4414',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  horizontalLine(
                    width: currentPage == 0 ? 25 : 15,
                    color: currentPage == 0 ? secondaryColor : Colors.grey,
                    borderRadius: borderRadius,
                  ),
                  horizontalLine(
                      width: currentPage == 1 ? 25 : 15,
                      color: currentPage == 1 ? secondaryColor : Colors.grey,
                      borderRadius: borderRadius),
                  horizontalLine(
                      width: currentPage == 2 ? 25 : 15,
                      color: currentPage == 2 ? secondaryColor : Colors.grey,
                      borderRadius: borderRadius),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(
                    text: "Expense",
                    // color: Colors.transparent,
                    // textColor: secondaryColor,
                    onpressed: () {
                      if (currentChart != 0)
                        setState(() {
                          currentChart = 0;
                        });
                    },
                    isSelected: currentChart == 0,
                  ),
                  button(
                    text: "Income",
                    // color: secondaryColor,
                    // textColor: Colors.white,
                    isSelected: currentChart == 1,
                    onpressed: () {
                      if (currentChart != 1)
                        setState(() {
                          currentChart = 1;
                        });
                    },
                  ),
                ],
              ),
              FadeTransition(
                opacity: _graphAnimation,
                child: charts[currentChart],
              )
              // LineGraph()
            ],
          ),
        ),
      ),
    );
  }

  Widget horizontalLine(
      {required BorderRadius borderRadius,
      required Color color,
      required double width}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      width: width,
      height: 4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
    );
  }

  Widget button(
      {required String text,
      required bool isSelected,
      // required Color color,
      // required Color textColor,
      required Function() onpressed}) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        width: 150,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? secondaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Text(
          text,
          style: kText18.copyWith(
              color: isSelected ? Colors.white : secondaryColor,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class CardInfo extends StatelessWidget {
  const CardInfo({
    Key? key,
    required this.deviceData,
    required this.balance,
    required this.cardNum,
  }) : super(key: key);

  final Size deviceData;
  final String balance;
  final String cardNum;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceData.width * 0.9,
      height: 200,
      color: Colors.black.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 18),
        child: Align(
          alignment: Alignment.topLeft,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Balance",
                  style: kText14,
                ),
                // SizedBox(
                //   height: 6,
                // ),4
                Text("\$ $balance ",
                    style: kText18.copyWith(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                Text("••••  ••••  •••• $cardNum ",
                    style: kText18.copyWith(letterSpacing: 2)),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("VAILD THRU", style: kText14),
                        Text("55/99", style: kText14)
                      ],
                    ),
                    SizedBox(
                      width: 32,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("CVV", style: kText14),
                        Text("•••", style: kText14.copyWith(letterSpacing: 2))
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
