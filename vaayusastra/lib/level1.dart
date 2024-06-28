import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:loginchat/paymentOption_page.dart'; // Update the import if necessary

class Level1DetailPage extends StatefulWidget {
  @override
  _Level1DetailPageState createState() => _Level1DetailPageState();
}

class _Level1DetailPageState extends State<Level1DetailPage> {
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
      backgroundColor: Colors.blueGrey[900],
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.7,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Chat with us!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
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
      response = 'We offer courses in Aero Modelling Workshop, Science Workshops for Children, and Internship Programs.';
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
        title: Text('Level 1 Detail'),
        backgroundColor: Colors.blueGrey[700],
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Level 1 Content',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
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
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.yellow,
                  ),
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
                backgroundColor: Colors.yellow,
              ),
              child: FloatingActionButton(
                onPressed: () {
                  _showChatInterface(context);
                },
                child: Icon(Icons.chat),
                backgroundColor: Colors.yellow,
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
      backgroundColor: Colors.blueGrey[900],
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
        backgroundColor: Colors.blueGrey[700],
      ),
      body: ListView(
        children: [
          CourseCard(
            title: 'Aero Modelling Workshop',
            description: 'Explore the basics of aerodynamics and aircraft design.',
            driveLink: 'https://drive.google.com/aero-modelling-link',
          ),
          CourseCard(
            title: 'Science Workshops for Children',
            description: 'Engage children with fun and educational science experiments.',
            driveLink: 'https://drive.google.com/science-workshops-link',
          ),
          CourseCard(
            title: 'Internship Programs',
            description: 'Gain hands-on experience with our engineering internship opportunities.',
            driveLink: 'https://drive.google.com/internship-programs-link',
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey[900],
    );
  }
}

class CourseDescriptionPage extends StatelessWidget {
  final String title;
  final String description;
  final String driveLink;

  CourseDescriptionPage({
    required this.title,
    required this.description,
    required this.driveLink,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blueGrey[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              description,
              style: TextStyle(fontSize: 18, color: Colors.white),
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
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.yellow,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                launch(driveLink);
              },
              child: Text('View Drive Link'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blueGrey[900],
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String description;
  final String driveLink;

  CourseCard({
    required this.title,
    required this.description,
    required this.driveLink,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[800],
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          description,
          style: TextStyle(color: Colors.white70),
        ),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CourseDescriptionPage(
                  title: title,
                  description: description,
                  driveLink: driveLink,
                ),
              ),
            );
          },
          child: Text('Details'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow,
          ),
        ),
      ),
    );
  }
}
