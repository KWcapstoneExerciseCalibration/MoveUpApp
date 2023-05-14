import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

void main() => runApp(const MoveUp());

class MoveUp extends StatefulWidget{
  const MoveUp({super.key});

  @override
  State<StatefulWidget> createState() => _MoveUp();
}

class _MoveUp extends State<MoveUp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoveUp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }

}

// 메인 화면
class MainPage extends StatefulWidget{
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final int _level = 1;
  final int _currentExp = 80;
  final int _nextLevelExp = 100;

  @override
  Widget build(BuildContext context) {
    Widget levelSection = Container(
      padding: const EdgeInsets.only(top: 32, left: 32, right: 32, bottom: 5),
      child: Row(
        children: [
          Text('Level $_level ', style: const TextStyle(fontSize: 20)),
          const Icon(Icons.add_box_outlined,)
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
        percent: (_currentExp.toDouble() / _nextLevelExp.toDouble()),
        center: Text("$_currentExp / $_nextLevelExp"),
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
          const Padding(
            padding: EdgeInsets.all(10),
            child:
            Text('운동 시작', style: TextStyle(fontSize: 30)),
          ),
        ),
    );

    Column buildButtonColumn(Color color, IconData icon, String label){
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
                    .push(MaterialPageRoute(builder: (context) => const DailyLogPage()));
              } ,
              child:
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: buildButtonColumn(color, Icons.square, '일지')),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => StatisticsPage()));
              } ,
              child:
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: buildButtonColumn(color, Icons.square, '통계')),
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
  const DailyLogPage({super.key});

  @override
  State<DailyLogPage> createState() => _DailyLogPageState();
}

class _DailyLogPageState extends State<DailyLogPage>{
  // TODO : 일지 페이지 호출 시 및 setState 사용하여 날짜 변경 시, 이전 주의 일요일 날짜 해당 변수에 저장
  // 지난 주 일요일의 날짜를 여기 저장합니다. 예 : 월요일은 일요일 날짜 + 1
  int _mondayDate = 0;

  // TODO : 우선 데이터베이스를 연동, 해당 날짜의 운동 데이터 읽어와 운동명 및 횟수 Set으로 저장
  String _workoutExample = "예시 운동";
  int _workoutExampleCount = 1;

  @override
  Widget build(BuildContext context) {
    Widget dateSelectSection = Container(
      padding: const EdgeInsets.only(top:25, left: 15, right: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildDateText(),
          _buildDateText(),
          _buildDateText(),
          _buildDateText(),
          _buildDateText(),
          _buildDateText(),
          _buildDateText(),
        ],
      ),
    );

    Widget workoutResultSection = Container(
      height: 240,
      padding: const EdgeInsets.only(top:10, left: 32, right: 32, bottom: 10),
      child: Column(
        children: [
          const Text('오늘 한 운동', style: TextStyle(fontSize: 25)),
          const Padding(padding: EdgeInsets.all(5)),
          Text('$_workoutExample   $_workoutExampleCount회', style: const TextStyle(fontSize: 20))
        ],
      ),
    );

    Color defaultColor = Colors.black;
    Color selectedColor = Theme.of(context).primaryColor;

    // TODO : 하나만 선택 가능으로 변경하기 (setState 사용 필요, 선택 인덱스 추가), 선택 개체 데이터베이스에 저장
    Widget workoutIntensitySection = Container(
      padding: const EdgeInsets.only(top:10, left: 32, right: 32, bottom: 20),
      child: Column(
        children: [
          const Text('오늘 운동 강도', style: TextStyle(fontSize: 25)),
          const Padding(padding: EdgeInsets.only(top:20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButtonColumn(selectedColor, Icons.square, '매우 쉬움'),
              _buildButtonColumn(defaultColor, Icons.square, '쉬움'),
              _buildButtonColumn(defaultColor, Icons.square, '무난함'),
              _buildButtonColumn(defaultColor, Icons.square, '힘듦'),
              _buildButtonColumn(defaultColor, Icons.square, '매우 힘듦'),
            ],
          )
        ],
      ),
    );

    // TODO : 선택 개체 하이라이트 및 데이터베이스에 저장, 커스텀 증상 추가 기능 (데이터베이스 사용?)
    Widget workoutSymptomsSection = Container(
      padding: const EdgeInsets.only(top:15, left: 32, right: 32, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('운동 후 증상', style: TextStyle(fontSize: 25),),
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
              const Icon(Icons.add_box_outlined)
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
            const Divider(thickness: 2,),
            workoutResultSection,
            workoutIntensitySection,
            workoutSymptomsSection,
          ],
        ),
      ),
    );
  }

  Text _buildDateText(){
    _mondayDate++;
    return Text(' $_mondayDate ', style: const TextStyle(fontSize: 20));
  }

  Column _buildButtonColumn(Color color, IconData icon, String label){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400,)),
        ),
      ],
    );
  }
}


// TODO : 통계 페이지 state 전면 수정
// 통계
class StatisticsPage extends StatefulWidget{
  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage>{
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