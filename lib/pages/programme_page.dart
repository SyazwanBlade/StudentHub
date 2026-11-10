import 'package:flutter/material.dart';
import 'programme_1_screen.dart';
import 'programme_2_screen.dart';
import 'programme_3_screen.dart';

/// Placeholder - owner replaces this with the real page.
class ProgrammePage extends StatelessWidget {
  const ProgrammePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Container(
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.blue,
                indicatorColor: Colors.red,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                tabs: [
                  Tab(text:"Software Engineering"),
                  Tab(text:"Entrepreneurship"),
                  Tab(text:"Sport Science"),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Programme1Screen(),
                  Programme2Screen(),
                  Programme3Screen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
