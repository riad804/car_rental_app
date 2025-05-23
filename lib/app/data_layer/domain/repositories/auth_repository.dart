import '../../../core/utils/type_defs.dart';

abstract class AuthRepository {
  ResultVoid register({required dynamic data});
  ResultVoid login({required dynamic body});
}