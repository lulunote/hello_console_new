// my_dart_test.dart

// 1.导入必要的库
import 'dart:async';

void main(List<String> arguments) {
  print('=== Dart Language Features Demo ===\n');
  // 2. Hello World示例
  helloWorldDemo();
  // 3. 变量和控制流示例
  variablesDemo();
  // 4. 函数示例
  functionsDemo();
  // 5. 注释示例
  commentsDemo();
  // 6. 导入示例
  importsDemo();
  // 7. 类示例
  classesDemo();
  // 8. 枚举示例
  enumsDemo();
  // 9. 继承示例
  inheritanceDemo();
  // 10. Mixins示例
  mixinsDemo();
  // 11. 接口和抽象类示例
  interfacesDemo();
  // 12. 异步示例
  asyncDemo();
  // 13. 异常处理示例
  exceptionsDemo();
}

// https://dart.cn/language/#hello-world
// 1. Hello World示例
void helloWorldDemo() {
  print('\n=== 1. Hello World Example:===');
  print('Hello, World!\n');
}

// https://dart.cn/language/#variables
// https://dart.cn/language/#control-flow-statements
// 2. 变量和控制流示例
void variablesDemo() {
  print('\n=== 2. Variables & Control Flow ===');
  var name = 'Voyager I';
  var year = 1977;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];

  print('Name: $name, Year: $year');

  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  for (final object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }
  print('Final year: $year');
}

// https://dart.cn/language/#functions
// 3. 函数示例
void functionsDemo() {
  print('\n=== 3. Functions: ===');

  // 递归斐波那契函数
  int fibonacci(int n) {
    if (n == 0 || n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  var result = fibonacci(10); // 较小的数字
  print('Fibonacci(10): $result');

  // 匿名函数，将顶层函数 print() 作为参数传给了 forEach() 函数
  var planets = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  print('Planets containing "urn":');
  planets.where((name) => name.contains('urn')).forEach(print);

  print('');
}

// https://dart.cn/language/#comments
// 4. 注释示例
void commentsDemo() {
  print('\n=== 4. Comments: ===');

  // 这是一个单行注释
  print('单行注释使用 //');

  /// 这是一个文档注释
  /// 用于生成文档
  print('文档注释使用 ///');

  /*
  这是一个多行注释
  可以跨越多行
  */
  print('多行注释使用 /* */');

  print('');
}

// https://dart.cn/language/#imports
// 5. 导入示例
void importsDemo() {
  print('\n=== 5. Imports: ===');
  print('导入语句通常在文件顶部，如:');
  print('  import \'dart:math\'; // 核心库');
  print('  import \'package:test/test.dart\'; // 包库');
  print('  import \'path/to/file.dart\'; // 本地文件');
  print('');
}

// https://dart.cn/language/#classes
// 6. 类示例
void classesDemo() {
  print('\n=== 6. Classes: ===');

  // 主构造函数创建实例，传入名称和发射日期
  final voyager1 = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager1.describe(); //调用

  // unlaunched命名构造函数创建未发射的航天器实例
  final voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();

  // getter属性访问，打印Voyager I的发射年份(通过launchYear getter)
  print('\nLaunch year of Voyager I: ${voyager1.launchYear}');
  print('Launch year of Voyager III: ${voyager3.launchYear}'); //未发射为null

  // 名称属性修改
  voyager1.name = 'Voyager 1 (Updated)';
  print('\nAfter name change:');
  voyager1.describe();

  print('');
}

// 航天器类定义
class Spacecraft {
  String name;
  DateTime? launchDate; // 可空的成员变量：发射日期

  // 只读的非final属性（通过getter实现）
  // 定义launchYear getter，返回发射年份(可能为null)
  int? get launchYear => launchDate?.year;

  // 主构造函数，将参数赋值给成员变量
  Spacecraft(this.name, this.launchDate) {
    // 可以在这里添加初始化代码
    print('Spacecraft $name instance created');
  }

  // 命名构造函数，转发到主构造函数
  // 用于创建未发射的航天器，将launchDate设为null
  Spacecraft.unlaunched(String name) : this(name, null);

  // 描述方法
  void describe() {
    print('Spacecraft: $name');
    // 类型提升对getter无效，所以需要局部变量
    var launchDate = this.launchDate;
    if (launchDate != null) {
      // 计算从发射至今的年数
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print(' - Launched: $launchYear ($years years ago)');
    } else {
      print(' - Unlaunched');
    }
  }
}

// https://dart.cn/language/#enums
// 7. 枚举示例
//枚举类型的取值范围是一组预定义的值或实例
void enumsDemo() {
  print('\n=== 7. Enums: ===');

  // 枚举定义，定义一个常量枚举值，设置为地球
  const yourPlanet = Planet.earth;
  print('Your planet is ${yourPlanet.name}');
  print(' - Type: ${yourPlanet.planetType}');
  print(' - Moons: ${yourPlanet.moons}');
  print(' - Has rings: ${yourPlanet.hasRings}');
  print(' - Is giant planet: ${yourPlanet.isGiant}');

  print('');
}

// 枚举类型移到外部定义，定义行星类型的枚举(类地行星、气态行星、冰巨星)
enum PlanetType { terrestrial, gas, ice }

//一组行星类的常量实例，即太阳系的行星
enum Planet {
  mercury(
    planetType: PlanetType.terrestrial,
    moons: 0,
    hasRings: false,
  ), //水星: 类地行星，0个卫星，无行星环
  venus(planetType: PlanetType.terrestrial, moons: 0, hasRings: false), // 金星
  earth(planetType: PlanetType.terrestrial, moons: 1, hasRings: false), //地球
  mars(planetType: PlanetType.terrestrial, moons: 2, hasRings: false), //火星
  jupiter(planetType: PlanetType.gas, moons: 79, hasRings: true), //木星
  saturn(planetType: PlanetType.gas, moons: 82, hasRings: true), //土星
  uranus(planetType: PlanetType.ice, moons: 27, hasRings: true), //天王星
  neptune(planetType: PlanetType.ice, moons: 14, hasRings: true);

  // 枚举实例的字段定义
  // 行星类型字段
  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  const Planet({
    required this.planetType,
    required this.moons,
    required this.hasRings,
  });

  // 判断是否是巨型行星(气态行星或冰巨星)
  bool get isGiant =>
      planetType == PlanetType.gas || planetType == PlanetType.ice;
}

// https://dart.cn/language/#inheritance
// 8. 继承示例
class Orbiter extends Spacecraft {
  // 新增属性：轨道高度(单位：公里)
  double altitude;
  // 构造函数
  // 使用super语法直接传递name和launchDate给父类构造函数
  // 同时接收altitude参数并赋值给当前类的属性
  Orbiter(super.name, DateTime super.launchDate, this.altitude);
}

// 创建Orbiter类实例
// - 名称: Hubble (哈勃望远镜)
// - 发射日期: 1990年4月24日
// - 轨道高度: 540公里
void inheritanceDemo() {
  print('\n=== 8. inheritance ===');
  var orbiter = Orbiter('Hubble', DateTime(1990, 4, 24), 540.0);
  print('${orbiter.name} at ${orbiter.altitude}km');
}

// https://dart.cn/language/#mixins
// 9. Mixins示例
//在多个类层次结构中重用代码
mixin Piloted {
  int astronauts = 1;
  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

//使用 Mixin 的方式继承这个类就可将该类中的功能添加给其它类
class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(super.name, super.launchDate);
}

void mixinsDemo() {
  print('\n=== 9. Mixins ===');
  var craft = PilotedCraft('Apollo 11', DateTime(1969, 7, 16));
  craft.describeCrew();
}

// https://dart.cn/language/#interfaces-and-abstract-classes
// 10. 接口和抽象类示例
void interfacesDemo() {
  print('\n=== 10. Interfaces & Abstract Classes: ===');

  final voyager = SpacecraftImpl('Voyager I');
  voyager.describeWithEmphasis();

  print('');
}

// 抽象类
abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}

// 实现类
class SpacecraftImpl implements Describable {
  final String name;

  SpacecraftImpl(this.name);

  @override
  void describe() {
    print('Spacecraft: $name');
  }

  @override
  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}

// https://dart.cn/language/#async
// 11. 异步示例
void asyncDemo() {
  print('\n=== 11. Async: ===');

  Future<void> printWithDelay(String message) async {
    print('Waiting for 1 second...');
    await Future.delayed(Duration(seconds: 1));
    print(message);
  }

  print('Before delayed message');
  printWithDelay('Hello after delay!');

  // 注意：由于异步特性，这条消息可能会在延迟消息前打印
  print('After calling delayed message (may appear before delay)');

  // 添加额外延迟以确保输出顺序正确
  Future.delayed(Duration(seconds: 2), () {
    print('');
  });
}

// https://dart.cn/language/#exceptions
// 12. 异常处理示例
void exceptionsDemo() {
  print('\n=== 12. Exceptions: ===');

  try {
    var astronauts = 0;
    if (astronauts == 0) {
      throw StateError('No astronauts available.');
    }
    print('Astronauts count: $astronauts');
  } on StateError catch (e) {
    print('Caught StateError: $e');
  } catch (e) {
    print('Caught general exception: $e');
  } finally {
    print('Cleanup completed');
  }

  print('\n=== All demos completed ===');
}
