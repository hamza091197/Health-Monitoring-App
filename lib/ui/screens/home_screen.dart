import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthapp/ui/widgets/header_widget.dart';

import '../widgets/battery_widget.dart';
import '../widgets/connect_button.dart';
import '../widgets/customize_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              HeaderWidget(),
              SizedBox(height: 20.h),
              SmoothWordText(
                text: 'Tracking your Heart',
                textStyle: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
                duration: Duration(seconds: 3),
              ),
              SizedBox(height: 20.h),
              BatteryWidget(),
              SizedBox(height: 20.h),
              CustomizeWidget(),
              SizedBox(height: 20.h),
              Center(child: ConnectButton()),
            ],
          ),
        ),
      ),
    );
  }
}

class SmoothWordText extends StatefulWidget {
  final String text;
  final TextStyle textStyle;
  final Duration duration;

  const SmoothWordText({
    required this.text,
    required this.textStyle,
    required this.duration,
  });

  @override
  _SmoothWordTextState createState() => _SmoothWordTextState();
}

class _SmoothWordTextState extends State<SmoothWordText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  )..forward();

  late final List<Animation<double>> _fadeAnimations = List.generate(
    widget.text.split(" ").length,
        (index) => Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(index / widget.text.split(" ").length, (index + 1) / widget.text.split(" ").length, curve: Curves.easeIn),
      ),
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: widget.text.split(" ").asMap().entries.map((entry) {
        final index = entry.key;
        final word = entry.value;
        return AnimatedBuilder(
          animation: _fadeAnimations[index],
          builder: (context, child) => Opacity(
            opacity: _fadeAnimations[index].value,
            child: Text("$word ", style: widget.textStyle),
          ),
        );
      }).toList(),
    );
  }
}