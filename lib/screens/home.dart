import 'dart:async';
import 'package:flutter/material.dart';
import 'package:world_clock/screens/new_clock_form.dart';
import '../custom_widgets/TimeCard.dart';
import '../services/WorldTime.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late WorldTime time;

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)?.settings.arguments as Map;
    time = data['timeInstance'];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.home, color: Colors.white, size: 30),
              Text(' Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ))
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.grey[850],
          child: Column(
            children: [
              const Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  child: Text(
                    'Welcome to the Home Page!',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  children: [
                    TimeCard(time: time),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              // showModalBottomSheet<void>(
              //   context: context,
              //   backgroundColor: Colors.grey[850],
              //   builder: (BuildContext context) {
              //     return const NewClockForm();
              //   },
              // );
              Navigator.pushNamed(context, '/new_clock_form');
            },
            backgroundColor: Colors.grey[900],
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text('Add Clock',
                style: TextStyle(color: Colors.white))));
  }
}
