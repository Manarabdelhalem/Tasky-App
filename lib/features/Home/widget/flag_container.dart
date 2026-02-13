import 'package:flutter/material.dart';

class FlagContainer extends StatelessWidget {
   FlagContainer({
    super.key,
 required this.isSelected,
  required this.index,
  this.onTap
  });
final bool isSelected;
final int index;
void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
             
             width: 70,
             height: 70,
             decoration: BoxDecoration(
               color:isSelected ? Colors.deepPurple : Colors.white,
               border: isSelected ? null : Border.all(width: 2, color: Colors.grey),
               borderRadius: BorderRadius.circular(10)
             ),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 children: [
                 Icon(Icons.flag_outlined,color: isSelected ?  Colors.white:Colors.deepPurple,),
                   Text("$index", style: TextStyle(fontSize: 16,color: isSelected ? Colors.white : Colors.black),)
                 ],
               ),
             ),
           ),
    );
  }
}