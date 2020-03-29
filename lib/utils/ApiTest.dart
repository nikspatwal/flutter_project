import 'dart:core';

/*
typedef dynamic OnCall(List l);

class VarargsFunction extends Function{
  OnCall _onCall;

  VarargsFunction(this._onCall);

  call() => _onCall([]);


  noSuchMethod(Invocation invocation) {
    final arguments = invocation.positionalArguments;
    return _onCall(arguments);
  }
}

*/
/*class A {
  final myMethod = new VarargsFunction((arguments) => print(arguments));*//*



main(){
  final trips = new VarargsFunction((arguments){
    for (final trip in arguments){
      print("This is ${trip}");
    }
  });
  trips('Uber','Ola','Rapido');
}
*/

/*
class Person {
  @override  //overring noSuchMethod
  noSuchMethod(Invocation invocation) => 'Got the ${invocation.memberName} with arguments ${invocation.positionalArguments}';
}

main(List<String> args) {
  dynamic person = new Person(); // person is declared dynamic hence staifies the first point
  print(person.missing('20','shubham'));  //We are calling an unimplemented method called 'missing'
}*/


typedef T VarArgsCallback<T>(List<dynamic> args, Map<String, dynamic> kwargs);

class VarArgsFunction<T> {
  final VarArgsCallback<T> callback;
  static var _offset = 'Symbol("'.length;

  VarArgsFunction(this.callback);

  T call() => callback([], {});

  @override
  dynamic noSuchMethod(Invocation inv) {
    return callback(
      inv.positionalArguments,
      inv.namedArguments.map(
            (_k, v) {
          var k = _k.toString();
          return MapEntry(k.substring(_offset, k.length - 2), v);
        },
      ),
    );
  }
}

main() {
  dynamic myFunc = VarArgsFunction((args, kwargs) {
    print('Got args: $args, kwargs: $kwargs');
  });
  myFunc(1, 2, x: true, y: false); // Got args: [1, 2], kwargs: {x: true, y: false}
}