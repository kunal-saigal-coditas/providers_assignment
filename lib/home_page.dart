import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_assignment/data_and%20_model.dart/data.dart';
import 'package:providers_assignment/provider/count_and_slash_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    print("Build");

    return Consumer<CountandSlashProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('To Do List'), Text("Data : ${value.count()}")],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(12),
            child: ListView.builder(
              itemCount: dummyData.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 0.1,
                  color: Color.fromARGB(219, 249, 247, 247),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2, 5, 15, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: InkWell(
                            onTap: () {
                              (dummyData[index].isSelected)
                                  ? value.delete(index)
                                  : value.setValue(index);
                              print(dummyData[index].isSelected);
                            },
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Icon((dummyData[index].isSelected)
                                  ? Icons.check
                                  : null),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dummyData[index].name,
                                    style: TextStyle(
                                        decoration: dummyData[index].isSelected
                                            ? TextDecoration.lineThrough
                                            : null,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    dummyData[index].date,
                                    style: TextStyle(
                                        decoration: dummyData[index].isSelected
                                            ? TextDecoration.lineThrough
                                            : null,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              const Icon(Icons.arrow_forward_ios_outlined),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
