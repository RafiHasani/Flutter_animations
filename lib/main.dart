import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int? selectedItemIndex;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset("images/img3.jpg", fit: BoxFit.fill),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.all(40),
                    child: ClipRect(
                      clipBehavior: Clip.antiAlias,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ListView.builder(
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(16),
                                itemCount: 8,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedItemIndex = index;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.easeInOut,
                                      decoration: BoxDecoration(
                                        color: selectedItemIndex == index
                                            ? Colors.white38
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: AnimatedPadding(
                                            duration: const Duration(
                                                milliseconds: 200),
                                            padding: selectedItemIndex == index
                                                ? const EdgeInsets.all(4)
                                                : EdgeInsets.zero,
                                            child: AnimatedDefaultTextStyle(
                                                duration: const Duration(
                                                    milliseconds: 200),
                                                style: TextStyle(
                                                    color: selectedItemIndex ==
                                                            index
                                                        ? Colors.yellow
                                                        : Colors.white,
                                                    fontSize:
                                                        selectedItemIndex ==
                                                                index
                                                            ? 14
                                                            : 10,
                                                    fontWeight:
                                                        selectedItemIndex ==
                                                                index
                                                            ? FontWeight.bold
                                                            : FontWeight
                                                                .normal),
                                                child: Text(
                                                    "list Item ${index + 1}"))),
                                      ),
                                    ),
                                  );
                                })),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
