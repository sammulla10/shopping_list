import 'package:flutter/material.dart';
import 'package:shopping_list/models/category.dart';

const metric=['gram','kg','dozen','litre','packs'];

const categories = {
  Categories.vegetables: Category(
    'Vegetables',
    Color.fromARGB(255, 0, 255, 128),
    'vegetable.jpg'
  ),
  Categories.fruit: Category(
    'Fruit',
    Color.fromARGB(255, 145, 255, 0),'fruits.jpg',
  ),
  Categories.meat: Category(
    'Meat',
    Color.fromARGB(255, 255, 102, 0),'meat.jpg',
  ),
  Categories.dairy: Category(
    'Dairy',
    Color.fromARGB(255, 0, 208, 255),'dairy.jpg',
  ),
  Categories.carbs: Category(
    'Carbs',
    Color.fromRGBO(0, 60, 255, 1),'carbs.jpg',
  ),
  Categories.sweets: Category(
    'Sweets',
    Color.fromARGB(255, 255, 149, 0),'sweets.jpg',
  ),
  Categories.spices: Category(
    'Spices',
    Color.fromARGB(255, 255, 187, 0),'spices.jpg',
  ),
  Categories.convenience: Category(
    'Convenience',
    Color.fromARGB(255, 191, 0, 255),'convenience.jpg',
  ),
  Categories.hygiene: Category(
    'Hygiene',
    Color.fromARGB(255, 149, 0, 255),'hygiene.jpg',
  ),
  Categories.other: Category(
    'Other',
    Color.fromARGB(255, 0, 225, 255),'other.jpg',
  ),
};
