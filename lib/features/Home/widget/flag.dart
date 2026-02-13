import 'package:flutter/material.dart';
import 'package:tasky_app/core/constant/app_icon.dart';
import 'package:tasky_app/features/Home/widget/flag_container.dart';
import 'package:tasky_app/features/Home/widget/material_button_widget.dart';

class FlagWindow extends StatefulWidget {
   FlagWindow({super.key});

  @override
  State<FlagWindow> createState() => _FlagWindowState();
}

class _FlagWindowState extends State<FlagWindow> {
final List<int> flagIndexList=[1,2,3,4,5,6,7,8,9,10];

int selectedFlagIndex=0;
bool isSelectedButton=false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Task Priority",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          //SizedBox(height: 20,),
          Divider(color: Colors.grey,),
         // SizedBox(height: 10,),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.start,
          children: flagIndexList.map((index)=>FlagContainer(index: index,isSelected: selectedFlagIndex==index,onTap: () {
            setState(() {
              selectedFlagIndex=index;
            });
          },)).toList()
            
           
        )
        ],
      ),
      actions: [
Row(
  spacing: 10,
  children: [
            Expanded(
              child: MaterialButtonWidget(
                 bgColor: Colors.white,
          textColor: Colors.deepPurple,
                text: "Cancel", onPressed: (){
                Navigator.pop(context);
              },  
              
            ),),
             SizedBox(width: 10,),
        Expanded(
          child: MaterialButtonWidget(text: "Save", onPressed: (){
           // Navigator.pop(context);
          },  
          // bgColor: Colors.deepPurple,
          // textColor: Colors.white
          ),
              
        ),
  ],
)
      ],
    );
  }
}

