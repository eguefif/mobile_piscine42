// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:ex03/models/expression.dart';
import 'package:test/test.dart';

void main() {
  group('Test expression models', () {
    test("update with one value", () {
      Expression exp = Expression();

      exp.update("5");
      expect(exp.expression, "5");
    });

    test("update with two values", (){
      Expression exp = Expression();

      exp.update("5");
      exp.update("+");
      expect(exp.expression, "5+");
    });
    
    test("update with fll possible values", () {
      Expression exp = Expression();

      exp.update("1");
      exp.update("2");
      exp.update("3");
      exp.update("+");
      exp.update("5");
      exp.update(".");
      exp.update("6");
      exp.update("7");
      exp.update("-");
      exp.update("8");
      exp.update("*");
      exp.update("9");
      exp.update("/");
      exp.update("1");
      exp.update("0");
      exp.update("00");
      expect(exp.expression, "123+5.67-8*9/1000");
    });

    test("type 00 when expression = 0", () {
      Expression exp = Expression();

      exp.update("00");
      expect(exp.expression, "0");
    });

    test("AC button test with no value", () {
      Expression exp = Expression();

      exp.update("AC");
      expect(exp.expression, "0");
      expect(exp.result, "0");
    });


    test("AC button test", () {
      Expression exp = Expression();

      exp.update("1");
      exp.update("2");
      exp.update("3");
      exp.update("AC");
      expect(exp.expression, "0");
      expect(exp.result, "0");
    });

    test("C button test one time", () {
      Expression exp = Expression();

      exp.update("1");
      exp.update("2");
      exp.update("3");
      exp.update("C");
      expect(exp.expression, "12");
    });

    test("C button test one time with one value", () {
      Expression exp = Expression();

      exp.update("1");
      exp.update("C");
      expect(exp.expression, "0");
    });

    test("C button test two time", () {
      Expression exp = Expression();

      exp.update("1");
      exp.update("2");
      exp.update("-");
      exp.update("3");
      exp.update("+");
      exp.update("C");
      exp.update("C");
      expect(exp.expression, "12-");
    });

    test("C button test two time update two times and C one time", () {
      Expression exp = Expression();

      exp.update("1");
      exp.update("2");
      exp.update("-");
      exp.update("3");
      exp.update("+");
      exp.update("C");
      exp.update("C");
      exp.update("8");
      exp.update("0");
      exp.update("C");
      expect(exp.expression, "12-8");
    });
  });
  group("Valid calculation test", () {
    test("Two single digit members single digit result operation +", () {
      Expression exp = Expression();

      exp.update("5");
      exp.update("+");
      exp.update("3");
      exp.update("=");
      expect(exp.result, "8");
    });

    test("Two single digit members two digits result operation +", () {
      Expression exp = Expression();

      exp.update("5");
      exp.update("+");
      exp.update("8");
      exp.update("=");
      expect(exp.result, "13");
    });
  });
}
