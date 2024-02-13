// 함수에서 Stream 반환
//Stream controller 없이 Stream 반환하기.
//Future를 반환하는 경우 async 사용, return 사용
//Stream을 반환하는 경우 async* 사용, yield 사용

import 'dart:async';

//async* 입니당
Stream<String> calculate(int number) async*{
  for(int i = 0 ; i < 5 ; i++ ){
    yield 'i = $i';
    await Future.delayed(Duration(seconds: 1));
  }
}
void playStream(){
  calculate(1).listen((val){
    print(val);
  });
}
void main(){
  playStream();
}