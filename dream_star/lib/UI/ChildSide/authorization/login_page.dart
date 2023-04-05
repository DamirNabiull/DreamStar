import 'package:flutter/material.dart';
// import 'package:localization/localization.dart';

class LoginChildScreen extends StatefulWidget {
  const LoginChildScreen({super.key});

  @override
  LoginChildScreenState createState() => LoginChildScreenState();
}

class LoginChildScreenState extends State<LoginChildScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton.icon(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.grey,
                    size: 20.0,
                  ),
                  label: const Text('Изменить роль',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.grey)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    print('Button Pressed');
                  },
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Привет!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.deepPurpleAccent)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Введи код, который ты получил от родителей',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.grey)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 90),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey)),
                    child: const TextField(
                      style: TextStyle(fontSize: 40),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: '',
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 40,
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey)),
                    child: const TextField(
                      style: TextStyle(fontSize: 40),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: '',
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 40,
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey)),
                    child: const TextField(
                      style: TextStyle(fontSize: 40),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: '',
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 40,
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey)),
                    child: const TextField(
                      style: TextStyle(fontSize: 40),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: '',
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 40,
                    height: 60,
                    padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey)),
                    child: const TextField(
                      style: TextStyle(fontSize: 40),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: '',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    print('Button Pressed');
                  },
                  child: const Text('Войти'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
