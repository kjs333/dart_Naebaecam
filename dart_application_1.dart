import 'dart:math';

void P1(int inputNum) {
  late String score;

  if (inputNum >= 90) {
    score = "A";
  } else if (inputNum >= 80) {
    score = "B";
  } else {
    score = "C";
  }

  print("필수 문제 1");
  print("이 학생의 점수는 $inputNum 이며, 등급은 $score등급입니다.");
}

void P2(List<String> cart) {
  Map<String, int> price = {"티셔츠": 10000, "바지": 8000, "모자": 4000};

  int sum = 0;
  for (var c in cart) {
    int? p = price[c];
    p ??= 0; // Map에 없으면 0원으로
    sum += p;
  }

  int temp = 0;
  if (sum >= 20000) {
    temp = sum ~/ 10;
  }

  print("필수 문제 2");
  print("장바구니에 $sum원 어치를 담으셨네요!");
  print("할인금액 : $temp원");
  print("최종적으로 결제하실 금액은 ${sum - temp}원입니다!");
}

List<int> pickLotto() {
  Set<int> numSet = {};
  while (numSet.length < 6) {
    int n = Random().nextInt(45);
    numSet.add(n + 1);
  }
  List<int> numList = numSet.toList();
  numList.sort();

  return numList;
}

// 맞춘 번호 몇 개인지 확인
int checkLotto(List<int> myLotto) {
  List<int> winNum = [9, 19, 29, 35, 37, 38]; //당첨 번호
  int count = 0;

  for (var i in myLotto) {
    if (winNum.contains(i)) {
      count++;
    }
  }

  return count;
}

void lottoPlay() {
  List<int> myLotto = pickLotto(); // 번호 추첨

  print("발급한 로또 번호 : $myLotto");
  int count = checkLotto(myLotto); //일치하는 번호 개수

  String s = "당첨 여부 : ";
  if (count >= 5) {
    s += '1등';
  } else if (count == 4) {
    s += '2등';
  } else if (count == 3) {
    s += '3등';
  } else {
    s += '당첨 실패!';
  }

  print(s);
  myLotto.clear();
  print("현재 발급한 로또 번호 : $myLotto");
}

void main() {
  P1(84);

  print("----------------------------------");

  List<String> cart = ["티셔츠", "바지", "모자", "티셔츠", "바지"];
  P2(cart);

  print("----------------------------------");

  print("도전 문제");

  lottoPlay();
}
