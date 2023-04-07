import 'package:flutter/material.dart';

class TaskDetailPage extends StatefulWidget {
  const TaskDetailPage({super.key});

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      body: Container(
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/taskDetail.png"),
          fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            //AppbarContainer
            Container(
              height: kToolbarHeight,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              //Başlardan 20 lik padding
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      iconSize: 40,
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        size: 40,
                        Icons.arrow_back,
                        color: Colors.black),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only( right: 200),
                          child: Text(
                            'Flutter \nDersleri',
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 50),
                        _CustomContainer(title: 'AÇIKLAMA:', height: 200, width: 400),
                        SizedBox(height: 30),
                        _CustomContainer(title: 'TARİH: 07/03/23',height: 60,width: 400,),
                        SizedBox(height: 30),
                        _CustomContainer(title: 'TAMAMLANMA ORANI: %78', height: 60, width: 400),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                          children: [
                            _CustomButton(
                              title: "Onu da mı ben yapayım?",
                              color1: Colors.white,
                              color2: Colors.red,
                            ),
                            _CustomButton(
                              title: "Yaptım <3",
                              color1: Colors.white,
                              color2: Colors.green,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class _CustomButton extends StatelessWidget {
  const _CustomButton({super.key, required this.title,required this.color1, required this.color2,});

  final String title;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {}, 
      child: Text(title,
       style: Theme.of(context).textTheme.subtitle2?.copyWith(color: color1, fontWeight: FontWeight.bold)),
       style: ElevatedButton.styleFrom(backgroundColor: color2 , shape: const StadiumBorder()),
    );
  }
}

class _CustomContainer extends StatelessWidget {
  const _CustomContainer({super.key,  required this.title, required this.height, required this.width,});

    final String title;
    final  double height;
    final double width;
    

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color:  Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10), 
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 2.0),
          ),
        ], 

      ), 
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ), 
    );
  }
}