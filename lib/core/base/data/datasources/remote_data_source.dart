import 'package:chopper/chopper.dart';

abstract class BaseRemoteDataSource {
  final ChopperClient client;
  const BaseRemoteDataSource(this.client);
}
