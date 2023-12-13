import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/personality_assessment',
      routes: {
        '/personality_assessment': (context) => PersonalityAssessmentScreen(),
        '/crime_prediction': (context) => CrimePredictionScreen(),
      },
    );
  }
}

class PersonalityAssessmentScreen extends StatefulWidget {
  @override
  _PersonalityAssessmentScreenState createState() =>
      _PersonalityAssessmentScreenState();
}

class _PersonalityAssessmentScreenState
    extends State<PersonalityAssessmentScreen> {
  int _selectedOption1 = -1;
  int _selectedOption2 = -1;
  int _selectedOption3 = -1;

  final List<String> _questions = [
    'Question 1: How do you handle stress?',
    'Question 2: What are your favorite hobbies?',
    'Question 3: Describe your ideal vacation destination.',
  ];

  final List<List<String>> _options = [
    ['Option 1', 'Option 2', 'Option 3'],
    ['Option A', 'Option B', 'Option C'],
    ['Option X', 'Option Y', 'Option Z'],
  ];

  void _handleOption1(int value) {
    setState(() {
      _selectedOption1 = value;
    });
  }

  void _handleOption2(int value) {
    setState(() {
      _selectedOption2 = value;
    });
  }

  void _handleOption3(int value) {
    setState(() {
      _selectedOption3 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personality Assessment'),
      ),
      body: Column(
        children: <Widget>[
          for (int i = 0; i < _questions.length; i++)
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _questions[i],
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                for (int j = 0; j < _options[i].length; j++)
                  RadioListTile(
                    title: Text(_options[i][j]),
                    value: j,
                    groupValue: i == 0
                        ? _selectedOption1
                        : i == 1
                        ? _selectedOption2
                        : _selectedOption3,
                    onChanged: i == 0
                        ? _handleOption1
                        : i == 1
                        ? _handleOption2
                        : _handleOption3,
                  ),
              ],
            ),
          ElevatedButton(
            onPressed: () {
              // Process the selected options and perform personality assessment here
              // You can replace this with your actual assessment logic
              _performPersonalityAssessment();
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }

  void _performPersonalityAssessment() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Personality Assessment Result'),
          content: Text(
              'Your personality assessment result is: High Extroversion, Low Neuroticism, Moderate Agreeableness'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class CrimePredictionScreen extends StatefulWidget {
  @override
  _CrimePredictionScreenState createState() => _CrimePredictionScreenState();
}

class _CrimePredictionScreenState extends State<CrimePredictionScreen> {
  String _location = '';

  void _predictCrime() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Crime Prediction Result'),
          content: Text('The predicted crime level is: High'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crime Prediction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Enter Location:',
              style: TextStyle(fontSize: 18),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _location = value;
                });
              },
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                _predictCrime();
              },
              child: Text('Predict Crime'),
            ),
          ],
        ),
      ),
    );
  }
}
