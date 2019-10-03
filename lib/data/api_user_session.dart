import 'package:chopper/chopper.dart';

part 'api_user_session.chopper.dart';

@ChopperApi(baseUrl: "/api/user/sessions")

abstract class API extends ChopperService{

  static API create(){
    final client = ChopperClient(
      baseUrl: "https://vinnoba.com/vinnoba" ,
      services:[
        _$API(),
      ],converter: JsonConverter(),);


    return _$API(client);

  }

  @Post(path: "user/sessions")
  Future<Map> login(@Header("Authorization") String auth,@body Map map);


}


