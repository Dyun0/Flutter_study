
//async와 await
//함수를 async로 지정한 경우 await을 통해 비동기 함수를 동기처럼 사용 가능
//async와 await 위치 유의!
Future<int> addNumbers2(int number1, int number2) async {
  print('$number1 + $number2 계산 시작');

  await Future.delayed(Duration(seconds: 3), (){
    print('$number1 + $number2 = ${number1 + number2}');
  });

  print('$number1 + $number2 계산 끝');

  return number1 + number2;
}


void main() async {
  final result1 = await addNumbers2(1,1);
  print('결괏값 $result1');
  final result2 = await addNumbers2(2,1);
  print('결괏값 $result2');
}