import 'dart:math' as math; // 导入math库并添加别名

void main() {
  demonstrateClassMembers(); // 演示类成员的使用
  demonstrateConstructors(); // 演示构造函数的各种用法
  demonstrateObjectType(); // 演示获取对象类型
  demonstrateInstanceVariables(); // 演示实例变量
  demonstrateImplicitInterfaces(); // 演示隐式接口
  demonstrateStaticMembers(); // 演示静态成员
}

// 1. 类成员
void demonstrateClassMembers() {
  print('=== 类成员演示 ===');
  var p = Point(2, 2); // 创建Point对象

  // 访问实例变量
  print('y的值: ${p.y}');

  // 调用方法
  double distance = p.distanceTo(Point(4, 4));
  print('到(4,4)的距离: $distance');

  // 空安全访问
  Point? p2; // 声明可为空的Point对象
  var yValue = p2?.y; // 安全访问操作
  print('空安全访问结果: $yValue');
}

// 2. 构造函数
void demonstrateConstructors() {
  print('\n=== 构造函数演示 ===');
  // 普通构造函数
  var p1 = Point(2, 2);
  print('普通构造函数: (${p1.x}, ${p1.y})');

  // 命名构造函数
  var p2 = Point.fromJson({'x': 1, 'y': 2});
  print('命名构造函数: (${p2.x}, ${p2.y})');

  // 常量构造函数
  var a = const ImmutablePoint(1, 1);
  var b = const ImmutablePoint(1, 1);
  print('相同的常量实例: ${identical(a, b)}'); // 应为true

  // 非常量实例
  var c = ImmutablePoint(1, 1);
  print('非常量实例不同: ${!identical(a, c)}'); // 应为true
}

// 3. 获取对象
void demonstrateObjectType() {
  print('\n=== 对象类型演示 ===');
  var point = Point(1, 1);
  print('运行时类型: ${point.runtimeType}');

  // 类型检查推荐方式
  if (point is Point) {
    print('使用is运算符: 这是一个Point对象');
  }
}

// 4. 实例变量
void demonstrateInstanceVariables() {
  print('\n=== 实例变量演示 ===');
  var point = Point(3, 4);
  print('初始值: (${point.x}, ${point.y})');

  point.x = 5; // 修改实例变量
  print('修改后: (${point.x}, ${point.y})');

  var profile = ProfileMark('测试');
  print('标记名称: ${profile.name} 创建时间: ${profile.start}');
}

// 5. 隐式接口
void demonstrateImplicitInterfaces() {
  print('\n=== 隐式接口演示 ===');
  print(greetBob(Person('张三'))); // 正常Person对象
  print(greetBob(Impostor())); // 实现Person接口的对象
}

// 6. 静态成员
void demonstrateStaticMembers() {
  print('\n=== 静态成员演示 ===');
  print('队列初始容量: ${Queue.initialCapacity}'); // 访问静态常量

  var a = Point(2, 2);
  var b = Point(4, 4);
  var distance = Point.distanceBetween(a, b); // 调用静态方法
  print('两点间距离: $distance');
}

// 支持类和函数

// Point类
class Point {
  double? x;
  double? y;

  Point(this.x, this.y);

  Point.fromJson(Map<String, double> json) : x = json['x'], y = json['y'];

  // 使用math.sqrt函数
  double distanceTo(Point other) {
    var dx = x! - other.x!;
    var dy = y! - other.y!;
    return math.sqrt(dx * dx + dy * dy);
  }

  // 使用math.sqrt函数
  static double distanceBetween(Point a, Point b) {
    var dx = a.x! - b.x!;
    var dy = a.y! - b.y!;
    return math.sqrt(dx * dx + dy * dy);
  }
}

// 不可变Point类，常量构造函数
class ImmutablePoint {
  final double x; // final实例变量
  final double y;

  const ImmutablePoint(this.x, this.y); // 常量构造函数
}

// 个人资料标记类，final变量初始化
class ProfileMark {
  final String name; // final变量
  final DateTime start = DateTime.now(); // 初始化时间

  ProfileMark(this.name); // 主构造函数
  ProfileMark.unnamed() : name = ''; // 命名构造函数
}

// Person类，隐式接口
class Person {
  final String _name; // 私有变量

  Person(this._name);

  String greet(String who) => '你好，$who。我是$_name。';
}

// 冒名者类，Person接口
class Impostor implements Person {
  String get _name => ''; // 实现接口要求的getter

  String greet(String who) => '嗨$who。你知道我是谁吗？';
}

// 通用问候函数
String greetBob(Person person) => person.greet('Bob');

// 队列类，演示静态成员
class Queue {
  static const initialCapacity = 16; // 静态常量
}

// 扩展方法，为num添加sqrt属性
extension NumExtensions on num {
  double get sqrt => math.sqrt(this); // 使用math.sqrt
}
