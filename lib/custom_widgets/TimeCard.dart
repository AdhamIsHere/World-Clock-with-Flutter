import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../services/WorldTime.dart';

class TimeCard extends StatefulWidget {
  const TimeCard({
    super.key,
    required this.time,
  });

  final WorldTime time;

  @override
  State<TimeCard> createState() => _TimeCardState(time: time);
}

class _TimeCardState extends State<TimeCard> {
  late WorldTime time;
  late Timer timer;

  _TimeCardState({required this.time});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        time.time = time.time.add(const Duration(seconds: 1));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[800],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey[900],
              ),
              width: 205,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://cdn.countryflags.com/thumbs/${time.flag}/flag-square-250.png"),
                    radius: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(widget.time.location,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
            Text(
              DateFormat("hh:mm:ss a").format(widget.time.time),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ));
  }
}
