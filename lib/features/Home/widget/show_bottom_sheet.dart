import 'package:flutter/material.dart';
import 'package:tasky_app/features/Home/widget/calendar_widget.dart';

class ShowBottomSheet extends StatelessWidget {
  const ShowBottomSheet({super.key,this.ontapCalendar,this.ontapflag,this.ontapSend, required this.titleController, required this.descriptionController});
final void Function()? ontapCalendar;
final void Function()? ontapflag;
final void Function()? ontapSend;
final TextEditingController? titleController;
final TextEditingController? descriptionController;
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: 250,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Add  task ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                SizedBox(height: 20,),
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: "Do math Homework"
                      ),
                    ),
                    SizedBox(height: 20,),
                     TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        
                        border: OutlineInputBorder(),
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: "Description "
                      ),
                    ),
                
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                            //  IconButton(onPressed: (){}, icon: Icon(Icons.calendar_month,color: Color(0xff5F33E1) ,)),
                            // أضف هذا الاستيراد في الأعلى
            
            
            // داخل الـ IconButton الخاص بالتقويم:
            IconButton(
              onPressed: () async {
                var results = await CalendarWidget(context);
            
                if (results != null && results.isNotEmpty) {
                   print("التاريخ المختار: ${results[0]}");
                   // يمكنك هنا تخزين التاريخ في متغير الحالة (State)
                }
              },
              icon: const Icon(Icons.calendar_month, color: Color(0xff5F33E1)),
            ),
                    SizedBox(width: 5,),
                       GestureDetector(
                        child: IconButton(
                          onPressed: ontapflag, 
                        icon: Icon(Icons.flag_outlined,color:Color(0xff5F33E1)  ,))),
                       Spacer(),
                        GestureDetector(
                          child: IconButton(
                            onPressed: ontapSend,
                             icon: Icon(Icons.send,color: Color(0xff5F33E1) ,)))
                    ],
                    
                    ),
                )
                  ,
                  ],
                ),
              ),
            ),
          );
  }
}