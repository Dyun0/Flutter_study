//https://dartpad.dev/

// ignore_for_file: unused_local_variable, equal_elements_in_set

typedef Operation = int Function(int x, int y);
void main(){
// 주석은
/* 3가지가 
*/
/// 있어

// var 변수는 쓰면 타입 자동 정해짐. 단 첫 타입 유지됨
var name = 'potato';

// dynamic 변수는 타입을 바꿀 수 있찌요~
dynamic name2 = 'sweetpotato';
name2 = 1 ;

// final와 const 변수는 이후에 변경 불가
// final는 런타임 상수, const은 빌드타임 상수
final constant = 1;
const constant2 = 3 ;

//물론 직접적으로 변수타입 지정 가능
String name3 = 'string';
int number = 1;
double doubble = 2.5;
bool condition = true ; // true false

// 리스트 타입은 <>에 적기
List<String> fruit = ['berry', 'grape'];
fruit[0] = 'banana';
print(fruit[0]);

// 리스트 value 추가
fruit.add('apple');

// 리스트 내 조건 통과 값 조회, iterable 형태로 반환
final sweet_fruit = fruit.where((sweet) => sweet =='berry' || sweet =='apple');
print(sweet_fruit);

// 리스트 순회 반복문, iterable 형태로 반환
final good_fruit = fruit.map((good) => 'good $good');
print(good_fruit);
print(good_fruit.toList());

// 리스트 순회함. 처음엔 value에 [0] element에 [1]이 옴. 이후로는 계산식 값이 value, [2]가 element로 오며 순회
// 계산식 값이 리스트 타입과 같아야함
final list_fruit = fruit.reduce((value, element) => value+', '+element);
print(list_fruit);

// 리스트 순회함. 처음엔 value에 [0] element에 [1]이 옴. 이후로는 계산식 값이 value, [2]가 element로 오며 순회
// fold<출력타입>
// 계산식 값이 리스트 타입과 달라도 됨, 아래 식에 0을 입력하면 value의 초기값으로 들어감.
final length_fruit = fruit.fold<int>(0, (value, element) => value + element.length);
print(length_fruit);


//Map 타입 - 파이썬의 딕셔너리
Map<String, String> dictionary = {
  'peach' : 'good',
  'cherry' : 'bad'
};
print(dictionary['peach']);

//keys와 values는 키와 밸류를 iterable 타입으로 반환
print(dictionary.keys);
print(dictionary.values);


//Set 타입 - 중복 없는 집합
Set<int> number2 = {3, 5, 6, 8, 3, 8};

// 값 확인
print(number2.contains(3));
print(number2.contains(9));

//리스트로 바꾸는법, 셋으로 바꾸는법
print(Set.from(number2.toList()));

// 변수의 값을 여러개로 제한
// enum Status {
//   good,
//   bad,
//   notBad,
// }
// Status status = Status.good;
// print(status);

//연산자 +, -, *, /, %, ++, --, +=, -=, *=, /=

//타입 지정시 ?를 넣으면 null 값을 갖는 변수로 만들 수 있음.
double? dooble = null;
//자동으로 널 값
double? dooble2;
// 기존 변수의 값이 null일때만 저장
dooble2 ??= 3;
print(dooble2);
dooble2 ??= 4;
print(dooble2);

// 값 비교 연산자
// > < >= <= == !=

//타입 비교 연산자
int number3 = 3;
print(number3 is int);
print(number3 is! int);

//논리 연산자 and: &&, or: ||

//조건문
if (number3 ==1){
  print('good');
}else if (number3 == 3){
  print('notbad');
}else{
  print('bad');
}

switch (number3){
  case 1:
    print('good');
    break;
  case 2:
    print('notbad');
    break;

  case 3:
    print('bad');
    break;

  default:
    print('XD');
}

//반복문
for (int i = 0; i < 5 ; i++){
  print(i);
}

for (String fruuit in fruit){
  print(fruuit);
}

var sum = 0;
while(sum < 10){
  print(sum);
  sum += 1;
}
do{
  print(sum);
  sum += 1;
}while(sum<20);

//일반적인함수 
int addTwoNumbers(int a, int b){
  return a+b;
}
print(addTwoNumbers(1,2));
//네임드 파라미터 함수 - 순서 상관없이 이름 지정해서 삽입 가능
int addTwoNumbers2({
  required int a,
  required int b,
  }){
  return (a*2)+b;
}
print(addTwoNumbers2(b : 1,a: 2));

//기본값 지정 함수
int addTwoNumbers3(int a, [int b = 5]){
  return a+b;
}
print(addTwoNumbers3(3));

//네임드와 기본값 한번에
int addTwoNumbers4({
  required int a,
  int b = 2,
  }){
  return a+b;
}
print(addTwoNumbers4(a: 2));

// 혼합 키메라
int addTwoNumbers5(
  int a,{
  required int b,
  int c = 4}){
  return a+b+c;
}
print(addTwoNumbers5(1, b:5));

//익명함수와 람다함수 . 거의 같은 영역  일회용 함수로 이해하기
List<int> numbers = [1, 2, 3, 4, 5];
final allMembers = numbers.reduce((value, element){
  return value + element;
});
print(allMembers);

final allMembers2 = numbers.reduce((value, element) => value + element);
print(allMembers2);

//typedef 함수 시그니처 선언용 -> 아직은 잘 모르겠찌만 어디 쓰이겠찡
// 첫줄에 선언해둠 미리 형틀을 잡아놓는 느낌?
Operation oper = addTwoNumbers;
print(oper(1,2));

// dart에서는 함수를 값처럼 사용 가능
void calculate(int x, int y, Operation oper){
  print(oper(x,y));
}
calculate(3,5,addTwoNumbers);

//try catch는 당연히 있음.
try{
  print('qwe');
}catch(e){
  print(e);
}

}