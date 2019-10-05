import 'package:chopper/chopper.dart';

part 'api_user_session.chopper.dart';

@ChopperApi(baseUrl: "/api/user/sessions")

abstract class UserSession extends ChopperService{



  @Post(path: "user/sessions")
  Future<Response> login(@Header("Authorization") String auth,@body Map map);


  static UserSession create(){
    final client = ChopperClient(
      baseUrl: "https://vinnoba.com/vinnoba" ,
      services:[
        _$UserSession(),
      ],converter: JsonConverter(),);


    return _$UserSession(client);

  }

}


