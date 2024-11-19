import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simple_beautiful_checklist_exercise/config/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: longDelayInMS), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: const Color.fromRGBO(228, 132, 255, 0.724),
                child: Text(
                  'Willkommen zur meine Checkliste!',
                  style: GoogleFonts.robotoMono(
                    textStyle:
                        Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontSize: 36,
                              fontWeight: FontWeight.w800,
                            ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Icon(
                Icons.check_circle_outline,
                size: 48,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
