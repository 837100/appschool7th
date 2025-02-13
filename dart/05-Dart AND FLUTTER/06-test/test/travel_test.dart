import 'package:test_example/test_dart_sample.dart';
import 'package:test/test.dart';

void main() {
  test('Travel Distance to Miles', () {
    var distance = 10.0;
    var expectedDistance = distance * convertToMiles;

    var travel = Travel(distance);
    var result = travel.distanceToMiles();

    expect(result, expectedDistance);
  });

  test('Travle distance to Kilometers', () {
    var distance = 10.0;
    var expectedDistanceInMiles = distance * convertToKilometers;

    var travel = Travel(distance);
    var result = travel.distanceToKilometers();

    expect(result, expectedDistanceInMiles);
  });
}
