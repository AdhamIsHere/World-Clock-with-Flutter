import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:real_deal/services/WorldTime.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpTime() async {
    WorldTime instance =
        WorldTime(location: 'Cairo', flag: 'egypt', url: 'Africa/Cairo');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',
        arguments: {'timeInstance': instance});
  }

  @override
  void initState() {
    super.initState();
    setUpTime();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[850],
            child: const Center(
                child: SpinKitDoubleBounce(
              color: Colors.white,
              size: 50.0,
            ))));
  }
}
