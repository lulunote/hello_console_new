// 1. Hello World 示例
void main(List<String> arguments) {
  print('Hello, World!');

  myVariables();
  myFunctionsDemo();
  myCommentsDemo();
  myImportsDemo();
  myClassesDemo();
  myEnumsDemo();
  myInheritanceDemo();
  myMixinsDemo();
  myInterfacesDemo();
  myAsyncDemo();
  myExceptionsDemo();
}

// https://dart.cn/language/#variables
// https://dart.cn/language/#control-flow-statements
// 2. 变量和流程控制示例
void myVariables() {
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
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void myFunctionsDemo() {
  print('\n=== 3. Functions ===');
  var result = fibonacci(5); // 改为5避免长时间计算
  print('Fibonacci(5): $result');

  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  flybyObjects.where((name) => name.contains('turn')).forEach(print);
}

// https://dart.cn/language/#comments
// 4. 注释示例
void myCommentsDemo() {
  print('\n=== 4. Comments ===');
  // 单行注释
  print('See source code for comments examples');
}

// https://dart.cn/language/#imports
// 5. 导入示例
void myImportsDemo() {
  print('\n=== 5. Imports ===');
  print('Imports are typically declared at the top of the file');
}

//https://dart.cn/language/#classes
// 6. 类示例
class Spacecraft {
  String name;
  DateTime? launchDate;
  int? get launchYear => launchDate?.year;

  Spacecraft(this.name, this.launchDate);
  Spacecraft.unlaunched(String name) : this(name, null);

  void describe() {
    print('Spacecraft: $name');
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate!).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

void myClassesDemo() {
  print('\n=== 6. Classes ===');
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();
}

// https://dart.cn/language/#enums
// 7. 枚举示例
enum PlanetType { terrestrial, gas, ice }

enum Planet {
  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  earth(planetType: PlanetType.terrestrial, moons: 1, hasRings: false),
  neptune(planetType: PlanetType.ice, moons: 14, hasRings: true);

  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  const Planet({
    required this.planetType,
    required this.moons,
    required this.hasRings,
  });

  bool get isGiant =>
      planetType == PlanetType.gas || planetType == PlanetType.ice;
}

void myEnumsDemo() {
  print('\n=== 7. Enums ===');
  final yourPlanet = Planet.earth;
  if (!yourPlanet.isGiant) {
    print('${yourPlanet.name} is not a "giant planet"');
  }
}

// https://dart.cn/language/#inheritance
// 8. 继承示例
class Orbiter extends Spacecraft {
  double altitude;
  Orbiter(super.name, DateTime super.launchDate, this.altitude);
}

void myInheritanceDemo() {
  print('\n=== 8. Inheritance ===');
  var orbiter = Orbiter('Hubble', DateTime(1990, 4, 24), 540.0);
  print('${orbiter.name} at ${orbiter.altitude}km');
}

// https://dart.cn/language/#mixins
// 9. Mixins示例
mixin Piloted {
  int astronauts = 1;
  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(super.name, super.launchDate);
}

void myMixinsDemo() {
  print('\n=== 9. Mixins ===');
  var craft = PilotedCraft('Apollo 11', DateTime(1969, 7, 16));
  craft.describeCrew();
}

// https://dart.cn/language/#interfaces-and-abstract-classes
// 10. 接口和抽象类示例
abstract class Describable {
  void describe();
  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}

class MockSpaceship implements Spacecraft {
  @override
  String name;

  @override
  DateTime? launchDate;

  MockSpaceship(this.name, this.launchDate);

  @override
  int? get launchYear => launchDate?.year;

  @override
  void describe() {
    print('Mock Spacecraft: $name');
  }
}

void myInterfacesDemo() {
  print('\n=== 10. Interfaces ===');
  var mock = MockSpaceship('Mock Ship', null);
  mock.describe();
}

// https://dart.cn/language/#async
// 11. 异步示例
void myAsyncDemo() {
  print('\n=== 11. Async ===');
  Future<void> printWithDelay(String message) async {
    await Future.delayed(Duration(milliseconds: 500));
    print(message);
  }

  print('Start');
  printWithDelay('Delayed message');
  print('End');
}

// https://dart.cn/language/#exceptions
// 12. 异常处理示例
void myExceptionsDemo() {
  print('\n=== 12. Exceptions ===');
  try {
    throw StateError('Sample error');
  } on StateError catch (e) {
    print('Caught error: $e');
  } finally {
    print('Cleanup complete');
  }
}
