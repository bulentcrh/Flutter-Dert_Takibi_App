import 'package:f43_dert_takibi_app/Func/buttons.dart';
import 'package:f43_dert_takibi_app/Func/todo_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();

  //Works List
  List worksList = [
    ["Flutter Dersleri", "Flutter Derslerini bu ay içerisinde bitir", 5.0],
    ["Unity Dersleri", "Unity Derslerini bu ay içerisinde bitir", 8.0],
  ];

  void saveNewTask() {
    setState(() {
      worksList.add([_controller1.text, _controller2.text, 5.0]);
      _controller1.clear();
      _controller2.clear();
      _controller3.clear();
      _controller4.clear();
    });
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      worksList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      appBar: AppBar(
        leading: IconButton(
            color: Colors.black,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            icon: Icon(Icons.person)),
        backgroundColor: Color(0xffF7F7F7),
        title: Text(
          "Dert Takibi",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff1CB8AA),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => createNewTask(
                        taskTitleController: _controller1,
                        taskDetailController: _controller2,
                        taskDateController: _controller3,
                        taskPerController: _controller4,
                        onSaved: saveNewTask,
                        onCancel: () => Navigator.of(context).pop,
                      )));
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/homePage.png"))),
        child: ListView.builder(
          itemCount: worksList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
                taskName: worksList[index][0],
                taskDetail: worksList[index][1],
                taskPercent: worksList[index][2],
                deleteFunction: (context) => deleteTask(index));
          },
        ),
      ),
    );
  }
}

class createNewTask extends StatelessWidget {
  final taskTitleController;
  final taskDetailController;
  final taskDateController;
  final taskPerController;
  VoidCallback onSaved;
  VoidCallback onCancel;

  createNewTask(
      {Key? key,
      required this.taskTitleController,
      required this.taskDetailController,
      required this.taskDateController,
      required this.taskPerController,
      required this.onSaved,
      required this.onCancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/newtask2.png"))),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 116, 116, 116),
                              blurRadius: 15,
                              spreadRadius: 0)
                        ],
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          "Başlık:",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextField(
                          controller: taskTitleController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Projenin Başlıgını Girin:"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 116, 116, 116),
                              blurRadius: 15,
                              spreadRadius: 0)
                        ],
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          "Açıklama:",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextField(
                          controller: taskDetailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Projenin Detaylarını Girin:"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 116, 116, 116),
                              blurRadius: 15,
                              spreadRadius: 0)
                        ],
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          "Tarih:",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextField(
                          controller: taskDateController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Projenin Bitiş Tarihini Girin:"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 116, 116, 116),
                              blurRadius: 15,
                              spreadRadius: 0)
                        ],
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          "Tamamlanma Oranı:",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          controller: taskPerController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Projenin tamamlanma Oranı:"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                        text: "Sil",
                        onPressed: onCancel,
                      ),
                      MyButton(
                        text: "Kaydet",
                        onPressed: onSaved,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TaskDetail extends StatelessWidget {
  const TaskDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      body: Column(
        children: [],
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/profilePage1.png"))),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(
                "Selam User!",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/art.png"),
                radius: 120,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Color(0xffFFFFFF).withOpacity(0.6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 70,
                      child: Text(
                        "Ad SoyAd:",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Text("User Usergil",
                        style: TextStyle(color: Colors.black.withOpacity(0.5)))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Color(0xffFFFFFF).withOpacity(0.6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 70,
                      child: Text(
                        "E-Mail:",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Text("userusergil@gmail.com",
                        style: TextStyle(color: Colors.black.withOpacity(0.5)))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
