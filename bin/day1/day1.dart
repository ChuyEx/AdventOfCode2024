import '../utils.dart';

void main(List<String> arguments) async {
  final (list1, list2) = await getFileLists("input");
  int totalDistance1 = 0;
  int totalDistance2 = 0;

  if (list1.length != list2.length) {
    throw FormatException("Lists do not contain the same number of items");
  }

  var sortedList1 = list1.toList()..sort();
  var sortedList2 = list2.toList()..sort();

  for (int i = 0; i < list1.length; i++) {
    totalDistance1 += (sortedList1[i] - sortedList2[i]).abs();
    totalDistance2 += sortedList1[i] *
        intCount(integer: sortedList1[i], numbersList: sortedList2);
  }

  print("Total Distance, Part #1: $totalDistance1");
  print("Total Distance, Part #2: $totalDistance2");
}

Future<(List<int>, List<int>)> getFileLists(String fileName) async {
  String fileString = await readFile(day: 1, fileName: fileName);

  // Removing linebreaks and additional spacing
  String auxString =
      fileString.replaceAll("\n", ";").replaceAll(RegExp("\\s+"), " ");

  // Saving current string into a list
  List<String> auxList = auxString.split(";");
  List<int> leftList = [];
  List<int> rightList = [];

  for (int i = 0; i < auxList.length; i++) {
    String currentText = auxList[i];

    leftList.add(int.parse(currentText.substring(0, currentText.indexOf(" "))));
    rightList
        .add(int.parse(currentText.substring(currentText.indexOf(" ") + 1)));
  }

  return (leftList, rightList);
}
