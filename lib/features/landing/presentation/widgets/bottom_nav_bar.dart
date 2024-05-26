import 'package:chat_task/core/theme/app_colors.dart';
import 'package:chat_task/core/utils/bites_icons.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 3;

  void setBottomBarIndex(index) => setState(() => currentIndex = index);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width,
      height: 120,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CustomPaint(
            size: Size(
              size.width,
              (size.width * 0.31794871794871793).toDouble(),
            ),
            painter: _BottomNavPainter(),
            child: ClipPath(
              clipper: _BottomNavClipper(),
              child: Material(
                color: AppColors.white,
                child: SizedBox(
                  width: size.width,
                  height: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(
                          BitesIcons.user,
                          color: currentIndex == 0
                              ? AppColors.purple
                              : AppColors.grey,
                        ),
                        onPressed: () {
                          setBottomBarIndex(0);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          BitesIcons.notification,
                          color: currentIndex == 1
                              ? AppColors.purple
                              : AppColors.grey,
                        ),
                        onPressed: () {
                          setBottomBarIndex(1);
                        },
                      ),
                      Container(
                        width: size.width * 0.20,
                      ),
                      IconButton(
                        icon: Icon(
                          BitesIcons.clock,
                          color: currentIndex == 2
                              ? AppColors.purple
                              : AppColors.grey,
                        ),
                        onPressed: () {
                          setBottomBarIndex(2);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          BitesIcons.calendar,
                          color: currentIndex == 3
                              ? AppColors.purple
                              : AppColors.grey,
                        ),
                        onPressed: () {
                          setBottomBarIndex(3);
                        },
                        splashColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Center(
            heightFactor: 1,
            child: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: AppColors.purple,
              elevation: 4,
              onPressed: () {},
              child: const Icon(
                BitesIcons.addPlus,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.008592179, size.height * 0.3462065);
    path.lineTo(0, size.height * 0.3462065);
    path.lineTo(0, size.height * 1.160589);
    path.lineTo(size.width, size.height * 1.160589);
    path.lineTo(size.width, size.height * 0.3461597);
    path.lineTo(size.width * 0.7117333, size.height * 0.2227290);
    path.cubicTo(
        size.width * 0.7117333,
        size.height * 0.2227290,
        size.width * 0.6403564,
        size.height * 0.1950798,
        size.width * 0.6194667,
        size.height * 0.3420048);
    path.cubicTo(
        size.width * 0.6094590,
        size.height * 0.4123847,
        size.width * 0.6039462,
        size.height * 0.4567339,
        size.width * 0.6006077,
        size.height * 0.4866290);
    path.cubicTo(
        size.width * 0.5976231,
        size.height * 0.5133210,
        size.width * 0.5903308,
        size.height * 0.6447516,
        size.width * 0.5410538,
        size.height * 0.6608411);
    path.cubicTo(
        size.width * 0.4917769,
        size.height * 0.6769306,
        size.width * 0.4644744,
        size.height * 0.6608411,
        size.width * 0.4644744,
        size.height * 0.6608411);
    path.cubicTo(
        size.width * 0.4644744,
        size.height * 0.6608411,
        size.width * 0.4208769,
        size.height * 0.6485694,
        size.width * 0.4062359,
        size.height * 0.5072944);
    path.cubicTo(
        size.width * 0.3915974,
        size.height * 0.3660194,
        size.width * 0.3754641,
        size.height * 0.2166411,
        size.width * 0.3214538,
        size.height * 0.2214218);
    path.cubicTo(
        size.width * 0.2674436,
        size.height * 0.2262000,
        size.width * 0.008592179,
        size.height * 0.3462065,
        size.width * 0.008592179,
        size.height * 0.3462065);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class _BottomNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.008592179, size.height * 0.3462065);
    path.lineTo(0, size.height * 0.3462065);
    path.lineTo(0, size.height * 1.160589);
    path.lineTo(size.width, size.height * 1.160589);
    path.lineTo(size.width, size.height * 0.3461597);
    path.lineTo(size.width * 0.7117333, size.height * 0.2227290);
    path.cubicTo(
        size.width * 0.7117333,
        size.height * 0.2227290,
        size.width * 0.6403564,
        size.height * 0.1950798,
        size.width * 0.6194667,
        size.height * 0.3420048);
    path.cubicTo(
        size.width * 0.6094590,
        size.height * 0.4123847,
        size.width * 0.6039462,
        size.height * 0.4567339,
        size.width * 0.6006077,
        size.height * 0.4866290);
    path.cubicTo(
        size.width * 0.5976231,
        size.height * 0.5133210,
        size.width * 0.5903308,
        size.height * 0.6447516,
        size.width * 0.5410538,
        size.height * 0.6608411);
    path.cubicTo(
        size.width * 0.4917769,
        size.height * 0.6769306,
        size.width * 0.4644744,
        size.height * 0.6608411,
        size.width * 0.4644744,
        size.height * 0.6608411);
    path.cubicTo(
        size.width * 0.4644744,
        size.height * 0.6608411,
        size.width * 0.4208769,
        size.height * 0.6485694,
        size.width * 0.4062359,
        size.height * 0.5072944);
    path.cubicTo(
        size.width * 0.3915974,
        size.height * 0.3660194,
        size.width * 0.3754641,
        size.height * 0.2166411,
        size.width * 0.3214538,
        size.height * 0.2214218);
    path.cubicTo(
        size.width * 0.2674436,
        size.height * 0.2262000,
        size.width * 0.008592179,
        size.height * 0.3462065,
        size.width * 0.008592179,
        size.height * 0.3462065);

    path.close();

    Paint paintFill = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black.withAlpha(50)
      ..maskFilter =
          MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(10));
    canvas.drawPath(path, paintFill);
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
