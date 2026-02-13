 import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

Future<List<DateTime?>?> CalendarWidget(BuildContext context) { 

return showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarType: CalendarDatePicker2Type.single,
        selectedDayHighlightColor: const Color(0xff5F33E1),
        weekdayLabelTextStyle: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
        // تخصيص شكل الأيام لتشبه الصورة التي أرفقتها
        dayBuilder: ({
          required date,
          decoration,
          isFirstSelectableDate,
          isLastSelectableDate,
          isSelected,
          isDisabled,
          isToday,
          textStyle,
        }) {
          return Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              // المربعات السوداء للأيام العادية والأرجواني للمختار
              color: isSelected! ? const Color(0xff5F33E1) : const Color(0xff24252C),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                date.day.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
      dialogSize: const Size(325, 400),
      value: [], // التاريخ الابتدائي
      borderRadius: BorderRadius.circular(15),
    );}