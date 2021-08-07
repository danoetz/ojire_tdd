// Mocks generated by Mockito 5.0.13 from annotations
// in ojire_tdd/test/test_mockito.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;

import 'test_mockito.dart' as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [Cat].
///
/// See the documentation for Mockito's code generation for more information.
class MockCat extends _i1.Mock implements _i2.Cat {
  MockCat() {
    _i1.throwOnMissingStub(this);
  }

  @override
  int get lives =>
      (super.noSuchMethod(Invocation.getter(#lives), returnValue: 0) as int);
  @override
  set lives(int? _lives) =>
      super.noSuchMethod(Invocation.setter(#lives, _lives),
          returnValueForMissingStub: null);
  @override
  _i3.Future<void> chew() => (super.noSuchMethod(Invocation.method(#chew, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  void sleep() => super.noSuchMethod(Invocation.method(#sleep, []),
      returnValueForMissingStub: null);
  @override
  void hunt(String? place, String? prey) =>
      super.noSuchMethod(Invocation.method(#hunt, [place, prey]),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}

/// A class which mocks [Cat].
///
/// See the documentation for Mockito's code generation for more information.
class MockCatRelaxed extends _i1.Mock implements _i2.Cat {
  @override
  int get lives =>
      (super.noSuchMethod(Invocation.getter(#lives), returnValue: 0) as int);
  @override
  set lives(int? _lives) =>
      super.noSuchMethod(Invocation.setter(#lives, _lives),
          returnValueForMissingStub: null);
  @override
  _i3.Future<void> chew() => (super.noSuchMethod(Invocation.method(#chew, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  void sleep() => super.noSuchMethod(Invocation.method(#sleep, []),
      returnValueForMissingStub: null);
  @override
  void hunt(String? place, String? prey) =>
      super.noSuchMethod(Invocation.method(#hunt, [place, prey]),
          returnValueForMissingStub: null);
  @override
  String toString() => super.toString();
}
