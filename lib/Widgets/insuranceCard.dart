import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaid1/Widgets/insuranceDetailsRow.dart';
// class insuranceCard extends StatelessWidget {
//   final String image;
//   final name;
//   final price;
//   const insuranceCard({Key? key, required this.image, this.name, this.price}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Color(0xffe1ebfc),
//           borderRadius: BorderRadius.circular(16)
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               flex: 3,
//               child: Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: Image(
//                   image: AssetImage(image),
//                   height: 110,
//                   width: 110,
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 6,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(name,
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 21
//                     ),),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 5,  0, 5),
//                     child: Text( '$price per year',
//                       style: TextStyle(
//                           color: Colors.green,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 18
//                       ),),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 5, 20, 5),
//                     child: Text('Terminal illness benefit if you are diagnosed with Terminal illness.Get 100% of your cover immmidiately',
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                           color: Colors.grey.shade700,
//                           fontWeight: FontWeight.w400,
//                           fontSize: 13
//                       ),),
//                   ),
//
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
class insuranceCard extends StatefulWidget {
  final String image;
  final String name;
  final String price;

  insuranceCard({required this.image, required this.name, required this.price});

  @override
  _insuranceCardState createState() => _insuranceCardState();
}

class _insuranceCardState extends State<insuranceCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffe1ebfc),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image(
                      image: AssetImage(widget.image),
                      height: 110,
                      width: 110,
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 21,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Text(
                          '${widget.price} per year',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 20, 5),
                        child: Text(
                          'Terminal illness benefit if you are diagnosed with Terminal illness.Get 100% of your cover immediately',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Icon(_isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                ),
              ),
            ),
            if (_isExpanded)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children:  [
                     insuranceDetailsRow(icon: CupertinoIcons.person_crop_square,title: 'Insurance ID: 315166511'),
                     insuranceDetailsRow(icon: CupertinoIcons.checkmark_shield_fill,title: widget.name),
                     insuranceDetailsRow(icon: Icons.clean_hands,title: 'Get 33% off on your health issue'),
                     insuranceDetailsRow(icon: CupertinoIcons.calendar_badge_plus,title: '07/08/2025'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}