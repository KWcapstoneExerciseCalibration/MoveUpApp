import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

void main() => runApp(MoveUp());

class MoveUp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoveUp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }

}

// 메인 화면
class MainPage extends StatefulWidget{
  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Widget levelSection = Container(
      padding: const EdgeInsets.only(top: 32, left: 32, right: 32, bottom: 5),
      child: Row(
        children: [
          Text('Level 1 ',
            style: TextStyle(fontSize: 20),
          ),
          Icon(
            Icons.add_box_outlined,
          )
        ],
      )
    );

    Widget levelProgressSection = Container(
      padding: const EdgeInsets.only(top:5, left: 32, right: 32, bottom: 15),
      child: LinearPercentIndicator(
        padding: EdgeInsets.zero,
        animation: true,
        animationDuration: 2500,
        lineHeight: 15,
        percent: 0.8,
        center: Text("80 / 100"),
        progressColor: Colors.green,
      ),
    );

    Widget imageSection = Container(
      padding: const EdgeInsets.only(top:15, left: 32, right: 32, bottom: 25),
      child: Image.asset(
        'images/ham.jpg',
        width: 300,
        height: 300,
        fit: BoxFit.cover,
      ),
    );

    Widget workoutButtonsSection = Container(
        padding: const EdgeInsets.only(top:10, left: 32, right: 32, bottom: 15),
        child: OutlinedButton(
          onPressed: (){

          },
          child:
          Padding(
            padding: EdgeInsets.all(10),
            child:
            Text('운동 시작', style: TextStyle(fontSize: 30)),
          ),
        ),
    );

    Column _buildButtonColumn(Color color, IconData icon, String label){
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Color color = Theme.of(context).primaryColor;

    Widget navigationButtonsSection = Container(
      padding: const EdgeInsets.only(top:25, left: 32, right: 32, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => DailyLogPage()));
              } ,
              child:
              Padding(
                  padding: EdgeInsets.all(20),
                  child: _buildButtonColumn(color, Icons.square, '일지')),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => StatisticsPage()));
              } ,
              child:
              Padding(
                  padding: EdgeInsets.all(20),
                  child: _buildButtonColumn(color, Icons.square, '통계')),
          ),
        ]
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('MoveUp'),
      ),
      body: Column(
        children: [
          levelSection,
          levelProgressSection,
          imageSection,
          workoutButtonsSection,
          navigationButtonsSection,
        ],
      ),
    );
  }
}

// 일지
class DailyLogPage extends StatefulWidget{
  @override
  State<DailyLogPage> createState() => _DailyLogPage();
}

class _DailyLogPage extends State<DailyLogPage>{
  @override
  Widget build(BuildContext context) {
    Widget dateSelectSection = Container(
      padding: const EdgeInsets.only(top:25, left: 15, right: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            ' 1 ',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            ' 2 ',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            ' 3 ',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            ' 4 ',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            ' 5 ',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            ' 6 ',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            ' 7 ',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );

    Widget workoutResultSection = Container(
      padding: const EdgeInsets.only(top:10, left: 32, right: 32, bottom: 160),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '오늘 한 운동',
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    );

    Color color = Colors.black;

    Widget workoutIntensitySection = Container(
      padding: const EdgeInsets.only(top:10, left: 32, right: 32, bottom: 20),
      child: Column(
        children: [
          Text(
            '오늘 운동 강도',
            style: TextStyle(fontSize: 25),
          ),
          Padding(padding: EdgeInsets.only(top:20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButtonColumn(color, Icons.square, '매우 쉬움'),
              _buildButtonColumn(color, Icons.square, '쉬움'),
              _buildButtonColumn(color, Icons.square, '무난함'),
              _buildButtonColumn(color, Icons.square, '힘듦'),
              _buildButtonColumn(color, Icons.square, '매우 힘듦'),
            ],
          )
        ],
      ),
    );

    Widget workoutSymptomsSection = Container(
      padding: const EdgeInsets.only(top:15, left: 32, right: 32, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '운동 후 증상',
            style: TextStyle(fontSize: 25),
          ),
          Row(
            children: [
              OutlinedButton(
                onPressed: (){

                },
                child: Text('통증', style: TextStyle(fontSize: 20, color: Colors.black)),
              ),
              OutlinedButton(
                onPressed: (){

                },
                child: Text('피로감', style: TextStyle(fontSize: 20, color: Colors.black)),
              ),
              Icon(
                Icons.add_box_outlined,
              )
            ],
          )
        ],
      ),
    );

    return MaterialApp(
      title: '일지',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('일지'),
        ),
        body: Column(
          children: [
            dateSelectSection,
            Divider(thickness: 2,),
            workoutResultSection,
            workoutIntensitySection,
            workoutSymptomsSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

// 주간 통계
class weeklyStatistics extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

// 월간 통계
class monthlyStatistics extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

// 통계
class StatisticsPage extends StatefulWidget{
  @override
  State<StatisticsPage> createState() => _StatisticsPage();
}

class _StatisticsPage extends State<StatisticsPage>{
  int selected = 0;

  final sections = [weeklyStatistics(), monthlyStatistics()];

  @override
  Widget build(BuildContext context) {
    Widget weekormonthSection = Container(
      padding: const EdgeInsets.only(top:25, left: 15, right: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('주간', style: TextStyle(fontSize: 20),),
          Padding(padding: EdgeInsets.only(left:20)),
          Text('월간', style: TextStyle(fontSize: 20),),
        ],
      ),
    );


    return MaterialApp(
      title: '통계',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('통계'),
        ),
        body: Column(
          children: [
            weekormonthSection,
            Divider(thickness: 2,),
            sections[selected]
          ],
        ),
      ),
    );
  }
  
}