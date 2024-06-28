import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  void _showCompanyInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.blueGrey[900],
          title: Text(
            'Vaayusastra Aerospace Private Limited',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'VAAYUSASTRA AEROSPACE PRIVATE LIMITED, '
                  'Incubated under IIT MADRAS\'S RTBI (Rural Technology Business Incubator), '
                  'An Innovative Concept of Human Engineering services started with a motto of developing young talents through Aero Modelling workshops and science workshops for children combined with theatre arts like Story telling, Providing internships for the Engineering students and helping them in develop their idea.',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'CEO/Founder:',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'G. JAGADEESH KANNA',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Jagadeesh Kanna, a versatile Indian talent, excels in stage acting, film direction, and lyrical prowess, merging aeronautical knowledge with creative expression. As CEO of Vaayusastra Aerospace, he pioneers a unique educational blend, combining theater with aeronautics to democratize aerospace understanding across India. With a background spanning aeronautical engineering and creative writing, Kanna\'s work spans diverse realms, from aerospace research to film direction and music. His columns in The Hindu Young World Magazine ingeniously fuse storytelling with aeronautical science, showcasing his innovative approach. Kanna\'s knack for intertwining arts and science across various platforms signifies his pioneering spirit in bridging disciplines.',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Close',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: Text('About Us'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _showCompanyInfo(context);
          },
          child: Text(
            'About Us Page',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
