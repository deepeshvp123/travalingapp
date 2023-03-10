import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travalingapp/cubit/app_cubit_state.dart';
import 'package:travalingapp/cubit/app_cubits.dart';
import 'package:travalingapp/misc/colors.dart';
import 'package:travalingapp/widgets/app_large_text.dart';
import 'package:travalingapp/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling",
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
        body: BlocBuilder<AppCubits, cubitstate>(builder: (context, state) {
      if (state is LoadedState) {
        var info = state.places;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 70, left: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.black,
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.5)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: AppLargeText(text: "Discover"),
            ),
            SizedBox(
              height: 30,
            ),
            // tap bar

            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                    controller: _tabController,
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: CircleTabIndicator(
                        radius: 4, color: AppColors.mainColor),
                    tabs: [
                      Tab(
                        text: "Places",
                      ),
                      Tab(
                        text: "Inspiration",
                      ),
                      Tab(
                        text: "Emotions",
                      ),
                    ]),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 15),
                height: 300,
                width: double.maxFinite,
                child: TabBarView(controller: _tabController, children: [
                  ListView.builder(
                    itemCount: info.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                                BlocProvider.of<AppCubits>(context)
                                    .DetailPage(info[index]);
                              },
                        child: Container(
                            width: 200,
                            height: 300,
                            margin: const EdgeInsets.only(
                                left: 10, right: 15, top: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                //color: Colors.white,
                                image: DecorationImage(
                                    image:
                                        NetworkImage("http://mark.bslmeiyu.com/uploads/" +
                                              info[index].img),
                                    fit: BoxFit.cover))),
                      );
                    },
                  ),
                  Text("thewre"),
                  Text("hgdgh")
                ])),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(
                    text: "Explore More",
                    size: 22,
                  ),
                  AppText(
                    text: "See All",
                    color: AppColors.textColor1,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Container(
                height: 120,
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 20),
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 30),
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/images/" +
                                        images.keys.elementAt(index)),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: AppText(
                                text: images.values.elementAt(index),
                                color: AppColors.textColor2,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        );
      } else {
        return Container();
      }
    }));
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.radius, required this.color});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.radius, required this.color});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset offsetCircle = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + offsetCircle, radius, _paint);
  }
}
