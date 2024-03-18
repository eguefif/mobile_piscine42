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
    
    test("5*3/4", () {
      Expression exp = Expression();

      exp.update("5");
      exp.update("*");
      exp.update("3");
      exp.update("/");
      exp.update("4");
      exp.update("=");
      expect(exp.result, (5*3/4).toString());;
    });

    test("5*3/4*2*3/5", () {
      Expression exp = Expression();

      exp.update("5");
      exp.update("*");
      exp.update("3");
      exp.update("/");
      exp.update("4");
      exp.update("*");
      exp.update("2");
      exp.update("*");
      exp.update("3");
      exp.update("/");
      exp.update("5");
      exp.update("=");
      expect(exp.result, (5*3/4*2*3/5).toString());;
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
    test("+5+3", () {
      Expression exp = Expression();

      exp.update("+");
      exp.update("5");
      exp.update("+");
      exp.update("3");
      exp.update("=");
      expect(exp.result, "8");
    });
    test("3", () {
      Expression exp = Expression();

      exp.update("3");
      exp.update("=");
      expect(exp.result, "3");
    });

    test("+3", () {
      Expression exp = Expression();

      exp.update("+");
      exp.update("3");
      exp.update("=");
      expect(exp.result, "3");
    });

    test("-123", () {
      Expression exp = Expression();

      exp.update("-");
      exp.update("1");
      exp.update("2");
      exp.update("3");
      exp.update("=");
      expect(exp.result, "-123");
    });

    test("5+3", () {
      Expression exp = Expression();

      exp.update("5");
      exp.update("+");
      exp.update("3");
      exp.update("=");
      expect(exp.result, "8");
    });

    test("5+8", () {
      Expression exp = Expression();

      exp.update("5");
      exp.update("+");
      exp.update("8");
      exp.update("=");
      expect(exp.result, "13");
    });

    test("5-3", () {
      Expression exp = Expression();

      exp.update("5");
      exp.update("-");
      exp.update("3");
      exp.update("=");
      expect(exp.result, "2");
    });

    test("18-3", () {
      Expression exp = Expression();

      exp.update("1");
      exp.update("8");
      exp.update("-");
      exp.update("3");
      exp.update("=");
      expect(exp.result, "15");
    });

    test("1-13", () {
      Expression exp = Expression();

      exp.update("1");
      exp.update("-");
      exp.update("1");
      exp.update("3");
      exp.update("=");
      expect(exp.result, "-12");
    });

    test("5*3", () {
      Expression exp = Expression();

      exp.update("5");
      exp.update("*");
      exp.update("3");
      exp.update("=");
      expect(exp.result, "15");
    });

    test("5*39", () {
      Expression exp = Expression();

      exp.update("5");
      exp.update("*");
      exp.update("3");
      exp.update("9");
      exp.update("=");
      expect(exp.result, (5 * 39).toString());
    });

    test("5*-9", () {
      Expression exp = Expression();

      exp.update("5");
      exp.update("*");
      exp.update("-");
      exp.update("9");
      exp.update("=");
      expect(exp.result, (5 * -9).toString());
    });

    test("-5*-98", () {
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

    test("-5+-98-18-1+219", () {
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

    test("5+2*3/2-4", () {
      Expression exp = Expression();

      exp.update("5");
      exp.update("+");
      exp.update("2");
      exp.update("*");
      exp.update("3");
      exp.update("/");
      exp.update("2");
      exp.update("-");
      exp.update("4");
      exp.update("=");
      expect(exp.result, "4");
    });

    test("5+12.3/2/2/2*4*4*4+2*3/2.51-4", () {
      Expression exp = Expression();

      exp.update("5");
      exp.update("+");
      exp.update("1");
      exp.update("2");
      exp.update(".");
      exp.update("3");
      exp.update("/");
      exp.update("2");
      exp.update("/");
      exp.update("2");
      exp.update("/");
      exp.update("2");
      exp.update("*");
      exp.update("4");
      exp.update("*");
      exp.update("4");
      exp.update("*");
      exp.update("4");
      exp.update("+");
      exp.update("2");
      exp.update("*");
      exp.update("3");
      exp.update("/");
      exp.update("2");
      exp.update(".");
      exp.update("5");
      exp.update("1");
      exp.update("-");
      exp.update("4");
      exp.update("=");
      expect(exp.result, (5+12.3/2/2/2*4*4*4+2*3/2.51-4).toString());
    });

    test("-5*-98-18/15+219", () {
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

    test("-51.82*-98-1.8/15+219", () {
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

    test("-51.82*-98-1.8/15+219 with 3 uses of C", () {
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
