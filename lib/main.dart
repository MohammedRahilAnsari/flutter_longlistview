import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Long List View",
    home: Scaffold(
      appBar: AppBar(
        title: Text("Long List View"),
      ),
      body: getListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Add One More Item',
        onPressed: () {
          debugPrint("FAB Clicked");
        },
      ),
    ),
  ));
}

void showSnackBar(BuildContext context, String item){
  var snackBar = SnackBar(
      content: Text("You just tapped $item"),
    action: SnackBarAction(
      label: "UNDO",
      onPressed: (){
        debugPrint('Performing Dummy UNDO Operation');
      },
    ),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}

List<String> getListElements() {
  var items = List<String>.generate(500, (index) => "Item $index");
  return items;
}

Widget getListView() {
  var listItems = getListElements();
  var listView = ListView.builder(itemBuilder: (context, index) {
    return ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(listItems[index]),
      onTap: () {
        showSnackBar(context, listItems[index] );
        // debugPrint('${listItems[index]} was tapped)');
      },
    );
  });
  return listView;
}
