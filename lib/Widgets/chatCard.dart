import 'package:flutter/material.dart';

class chatCard extends StatelessWidget {
  final content;
  final specifier;
  final time;

  chatCard({Key? key, this.content, this.specifier, this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return specifier == '1'
        ? Padding(
        padding: const EdgeInsets.fromLTRB(22, 8, 0, 8),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB( 0, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white ,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Text(
                                time,
                                style: const TextStyle(fontSize: 12, color: Colors.black26),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(
                                content,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      // const Padding(
                      //   padding: EdgeInsets.all(5.0),
                      //   child: Icon(
                      //     Icons.check_circle_outline,
                      //     color: Color(0xff32c1e0),
                      //     size: 16,
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),

          ],
        ))
        : Padding(
            padding: const EdgeInsets.fromLTRB(22, 8, 0, 8),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff32c1e0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  content,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Text(
                                  time,
                                  style: const TextStyle(fontSize: 12, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ));
  }
}
