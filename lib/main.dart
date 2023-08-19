import 'package:diabetes_detection/second.dart';
import 'package:diabetes_detection/widget/buttonWidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xffBDEDF2),
        ),
        scaffoldBackgroundColor: const Color(0xffbdecf2),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const MyHomePage(),
        "second": (context) => const Secondpage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Diabeto Predict",
            style: TextStyle(
                color: Color(
                  0xff53828c,
                ),
                fontSize: 25),
          ),
          actions: [
            Row(
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Home",
                      style: TextStyle(
                        color: Color(
                          0xff53828c,
                        ),
                      ),
                    )),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Test",
                      style: TextStyle(
                        color: Color(
                          0xff53828c,
                        ),
                      ),
                    ))
              ],
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Let us help you beat diabetes before it beats you.",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam in rutrum enim, nec ultrices arcu. Proin in nisl in quam euismod convallis. Curabitur eu felis tempor, laoreet ex ac, aliquet erat. Maecenas eget ligula id tellus interdum lobortis. Curabitur dapibus eu massa id congue. Duis accumsan cursus massa et dictum..",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                CircleAvatar(
                  backgroundImage: const AssetImage('assets/images/heart.jpg'),
                  // minRadius: 1
                  radius: 100,
                  // height: 400,

                  backgroundColor: Colors.white.withOpacity(0.1),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                CustomContainer(
                  text: "Start Now",
                  textColor: Colors.white,
                  containerColor: const Color(0xff53828c),
                  width: width * 0.5,
                  height: height * 0.09,
                  call: () {
                    Navigator.pushNamed(context, 'second');
                  },
                  borderRadius: 5,
                )
                // Container(
                //   // alignment: Alignment.bottomRight,
                //   height: height * 0.1,
                //   width: width * 0.5,
                //   child: InkWell(
                //       child: Container(
                //         margin: EdgeInsets.fromLTRB(5, 5, 10, 5),
                //         decoration: BoxDecoration(
                //           color: Color(0xff5823C),
                //         ),
                //         child: Align(
                //             child: Text(
                //               'START TEST',
                //               style: TextStyle(
                //                   color: Color(0xFFFFFFFF),
                //                   fontSize: 19,
                //                   fontWeight: FontWeight.bold),
                //             ),
                //             alignment: Alignment.center),
                //       ),
                //       onTap: () {}),
                // )
              ],
            ),
          ),
        ));
  }
}
