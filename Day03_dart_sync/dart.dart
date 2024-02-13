//sync : 코드 순서대로 실행
//async: 이전 코드 결과를 기다리지 않고 실행

//Future - 미래에 받아 올 변수 생성
/*
Future<String> name;
Future<int> number;
Future<bool> isOpened;
*/

void addNumbers(int number1, int number2){
  print('$number1 + $number2 계산 시작');

  //3초간 대기. 비동기 이므로 계산끝 print가 먼저 실행됨.
  Future.delayed(Duration(seconds: 3), (){
    print('$number1 + $number2 = ${number1 + number2}');
  });

  print('$number1 + $number2 계산 끝');
}


void main(){
  addNumbers(1,1);
}