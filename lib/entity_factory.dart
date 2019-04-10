import 'package:flutter_learn/bean/person_entity.dart';
import 'package:flutter_learn/bean/student_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "PersonEntity") {
      return PersonEntity.fromJson(json) as T;
    } else if (T.toString() == "StudentEntity") {
      return StudentEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}