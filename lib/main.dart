import 'package:flutter/material.dart';
import 'dart:core';

class Car {
  static int numberOfCars = 0;

  String brand;
  String model;
  int year;
  double milesDriven;

  Car(this.brand, this.model, this.year, [this.milesDriven = 0.0]) {
    numberOfCars++;
  }

  void drive(double miles) {
    milesDriven += miles;
  }

  double getMilesDriven() {
    return milesDriven;
  }

  String getBrand() {
    return brand;
  }

  String getModel() {
    return model;
  }

  int getYear() {
    return year;
  }

  int getAge() {
    final currentYear = DateTime.now().year;
    return currentYear - year;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Car Info')),
        body: CarInfo(),
      ),
    );
  }
}

class CarInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Create three Car objects with different brands, models, and years
    Car car1 = Car("Toyota", "Corolla", 2015);
    Car car2 = Car("Ford", "Mustang", 2018);
    Car car3 = Car("Tesla", "Model S", 2020);

    // Drive each car a different number of miles
    car1.drive(15000);
    car2.drive(25000);
    car3.drive(10000);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          carInfoWidget(car1),
          carInfoWidget(car2),
          carInfoWidget(car3),
          Text('Total number of cars created: ${Car.numberOfCars}'),
        ],
      ),
    );
  }

  Widget carInfoWidget(Car car) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Brand: ${car.getBrand()}'),
          Text('Model: ${car.getModel()}'),
          Text('Year: ${car.getYear()}'),
          Text('Miles Driven: ${car.getMilesDriven()}'),
          Text('Age: ${car.getAge()} years'),
        ],
      ),
    );
  }
}
