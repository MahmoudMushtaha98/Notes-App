
import 'package:flutter/material.dart';

import '../screen/home.dart';

class BuildNotesWidget extends StatelessWidget {
  const BuildNotesWidget({
    super.key,
    required this.title, required this.subTitle, required this.date, required this.time,
  });

  final String title;
  final String subTitle;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(mediaQuery(context, 1) * 0.02),
      width: mediaQuery(context, 1) * 0.9,
      height: mediaQuery(context, 0) * 0.1,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.7),
              spreadRadius: 0.5,
              blurRadius: 5,
              offset: const Offset(0, 5),
            )
          ]),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: mediaQuery(context, 0)*0.05,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: mediaQuery(context, 0) * 0.025,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    date,
                    style:
                    TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: mediaQuery(context, 0)*0.05,
                    child: Text(subTitle,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                            overflow: TextOverflow.ellipsis)),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      time,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6))),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
