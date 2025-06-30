import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedSegment = 0;

  final List<Map<String, dynamic>> flightList = [
    {
      'image': 'assets/images/Icon.svg',
      'title': 'Turkish Airlines',
      'color': Colors.purple,
      'price': r'$120',
      'form': '08:20',
      'to': '14:40',
      'place': '6h 00m',
      'amount': '+2 transfers from airport',
      'fromPlace': 'LDN',
      'toPlace': 'NY',
    },
    {
      'image': 'assets/images/Icon.svg',
      'title': 'Emirates',
      'color': Colors.pinkAccent,
      'price': r'$150',
      'form': '09:15',
      'to': '16:00',
      'place': '6h 45m',
      'amount': '+1 transfer from airport',
      'fromPlace': 'LDN',
      'toPlace': 'DXB',
    },
    {
      'image': 'assets/images/Icon.svg',
      'title': 'Qatar Airways',
      'color': Colors.orange,
      'price': r'$180',
      'form': '07:30',
      'to': '13:20',
      'place': '5h 50m',
      'amount': 'Direct flight',
      'fromPlace': 'LDN',
      'toPlace': 'DOH',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'LDN - NY',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              '25 Dec - 26 Dec',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[400],
          ),
          child: IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[400],
            ),
            child: IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SizedBox(
              width: double.infinity,
              child: CupertinoSegmentedControl<int>(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
                children: const {
                  0: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'Cheaper',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  1: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Faster',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  2: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Special',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                },
                groupValue: _selectedSegment,
                onValueChanged: (int value) {
                  setState(() {
                    _selectedSegment = value;
                  });
                },
                borderColor: Colors.grey,
                selectedColor: Colors.grey.shade300,
                unselectedColor: Colors.white,
                pressedColor: Colors.grey.shade200,
              ),
            ),
          ),

          SizedBox(height: 20),
          if (MediaQuery.of(context).size.width > 600) ...[
            Expanded(
              child: GridView.builder(
                itemCount: flightList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final flight = flightList[index];
                  return CustomCard(
                    image: flight['image'],
                    title: flight['title'],
                    color: flight['color'],
                    price: flight['price'],
                    form: flight['form'],
                    to: flight['to'],
                    place: flight['place'],
                    amount: flight['amount'],
                    fromPlace: flight['fromPlace'],
                    toPlace: flight['toPlace'],
                  );
                },
              ),
            ),
          ] else ...[
            Expanded(
              child: ListView.builder(
                itemCount: flightList.length,
                itemBuilder: (context, index) {
                  final flight = flightList[index];
                  return CustomCard(
                    image: flight['image'],
                    title: flight['title'],
                    color: flight['color'],
                    price: flight['price'],
                    form: flight['form'],
                    to: flight['to'],
                    place: flight['place'],
                    amount: flight['amount'],
                    fromPlace: flight['fromPlace'],
                    toPlace: flight['toPlace'],
                  );
                },
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.image,
    required this.title,
    required this.color,
    required this.price,
    required this.form,
    required this.to,
    required this.place,
    required this.amount,
    required this.fromPlace,
    required this.toPlace,
  });

  final String image, title, price, form, to, fromPlace, toPlace, place, amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
      color: Colors.white,
      elevation: 2,
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  SvgPicture.asset(image, width: 40, height: 40),
                  SizedBox(width: 10),
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      price,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Divider(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          form,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          fromPlace,
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(width: 20),
                  Container(width: 50, height: 2, color: Colors.grey),
                  // SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          to,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          toPlace,
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          place,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          amount,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 18, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
