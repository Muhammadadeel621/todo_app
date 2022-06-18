import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<dynamic> list = ["ADEEL", "RAO", "NOMAN", "AHMED AMIN"];
  var output = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Center(child: Text("TODO APP"))),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Colors.grey),
                ),
                padding: EdgeInsets.only(left: 15),
                height: 60,
                width: 350,
                margin: EdgeInsets.only(top: 30),
                child: ListTile(
                  title: Text("${list[index]}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  trailing: Container(
                    width: 50,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text("EDIT ITEM"),
                                      content: TextField(
                                        onChanged: (value) {
                                          output = value;
                                        },
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              setState(() {
                                                list.replaceRange(
                                                    index, index + 1, {output});
                                              });
                                            },
                                            child: Text("EDIT"))
                                      ],
                                    );
                                  });
                            },
                            child: Icon(
                              Icons.edit,
                              size: 20,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                list.removeAt(index);
                              });
                            },
                            child: Icon(
                              Icons.delete,
                              size: 20,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("ADD ITEM"),
                  content: TextField(
                    // decoration: InputDecoration(
                    //   border: InputBorder.none,
                    //   fillColor: Colors.grey,
                    //   filled: true,
                    //   hintText: "EDIT YOUR TEXT",
                    // hintStyle: TextStyle(
                    //     fontSize: 35,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.black),
                    // ),
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            list.add(output);
                          });
                        },
                        child: Text("ADD"))
                  ],
                );
              });
        },
        child: Text("ADD"),
      ),
    );
  }
}
