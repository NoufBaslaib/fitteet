import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SoccerAnalysisPage(),
    );
  }
}

class SoccerAnalysisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soccer Analysis'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LeagueHeader(),
            MatchResults(),
            LeagueStatistics(),
          ],
        ),
      ),
    );
  }
}

class LeagueHeader extends StatelessWidget {
  // This widget is the header of the league
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'الدوري المحترفين',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          // This should be a logo or an image
          Icon(Icons.sports_soccer, size: 50),
        ],
      ),
    );
  }
}

class MatchResults extends StatelessWidget {
  // This widget will display the list of matches
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          // You will need to loop through the match data and create a row for each match
          MatchTile(teamA: 'Team A', teamB: 'Team B', scoreA: 2, scoreB: 1),
          MatchTile(teamA: 'Team C', teamB: 'Team D', scoreA: 1, scoreB: 0),
          // Add more matches as needed
        ],
      ),
    );
  }
}

class MatchTile extends StatelessWidget {
  final String teamA;
  final String teamB;
  final int scoreA;
  final int scoreB;

  const MatchTile({
    Key? key,
    required this.teamA,
    required this.teamB,
    required this.scoreA,
    required this.scoreB,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text('$teamA vs $teamB'),
        subtitle: Text('Score: $scoreA - $scoreB'),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class LeagueStatistics extends StatelessWidget {
  // This widget will display league statistics
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: StatisticTile(title: 'Goals', value: '123'),
          ),
          Expanded(
            child: StatisticTile(title: 'Assists', value: '321'),
          ),
          Expanded(
            child: StatisticTile(title: 'Matches', value: '20'),
          ),
          // Add more statistics as needed
        ],
      ),
    );
  }
}

class StatisticTile extends StatelessWidget {
  final String title;
  final String value;

  const StatisticTile({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 20.0),
        ),
      ],
    );
  }
}