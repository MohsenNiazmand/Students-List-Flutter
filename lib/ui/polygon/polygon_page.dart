 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:polygon/polygon.dart';
 import 'dart:math' as math;
class PolygonPage extends StatefulWidget{
  @override
  State<PolygonPage> createState() => _PolygonPageState();
}

class _PolygonPageState extends State<PolygonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Polygon'),),body: Center(child:

    Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.fromLTRB(12, 4, 12, 8),
        padding: const EdgeInsets.all(8),
        height: 180,
        decoration: BoxDecoration(
          color: Colors.green.shade600,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'special_score',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                  ),
                  Text(
                    'price_quality',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                     '8.3',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontSize: 40, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PolygonScore(
                    parentColor: Colors.green.shade900,
                    childColor: Colors.green.shade300,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )

      ,),);
  }
}


 class PolygonScore extends StatelessWidget {
   const PolygonScore({
     required this.parentColor,
     required this.childColor,
     super.key,
   });

   final Color parentColor;
   final Color childColor;

   @override
   Widget build(BuildContext context) {
     Offset valueToPoint(double value, int index, int total) {
       const x = 0;
       final y = -value * 0.8;
       final angle = ((math.pi * 2) / total) * index;
       final cos = math.cos(angle);
       final sin = math.sin(angle);
       final tx = x * cos - y * sin;
       final ty = x * sin + y * cos;
       return Offset(tx / 10, ty / 10);
     }

     final List<Offset> parentItems = [];
     final List<Offset> childItems = [];
     int maxCount = 6;
     for (int i = 0; i < maxCount; i++) {
       parentItems.add(valueToPoint(10.0, i + 1, maxCount));
     }

       childItems.add(valueToPoint(8.0, 1, maxCount));
       childItems.add(valueToPoint(6.5, 2, maxCount));
       childItems.add(valueToPoint(9.1, 3, maxCount));
       childItems.add(valueToPoint(8.0, 4, maxCount));
       childItems.add(valueToPoint(6.5, 5, maxCount));
       childItems.add(valueToPoint(6.2, 6, maxCount));



     final parentPolygon = Polygon(parentItems);

     final childPolygon = Polygon(childItems);

     IconData getIcon(int index) {
       switch (index) {
         case 1:
           return Icons.screen_lock_portrait;
         case 2:
           return Icons.camera;
         case 3:
           return Icons.hardware;
         case 4:
           return Icons.battery_0_bar;
         case 5:
           return Icons.memory;
         case 6:
           return Icons.catching_pokemon;
         default:
           return Icons.star;
       }
     }

     return Stack(
       children: [
         Align(
           child: SizedBox(
             width: 150,
             height: 150,
             child: PolygonPaint(
               polygon: parentPolygon,
               isBackground: true,
               parentColor: parentColor,
               // iconColor: childColor,
             ),
           ),
         ),
         Align(
           child: SizedBox(
             width: 150,
             height: 150,
             child: Stack(
               children: [
                 PolygonPaint(
                   polygon: childPolygon,
                   isBackground: false,
                   parentColor: parentColor,
                 ),
                 for (int i = 0; i < childItems.length; i++)
                   Positioned(
                     left: childItems[i].dx * 80 + 47,
                     top: childItems[i].dy * 80 + 42,
                     child: Tooltip(
                       message:
                       '${'score'} ${'featureName' ?? ''} : ${'featureRate' ?? ''}',
                       triggerMode: TooltipTriggerMode.tap,
                       preferBelow: false,
                       showDuration: Duration(seconds: 3),
                       verticalOffset: 10.0,
                       textStyle: Theme.of(context).textTheme.bodyMedium,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(12),
                         color: Colors.white,
                       ),
                       child: Padding(
                         padding: const EdgeInsets.all(20),
                         child: Icon(
                           getIcon(i),
                           size: 16,
                           color: childColor,
                         ),
                       ),
                     ),
                   ),
               ],
             ),
           ),
         ),
       ],
     );
   }
 }

 class PolygonPaint extends StatelessWidget {
   const PolygonPaint({
     required this.polygon,
     required this.isBackground,
     required this.parentColor,
     super.key,
   });

   final Polygon polygon;
   final bool isBackground;
   final Color parentColor;

   @override
   Widget build(BuildContext context) => CustomPaint(
     painter: isBackground
         ? ParentPolygonPainter(polygon, parentColor)
         : ChildPolygonPainter(polygon, parentColor),
     child: Container(),
   );
 }

 class ParentPolygonPainter extends CustomPainter {
   ParentPolygonPainter(this.polygon, this.parentColor);

   final Polygon polygon;
   final Color parentColor;

   @override
   void paint(Canvas canvas, Size size) {
     canvas.drawPath(
       polygon.computePath(
         rect: Offset.zero & size,
       ),
       Paint()..color = HSLColor.fromColor(parentColor).withLightness(0.35).toColor(),
     );
   }

   @override
   bool shouldRepaint(ParentPolygonPainter oldDelegate) => oldDelegate.polygon != polygon;
 }

 class ChildPolygonPainter extends CustomPainter {
   ChildPolygonPainter(this.polygon, this.parentColor);

   final Polygon polygon;
   final Color parentColor;

   @override
   void paint(Canvas canvas, Size size) {
     canvas.drawPath(
       polygon.computePath(
         rect: Offset.zero & size,
       ),
       Paint()..color = parentColor,
     );
   }

   @override
   bool shouldRepaint(ChildPolygonPainter oldDelegate) => oldDelegate.polygon != polygon;
 }
