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

    test("update with two values", () {
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

    test("5*100", () {
      Expression exp = Expression();

      exp.update("5");
      exp.update("*");
      exp.update("1");
      exp.update("00");
      exp.update("=");
      expect(exp.result, (5 * 100).toString());
    });
    test("5+99-33.2*100", () {
      Expression exp = Expression();

      exp.update("5");
      exp.update("+");
      exp.update("9");
      exp.update("5");
      exp.update("-");
      exp.update("9");
      exp.update("9");
      exp.update("-");
      exp.update("3");
      exp.update("3");
      exp.update(".");
      exp.update("2");
      exp.update("*");
      exp.update("1");
      exp.update("00");
      exp.update("=");
      expect(exp.result, (5+95-99-33.2*100).toString());
    });
    test("starting with a +", () {
      Expression exp = Expression();

      exp.update("+");
      exp.update("5");
      exp.update("+");
      exp.update("3");
      exp.update("=");
      expect(exp.result, "8");
    });
    test("one number", () {
      Expression exp = Expression();

      exp.update("3");
      exp.update("=");
      expect(exp.result, "3");
    });

    test("one number starting with +", () {
      Expression exp = Expression();

      exp.update("+");
      exp.update("3");
      exp.update("=");
      expect(exp.result, "3");
    });

    test("one number starting with -", () {
      Expression exp = Expression();

      exp.update("-");
      exp.update("1");
      exp.update("2");
      exp.update("3");
      exp.update("=");
      expect(exp.result, "-123");
    });

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

    test("Two single digit members single digit result operation -", () {
      Expression exp = Expression();

      exp.update("5");
      exp.update("-");
      exp.update("3");
      exp.update("=");
      expect(exp.result, "2");
    });

    test("two digit and one digit members two digits result operation -", () {
      Expression exp = Expression();

      exp.update("1");
      exp.update("8");
      exp.update("-");
      exp.update("3");
      exp.update("=");
      expect(exp.result, "15");
    });

    test("one digit and two digit members negative result operation -", () {
      Expression exp = Expression();

      exp.update("1");
      exp.update("-");
      exp.update("1");
      exp.update("3");
      exp.update("=");
      expect(exp.result, "-12");
    });

    test("Two single digit members result operation *", () {
      Expression exp = Expression();

      exp.update("5");
      exp.update("*");
      exp.update("3");
      exp.update("=");
      expect(exp.result, "15");
    });

    test("single digit and two digits members result operation *", () {
      Expression exp = Expression();

      exp.update("5");
      exp.update("*");
      exp.update("3");
      exp.update("9");
      exp.update("=");
      expect(exp.result, (5 * 39).toString());
    });

    test("single digit and two digits members negative result operation *", () {
      Expression exp = Expression();

      exp.update("5");
      exp.update("*");
      exp.update("-");
      exp.update("9");
      exp.update("=");
      expect(exp.result, (5 * -9).toString());
    });

    test("single digit and two digits negative members result operation *", () {
      Expression exp = Expression();

      exp.update("-");
      exp.update("5");
      exp.update("*");
      exp.update("-");
      exp.update("9");
      exp.update("8");
      exp.update("=");
      expect(exp.result, (-5 * -98).toString());
    });

    test("multiple operations with + and -", () {
      Expression exp = Expression();

      exp.update("-");
      exp.update("5");
      exp.update("+");
      exp.update("-");
      exp.update("9");
      exp.update("8");
      exp.update("-");
      exp.update("1");
      exp.update("8");
      exp.update("-");
      exp.update("1");
      exp.update("+");
      exp.update("2");
      exp.update("1");
      exp.update("9");
      exp.update("=");
      expect(exp.result, (-5 + -98 - 18 - 1 + 219).toString());
    });

    test("multiple operations", () {
      Expression exp = Expression();

      exp.update("-");
      exp.update("5");
      exp.update("*");
      exp.update("-");
      exp.update("9");
      exp.update("8");
      exp.update("-");
      exp.update("1");
      exp.update("8");
      exp.update("/");
      exp.update("1");
      exp.update("5");
      exp.update("+");
      exp.update("2");
      exp.update("1");
      exp.update("9");
      exp.update("=");
      expect(exp.result, (-5 * -98 - 18 / 15 + 219).toString());
    });

    test("multiple operations with decimal", () {
      Expression exp = Expression();

      exp.update("-");
      exp.update("5");
      exp.update("1");
      exp.update(".");
      exp.update("8");
      exp.update("2");
      exp.update("*");
      exp.update("-");
      exp.update("9");
      exp.update("8");
      exp.update("-");
      exp.update("1");
      exp.update(".");
      exp.update("8");
      exp.update("/");
      exp.update("1");
      exp.update("5");
      exp.update("+");
      exp.update("2");
      exp.update("1");
      exp.update("9");
      exp.update("=");
      expect(exp.result, (-51.82 * -98 - 1.8 / 15 + 219).toString());
    });

    test("multiple operations with decimal and use of C thre times", () {
      Expression exp = Expression();

      exp.update("-");
      exp.update("5");
      exp.update("1");
      exp.update(".");
      exp.update("8");
      exp.update("2");
      exp.update("*");
      exp.update("-");
      exp.update("9");
      exp.update("8");
      exp.update("-");
      exp.update("1");
      exp.update("C");
      exp.update("C");
      exp.update("-");
      exp.update("1");
      exp.update(".");
      exp.update("8");
      exp.update("/");
      exp.update("C");
      exp.update("/");
      exp.update("1");
      exp.update("5");
      exp.update("+");
      exp.update("C");
      exp.update("+");
      exp.update("C");
      exp.update("+");
      exp.update("2");
      exp.update("1");
      exp.update("9");
      exp.update("=");
      expect(exp.result, (-51.82 * -98 - 1.8 / 15 + 219).toString());
    });
  });

  group("Invalid calculation", () {
    test("missing the last number", (){
      Expression exp = Expression();
      exp.update("7");
      exp.update("+");
      exp.update("=");
      expect(exp.result, "Invalid input");
    });
    test("two operations in a row +*", (){
      Expression exp = Expression();
      exp.update("7");
      exp.update("+");
      exp.update("*");
      exp.update("7");
      exp.update("=");
      expect(exp.result, "Invalid input");
    });

    test("two operations in a row -*", (){
      Expression exp = Expression();
      exp.update("7");
      exp.update("-");
      exp.update("*");
      exp.update("7");
      exp.update("=");
      expect(exp.result, "Invalid input");
    });
    test("two operations in a row -*", (){
      Expression exp = Expression();
      exp.update("7");
      exp.update("-");
      exp.update("*");
      exp.update("7");
      exp.update("=");
      expect(exp.result, "Invalid input");
    });

    test("two operations in a row /*", (){
      Expression exp = Expression();
      exp.update("7");
      exp.update("/");
      exp.update("*");
      exp.update("7");
      exp.update("=");
      expect(exp.result, "Invalid input");
    });

    test("Three operations in a row /+*", (){
      Expression exp = Expression();
      exp.update("7");
      exp.update("/");
      exp.update("+");
      exp.update("*");
      exp.update("7");
      exp.update("=");
      expect(exp.result, "Invalid input");
    });

    test("Three operations in a row -+*", (){
      Expression exp = Expression();
      exp.update("7");
      exp.update("-");
      exp.update("+");
      exp.update("*");
      exp.update("7");
      exp.update("=");
      expect(exp.result, "Invalid input");
    });

    test("Three operations in a row -+-", (){
      Expression exp = Expression();
      exp.update("7");
      exp.update("-");
      exp.update("+");
      exp.update("*");
      exp.update("7");
      exp.update("=");
      expect(exp.result, "Invalid input");
    });
  });
}
