import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 228, 8, 78)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Currency convertor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController text_num = TextEditingController();
  double result = 0;

  void clearText() {
    text_num.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        color: const Color.fromARGB(255, 167, 197, 248),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  child: Text(
                "INR $result",
                style: TextStyle(
                    fontSize: 50,
                    color: const Color.fromARGB(255, 255, 255, 255)),
              )),
              SizedBox(
                width: 350,
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: text_num,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.monetization_on_outlined),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Color.fromARGB(255, 255, 255, 255))),
                    hintText: "Please enter a amount in USD",
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 350,
                child: ElevatedButton(
                    onPressed: () {
                      result = double.parse(text_num.text) * 81;
                      setState(() {});
                      clearText();
                    },
                    child: Text(
                      "Convert",
                      style: TextStyle(color: Color.fromARGB(255, 225, 0, 0)),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
