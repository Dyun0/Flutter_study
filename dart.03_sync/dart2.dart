
//async와 await
//함수를 async로 지정한 경우 await을 통해 비동기 함수를 동기처럼 사용 가능
//async와 await 위치 유의!
Future<void> addNumbers2(int number1, int number2) async {
  print('$number1 + $number2 계산 시작');

  await Future.delayed(Duration(seconds: 3), (){
    print('$number1 + $number2 = ${number1 + number2}');
  });

  print('$number1 + $number2 계산 끝');
  
}


void main() async {
  await addNumbers2(1,1);
  await addNumbers2(2,1);
}