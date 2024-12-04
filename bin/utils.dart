import 'dart:io';

Future<String> readFile({required int day, required String fileName}) {
  Directory currentDirectory = Directory.current;
  File input = File("${currentDirectory.path}/bin/day$day/$fileName");
  //File input = File(fileName);
  return input.readAsString();
}

int characterCount({required String character, required String text}) {
  return character.allMatches(text).length;
}

int intCount({required int integer, required List<int> numbersList}) {
  // Map: For matching porpuses, if element is found, add 1 to the result
  // Reduce: For results, this will sum every "1" from the previous mapping
  return numbersList
      .map((element) => element == integer ? 1 : 0)
      .reduce((value, element) => value + element);
}
