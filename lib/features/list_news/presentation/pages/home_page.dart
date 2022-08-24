import 'package:airplane/features/list_news/presentation/cubit/list_news_cubit.dart';
import 'package:airplane/features/list_news/presentation/widgets/list_news.dart';
import 'package:airplane/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ListNewsCubit>().getListNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 255,
              color: Colors.red,
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.notifications_outlined,
                        size: 24,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.notifications_outlined,
                        size: 24,
                        color: Colors.white,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xff7C7C7C)
                                        .withOpacity(0.05),
                                    spreadRadius: 5,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                              ),
                              width: 92,
                              height: 84,
                              child: SvgPicture.asset(
                                '${assetIcon}icon_send_package.svg',
                                width: 52,
                                height: 52,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: const Center(
                              child: Text(
                                'Send Package',
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const ListNews(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
