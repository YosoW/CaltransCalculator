import 'package:caltrans/pages/calculatorPage.dart';
import 'package:caltrans/pages/savedPage.dart';
import 'package:caltrans/pages/weatherPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  HomePage({Key key}) : super(key: key);
  
  @override 
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  List<Widget> screen = [CalculatorPage(),SavedPage(), WeatherPage()];

  int selectedIndex = 0;
  void onPageChanged(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  void itemTapped(int selectedIndex){
    pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        // themeMode: ThemeMode.dark,
        theme: ThemeData(
        primarySwatch: Colors.teal,
        // accentColor: Colors.white,
        primaryTextTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          // displayColor: Colors.deepOrangeAccent,
        ),
        // brightness: Brightness.dark,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        // backgroundColor: Color(0xFF2D2F41),
        // backgroundColor: Colors.blueGrey,
        body: 
        PageView(
          controller: pageController,
          children: screen,
          onPageChanged: onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
          
        bottomNavigationBar: BottomNavigationBar(
          onTap: itemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: selectedIndex == 0 ? Colors.orangeAccent[700]: Colors.grey,
              ), 
              // ignore: deprecated_member_use
              title: Text(
                'Home',
                style: TextStyle(
                  color: selectedIndex == 0 ? Colors.orangeAccent[700] : Colors.grey,
                ),
              ),
            ),

            BottomNavigationBarItem(
              icon: Icon(
                Icons.save,
                  color: selectedIndex == 1 ? Colors.orangeAccent[700]: Colors.grey,
                ),
              // ignore: deprecated_member_use
              title: Text(
                'Saved',
                style: TextStyle(
                  color: selectedIndex == 1 ? Colors.orangeAccent[700] : Colors.grey,
                ),
              ),
            ),

            BottomNavigationBarItem(
              icon: Icon(
                Icons.wb_sunny,
                  color: selectedIndex == 2 ? Colors.orangeAccent[700] : Colors.grey,
                ),
              // ignore: deprecated_member_use
              title: Text(
                'Weather',
                style: TextStyle(
                  color: selectedIndex == 2 ? Colors.orangeAccent[700] : Colors.grey,
                ),  
              ),
            )
          ],
        ),
      ),
    );
  }
}