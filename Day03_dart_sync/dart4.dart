//Stream
//Future는 리턴값을 딱 한번만 받아냄.
//Stream은 지속적으로 값을 반환받음 

//스트림 사용 시, 임포트
import 'dart:async';

void main(){
  final controller = StreamController();
  final stream = controller.stream;

  final streamListner1 = stream.listen((val) {
    print(val);
   });

   controller.sink.add(1);
   controller.sink.add(2);
   controller.sink.add(3);
   controller.sink.add(4);
}