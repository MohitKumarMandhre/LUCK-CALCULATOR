int calculation({String firstName, String secondName}) {
  int finalScore;
  List<String> firstList = firstName.toLowerCase().split('');
  List<String> secondList = secondName.toLowerCase().split('');

  //making complete word "firstName + loves + second name"
  List<String> magicWord = firstList + 'lucky'.split('') + secondList;
  print(magicWord);
  //Counting occurence of letters and storing them into map
  var nameMap = new Map();
  magicWord.forEach((f) {
    nameMap.containsKey(f) ? nameMap[f]++ : nameMap[f] = 1;
  });

  print(nameMap.values);
  // adding all occurances to list
  List magicCode = nameMap.values.toList();

  print(magicCode);
  List score;
  //repeating calculation until we get magicCode.length of 2
  while (magicCode.length > 2) {
    score = _calculate(magicCode);
    magicCode = score;
    print(score);
  }
  print(magicCode);
  finalScore = magicCode[0] * 10 + magicCode[1];
  print(finalScore);
  return finalScore;
}

//calculation in loop
List _calculate(List magicCode) {
  int countSum;
  List score = new List();
  do {
    countSum = magicCode.first + magicCode.last;
    if (countSum > 9) countSum -= 9;
    score.add(countSum);
    magicCode.removeLast();
    magicCode.removeAt(0);
  } while (magicCode.length >= 2);
  print(magicCode);
  if (magicCode.isNotEmpty) {
    score.add(magicCode.first);
  }
  return score;
}
