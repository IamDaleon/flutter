import 'package:flutter/material.dart';
import 'package:gantt_chart/gantt_chart.dart';

void main() {
  runApp(const Collector());
}

class Collector extends StatelessWidget {
  const Collector({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('OnixMedia Collector'),
        ),
        body: GanttChartView(
          maxDuration: const Duration(
              days: 30 *
                  20), //optional, set to null for infinite horizontal scroll
          startDate: DateTime(2022, 6, 7), //required
          dayWidth: 30, //column width for each day
          eventHeight: 30, //row width for events
          stickyAreaWidth: 200, //sticky area width
          showStickyArea: true, //show sticky area or not
          showDays: true, //show days or not
          startOfTheWeek: WeekDay.sunday, //custom start of the week
          weekEnds: const {WeekDay.friday, WeekDay.saturday}, //custom weekends
          isExtraHoliday: (context, day) {
            //define custom holiday logic for each day
            return DateUtils.isSameDay(DateTime(2022, 7, 1), day);
          },
          events: [
            //event relative to startDate
            GanttRelativeEvent(
              relativeToStart: const Duration(days: 0),
              duration: const Duration(days: 5),
              displayName: 'Do a very helpful task',
            ),
            //event with absolute start and end
            GanttAbsoluteEvent(
              startDate: DateTime(2022, 6, 10),
              endDate: DateTime(2022, 6, 16),
              displayName: 'Another task',
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home, size: 35, color: Colors.black38),
            ),
            BottomNavigationBarItem(
              label: 'Gnatt',
              icon: Icon(Icons.architecture_outlined,
                  color: Colors.black38, size: 35),
            ),
            BottomNavigationBarItem(
              label: 'Chat',
              icon: Icon(Icons.chat_rounded, color: Colors.black38, size: 35),
            ),
            BottomNavigationBarItem(
              label: 'Setting',
              icon: Icon(Icons.zoom_out_sharp, color: Colors.black38, size: 35),
            ),
          ],
        ),
      ),
    );
  }
}
