import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class aichatCard extends StatelessWidget {
  const aichatCard(
      {Key? key,
      required this.msg,
      required this.chatIndex,
      required this.shouldAnimate})
      : super(key: key);
  final String msg;
  final int chatIndex;
  final bool shouldAnimate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: chatIndex == 0
                    ? Colors.blueGrey.shade100
                    : Colors.greenAccent.shade100,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            chatIndex == 0
                                ? 'assets/default.png'
                                : 'assets/bot.png',
                          ),
                        )),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: chatIndex == 0
                          ? Text(
                              msg,
                              style: TextStyle(fontSize: 15),
                            )
                          : shouldAnimate
                              ? DefaultTextStyle(
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                  child: AnimatedTextKit(
                                      isRepeatingAnimation: false,
                                      repeatForever: false,
                                      displayFullTextOnTap: true,
                                      totalRepeatCount: 1,
                                      animatedTexts: [
                                        TyperAnimatedText(
                                          msg.trim(),
                                        ),
                                      ]),
                                )
                              : Text(
                                  msg.trim(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
