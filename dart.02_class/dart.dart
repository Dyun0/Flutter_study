import 'dart:async';

//클래스
class Idol{
  String name = 'BlackPink';
  void sayName(){
    //this.를 통해 내부 속성 지칭 가능
    print('저희는 ${this.name}입니다!');

    //속성 이름이 한개만 존재한다면 this. 생략 가능.
    print('저희는 ${name}입니다22!');
  }
}

class Idol2{
  // constructor
  // 생성자 사용시, final 사용.
  final String name;
  Idol2(String name) : this.name = name;
  void sayName(){
    print('저희는 ${name}입니다!');
  }
}

class Idol3{
  // constructor2
  // this.를 사용하면 자동으로 매개변수에 저장
  final String name;
  Idol3(this.name);
  void sayName(){
    print('저희는 ${name}입니다!');
  }
}

//named constructor
class Idol4{
final String name;
final int membersCount;

  //생성자
  Idol4(String name, int membersCount)
    : this.name = name,
      this.membersCount = membersCount;
  //네임드 생성자
  Idol4.fromMap(Map<String, dynamic> map)
    : this.name = map['name'],
      this.membersCount = map['membersCount'];
  void sayName(){
    print('저희는 ${name}입니다! 멤버는 ${this.membersCount}명 입니다.');
  }
}

//Private
class Idol5{
  // 변수명이 _로 시작 시, 프라이빗 -> 일반적으로는 클래스 내에서만 사용 가능이지만, 다트에서는 같은 파일에서만 접근 가능한 변수
  String _name;
  Idol5(this._name);
}

// Getter & Setter
class Idol6{
  String _name = 'IZONE';

  //게터 - get이라는 키워드 활용, 매개변수 안받음 ()도 없음.
  String get name {
    return this._name;
  }
  //세터 - set이라는 키워드 활용, 한번에 하나의 변수만 가능
  set name(String name){
    this._name = name;
  }
}

// Inheritance
//상속
class Idol7{
  final String name;
  final int membersCount;

  Idol7(this.name, this.membersCount);

  void sayName(){
    print('저희는 ${this.name} 입니다.');
  }
  void sayMembersCount(){
    print('저희는 총 ${this. membersCount} 명 입니다.');
  }
}
class BoyGroup extends Idol7{

  //변수 상속시, super 사용법 1
  BoyGroup(
    String name,
    int membersCount,
  ) : super(name, membersCount,);

  void sayMale(){
    print('저희는 남자 아이돌 입니다.');
  }
}

//Override
class GirlGroup extends Idol7{
  //변수 상속시, super 사용법 2
  GirlGroup(
    super.name,
    super.membersCount,
  );

  //override 키워드를 사용
  @override
  void sayName(){
    print('저희는 여자아이돌 ${this.name} 입니다.');
  }
}

//Interface
//인터페이스 상속과 다르게 Idol7의 정의만 받음.
// 상속이 아니기에 모든 변수, 함수 재정의 필요. 
// 쉼표를 통해 여러 클래스 받기도 가능
class CoedGroup implements Idol7{
  final String name;
  final int membersCount;

  CoedGroup(
    this.name,
    this.membersCount,
  );

  void sayName(){
    print('저희는 혼성 그룹 ${this.name}입니다.');
  }

  void sayMembersCount(){
    print('저희는 총 ${this.membersCount}명 입니다.');
  }
}

//Mixin
//믹스인 - 특정 클래스에 넣을 수 있는 선택옵션 같은 존재. 상속에도 적용 가능.
mixin IdolSingMixin on Idol7{
  void sing(){
    print('${this.name}이 노래를 부릅니다.');
  }
}
//이런식으로 상속 뒤에 with로 추가.
// 쉼표를 통해 여러개도 가능
class BoyGroup2 extends Idol7 with IdolSingMixin{

  //변수 상속시, super 사용법 1
  BoyGroup2(
    String name,
    int membersCount,
  ) : super(name, membersCount,);

  void sayMale(){
    print('저희는 남자 아이돌 입니다.');
  }
}

//Abstract
//추상화 - 부모 클래스를 사용할 일이 없을 때, 추상 메서드 생성용
abstract class Idol8{
  final String name;
  final int membersCount;

  Idol8(this.name, this.membersCount);

  void sayName();
  void sayMembersCount();
}

class GirlGroup2 implements Idol7{
  final String name;
  final int membersCount;

  GirlGroup2(
    this.name,
    this.membersCount,
  );
  void sayName(){
    print('저희는 여자아이돌 ${this.name} 입니다.');
  }
  void sayMembersCount(){
    print('${this.name} members are ${this.membersCount}.');
  }
}

//Generic
//제네릭 - 타입의 지정을 클래스, 함수 정의가 아닌 인스턴스화, 실행으로 미룰때 활용.
// <>를 이용하며 사이에 입력되는 값이 제네릭 문자임.
/* ex - 어떤 값이든 상관 없지만 개발자들의 관례
  T - 변수타입 - T value;
  E - 리스트 내부 요소 타입 - List<E>;
  K, V - 키와 밸류 표현 - Map<K, V>
*/
class Cache<T>{
  final T data;
  Cache({
    required this.data,
  });
}

//Static
// 스태틱 
// 스태틱 키워드를 사용한 인스턴스는 객체가 아닌 '클래스에 귀속됨'
class Counter{
  static int i= 0;
  Counter(){
    i++;
    print(i);
  }
}

//Cascade Operator
//캐스케이드 연산자 ..을 생성한 객체의 멤버 함수 사용.

void main(){
  //Class
  Idol BlackPink = Idol();
  BlackPink.sayName();

  //constructor
  Idol2 bts = Idol2('BTS');
  bts.sayName();

  //constructor2
  Idol3 itzy = Idol3('itzy');
  itzy.sayName();

  //named constructor
  Idol4 Ive = Idol4('Ive', 5);
  Ive.sayName();

  Idol4 LESSERAFIM = Idol4.fromMap({
      'name' : 'LE SSERAFIM',
      'membersCount' : 5
  });
  LESSERAFIM.sayName();

  //Private
  Idol5 IOI = Idol5('IOI');
  print(IOI._name);// 같은 파일이라 가능 ※다트의 특성!

  //Getter & Setter
  Idol6 IZONE = Idol6();
  print(IZONE.name); // 게터
  IZONE.name = '아이즈원'; //세터
  print(IZONE.name); //게터

  //Inheritance
  BoyGroup EXO = BoyGroup('EXO', 8);
  EXO.sayName();
  EXO.sayMembersCount();
  EXO.sayName();

  //Override
  GirlGroup GIDLE = GirlGroup('GIDLE', 5);
  GIDLE.sayName();
  GIDLE.sayMembersCount();

  //Interface
  CoedGroup coyote = CoedGroup('coyote', 3);
  coyote.sayName();
  coyote.sayMembersCount();

  //Mixin
  BoyGroup2 TwoPM = BoyGroup2('2PM', 6);
  TwoPM.sing();

  //abstract
  GirlGroup2 Apink = GirlGroup2('Apink', 5);
  Apink.sayName();
  Apink.sayMembersCount();

  //Generic
  // T 타입을 List<int>로 사용
  final cache = Cache<List<int>>(
    data: [1,2,3],
  );
  print(cache.data.reduce((value,element) => value + element));

  //Static
  Counter count1 = Counter();
  Counter count2 = Counter();
  Counter count3 = Counter();

  //Cascade Operator
  Idol7 GirlsDay = Idol7('GirlsDay', 4)
    ..sayName()
    ..sayMembersCount();
}
