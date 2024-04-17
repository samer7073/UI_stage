
///////////////////////////////////// Calendar ///////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class calendar extends StatefulWidget {
  const calendar({super.key});

  @override
  State<calendar> createState() => _calendarState();
}

class _calendarState extends State<calendar> {
////////////////////////////calendar////////////////////////////////////////////////////
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  _onRangeSelected(DateTime? start, DateTime? end, DateTime focusDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusDay;
      _rangeStart = start;
      _rangeEnd = end;
    });
  }

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          children: [
/////////////////////////////tablecalendar///////////////////////////////////////
            TableCalendar(
              calendarFormat: _calendarFormat,
              startingDayOfWeek: StartingDayOfWeek.monday,
              availableCalendarFormats: const {
                CalendarFormat.month: 'Month',
                CalendarFormat.week: 'Week',
              },
              rangeSelectionMode: RangeSelectionMode.toggledOn,
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2050, 1, 1),
              onPageChanged: (focusDay) {
                _focusedDay = focusDay;
              },
              calendarStyle: CalendarStyle(
                rangeStartDecoration: BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape
                      .circle, // Changez cette couleur selon vos besoins
                ),
                rangeEndDecoration: BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape
                      .circle, // Changez cette couleur selon vos besoins
                ),
                todayDecoration: BoxDecoration(
                  // Optional: Style for today's date
                  color: Colors.purple,
                  shape: BoxShape.circle,
                ),
              ),
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onRangeSelected: _onRangeSelected,
            ),
          ],
        ),
      ),
    );
  }

  _selectDate() async {
    DateTime? _pickeddate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: getInitialDate(),
        lastDate: DateTime.now().add(Duration(days: 30)));
    if (_pickeddate != null) {
      setState(() {
        //myEditTask?.setDate(_pickeddate.toString());
        //_selectedDate = _pickeddate;
      });
    }
  }

  DateTime getInitialDate() {
    DateTime now = DateTime.now().subtract(Duration(days: 0));
    if (_selectedDate.isBefore(now)) {
      return _selectedDate;
    } else
      return now;
  }
}
