import 'package:chopper/chopper.dart';



part 'api_user_session.chopper.dart';

@ChopperApi(baseUrl: "")

abstract class UserSession extends ChopperService{



  @Post(path: "/api/user/sessions")
  Future<Response> login(@Header("Authorization") String auth,@body Map map,
      @Header("Content-Type" )String type);


  static UserSession create(){
    final client = ChopperClient(
      baseUrl: "https://vinnoba.com/vinnobaapi" ,
      services:[
        _$UserSession(),
      ],converter: JsonConverter());


    return _$UserSession(client);

  }

}


