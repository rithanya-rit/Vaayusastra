import 'package:flutter/material.dart';
import 'package:loginchat/paymentOption_page.dart';

class Level3DetailPage extends StatefulWidget {
  @override
  _Level3DetailPageState createState() => _Level3DetailPageState();
}

class _Level3DetailPageState extends State<Level3DetailPage> {
  Offset _position = Offset(20, 20); // Initial position for the chat button
  List<ChatMessage> _messages = [];
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _messages.add(ChatMessage(text: 'How may I assist you?', isBot: true));
  }

  void _showChatInterface(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Chat with us!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: _messages[index].isBot
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          color: _messages[index].isBot
                              ? Colors.grey[300]
                              : Colors.blue[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          _messages[index].text,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        labelText: 'Type your message',
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: _handleUserMessage,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      if (_textController.text.isNotEmpty) {
                        _handleUserMessage(_textController.text);
                      }
                    },
                    child: Text('Send'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleUserMessage(String message) {
    setState(() {
      _messages.add(ChatMessage(text: message, isBot: false));
      _textController.clear();
      _provideBotResponse(message);
    });
  }

  void _provideBotResponse(String message) {
    String response;
    if (message.toLowerCase().contains('what are the payment options available?')) {
      response = 'We accept credit card, debit card, and PayPal.';
    } else if (message.toLowerCase().contains('what are the courses offered?')) {
      response = 'We offer courses in Flutter, React, and Python.';
    } else if (message.toLowerCase().contains('how to enroll in a course?')) {
      response = 'You can enroll in our courses by visiting our website and selecting the course you are interested in.';
    } else if (message.toLowerCase().contains('how to get certification?')) {
      response = 'Upon successful completion of our courses, you will receive a certificate of completion.';
    } else {
      response = 'Apologies, I\'m not sure how to respond to that.';
    }

    Future.delayed(Duration(milliseconds: 700), () {
      setState(() {
        _messages.add(ChatMessage(text: response, isBot: true));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level 3 Detail'),
        backgroundColor: Colors.blueGrey[700], // Match the color of the Login Page
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Level 3 Content',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CourseListPage()),
                    );
                  },
                  child: Text('View Courses'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CourseDescriptionPage(
                        title: 'Flutter Development',
                        description: 'Learn to build mobile applications with Flutter.',
                      )),
                    );
                  },
                  child: Text('View Course Details'),
                ),
              ],
            ),
          ),
          Positioned(
            left: _position.dx,
            top: _position.dy,
            child: Draggable(
              feedback: FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.chat),
                backgroundColor: Colors.yellow, // Match the color of the Login Page
              ),
              child: FloatingActionButton(
                onPressed: () {
                  _showChatInterface(context);
                },
                child: Icon(Icons.chat),
                backgroundColor: Colors.yellow, // Match the color of the Login Page
              ),
              onDraggableCanceled: (Velocity velocity, Offset offset) {
                setState(() {
                  _position = offset;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isBot;

  ChatMessage({required this.text, required this.isBot});
}

class CourseListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
        backgroundColor: Colors.blueGrey[700], // Match the color of the Login Page
      ),
      body: ListView(
        children: [
          CourseCard(
            title: 'Flutter Development',
            description: 'Learn to build mobile applications with Flutter.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDescriptionPage(
                    title: 'Flutter Development',
                    description: 'Learn to build mobile applications with Flutter.',
                  ),
                ),
              );
            },
          ),
          CourseCard(
            title: 'React Development',
            description: 'Master front-end web development with React.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDescriptionPage(
                    title: 'React Development',
                    description: 'Master front-end web development with React.',
                  ),
                ),
              );
            },
          ),
          CourseCard(
            title: 'Python Programming',
            description: 'Explore the world of programming with Python.',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CourseDescriptionPage(
                    title: 'Python Programming',
                    description: 'Explore the world of programming with Python.',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CourseDescriptionPage extends StatelessWidget {
  final String title;
  final String description;

  CourseDescriptionPage({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blueGrey[700], // Match the color of the Login Page
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              description,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentOptionsPage()),
                );
              },
              child: Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  CourseCard({
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}

class CourseDetailPage extends StatelessWidget {
  final String title;
  final String description;

  CourseDetailPage({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blueGrey[700], // Match the color of the Login Page
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                description,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
