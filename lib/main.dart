import 'package:flutter/material.dart';
import 'package:scantastic/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const AppEnticer(),
    );
  }
}

class AppEnticer extends StatefulWidget {
  const AppEnticer({Key? key}) : super(key: key);

  @override
  _AppEnticerState createState() => _AppEnticerState();
}

class _AppEnticerState extends State<AppEnticer> {
  bool expanded = false;

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      setState(() {
        expanded = true;
      });

      Future.delayed(Duration(seconds: 3)).then((value) {
        Navigator.of(context)
            .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeWidget()), (route) => false);
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => HomeWidget(),
        //   ),
        // );
      });
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.deepPurple,
          child: Center(
            child: AnimatedContainer(
              curve: Curves.bounceOut,
              duration: Duration(
                seconds: 1,
                milliseconds: 500,
              ),
              height: expanded ? MediaQuery.of(context).size.width * 0.7 : 100,
              width: expanded ? MediaQuery.of(context).size.width * 0.7 : 100,
              // color: Colors.white,
              // height: 200,
              // clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: Colors.white,
                  // shape: RoundedRectangleBorder(),
                  // border: RoundedRectangleBorder(),
                  borderRadius: BorderRadius.circular(expanded ? 12 : 24),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/chefhatqr.png',
                    ),
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    // scale: 0.5,
                  ),
                  boxShadow: expanded
                      ? [
                          BoxShadow(
                            blurRadius: 30,
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(10, 10),
                          ),
                        ]
                      : null),
              // child: Image.asset(
              //   'assets/chefhatqr.png',
              //   // fit: BoxFit.,
              //   // height: 200,
              // ),
              // backgroundImage: AssetImage(
              //   'assets/chefhatqr.png',
              // ),
            ),
          ),
        ),
        Align(
          child: AnimatedOpacity(
            duration: Duration(seconds: 1),
            opacity: expanded ? 1.0 : 0.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircularProgressIndicator(
                color: Colors.purpleAccent,
              ),
            ),
          ),
          alignment: Alignment.bottomCenter,
        ),
      ],
    );
  }
}
