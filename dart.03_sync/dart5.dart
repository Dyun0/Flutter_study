//Broadcast Stream
//Future는 리턴값을 딱 한번만 받아냄.
//Stream은 지속적으로 값을 반환받음 
//Stream은 listen을 단 한번만 실행 가능.
//이에 하나의 stream으로 listen 여러번 실행을 원할 시, Broadcast Stream 

//스트림 사용 시, 임포트
import 'dart:async';

void main(){
  final controller = StreamController();
  final stream = controller.stream.asBroadcastStream();

  final streamListner1 = stream.listen((val) {
    print('listening 1');
    print(val);
   });

  final streamListner2 = stream.listen((val) {
    print('listening 2');
    print(val);
   });

   controller.sink.add(1);
   controller.sink.add(2);
   controller.sink.add(3);
   controller.sink.add(4);
}