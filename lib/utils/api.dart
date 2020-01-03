import 'package:chopper/chopper.dart';
part 'api.chopper.dart';

@ChopperApi(baseUrl: "")

abstract class AllApi extends ChopperService {

  @Post( path: "/api/user/sessions" )
  Future<Response> login(
      @Header( "Authorization" ) String auth ,@body Map map ,
      @Header( "Content-Type" ) String type
      );

  @Post( path: "/api/user/refreshtoken" )
  Future<Response> refreshToken(
      @Header( "refresh-token" ) String refreshToken ,
      @Header( "Content-Type" ) String content ,
      @Header( "Accept" ) String accept ,
      @body Map refreshTokenMap
      );

  @Post( path: "/api/entity/{entity_id}/visitor")
  Future<Response> registerVisitor(
      @Path('entity_id') String entityId,
      @Header( "x-auth-token" ) String xToken ,
      @Header( "Content-Type" ) String content ,
      @Header( "Accept" ) String accept ,
      @body Map mobileNo
      );

  @Post(path :"/api/entity/{entityId}/gate/query" )

  Future <Response> gateQuery(@Header("x-auth-token") String xToken,
      @Path("entityId") String entityId,
      @body Map body);

  @Post(path: "/api/entity/{entityId}/visitorhistory/query")
  Future<Response> visitorHistory(
      @Path('entityId') String entityId,
      @Header( "x-auth-token" ) String xToken ,
      @Header( "Content-Type" ) String content ,
      @Header( "Accept" ) String accept ,
      @body Map body
      );

  @Get(path:"/api/entity/{entityId}/visitor/{visitorId}/visitorhistory/{visitorhistoryId}/image/")
  Future<Response> getVisitorImage(
      @Path('entityId') String entityId,
      @Path('visitorId') String visitorId,
      @Path('visitorhistoryId') String visitorHistoryId,
      @Header( "Content-Type" ) String content,
      @Header( "x-auth-token" ) String xToken
      );

  @Put(path: "/api/entity/{entity_id}/visitor/{visitorId}")
  Future<Response> insertVisitor(
      @Path('entityId') String entityId,
      @Path('visitorId') String visitorId,
      @Header( "x-auth-token" ) String xToken ,
      @body Map body
      );

  @Post(path: "/api/entity/{entityId}/user/query")
  Future<Response>getUserDetails(
      @Path('entityId') String entityId,
      @Header( "Content-Type" ) String content ,
      @Header( "Accept" ) String accept ,
      @Header( "x-auth-token" ) String xToken ,
      @body Map body
      );

  @Post(path: "/api/entity/{entity_id}/user/workhistory/query")
  Future<Response>employeeWorkHistory(
      @Path('entityId') String entityId,
      @Header( "Content-Type" ) String content ,
      @Header( "Accept" ) String accept ,
      @Header( "x-auth-token" ) String xToken ,
      @body Map body
      );

  @Post(path: "/api/entity/{entityId}/visitor/{visitorId}/visitorhistory")
  Future<Response>logVisitorHistory(
      @Path('entityId') String entityId,
      @Path('visitorId') String visitorId,
      @Header( "Content-Type" ) String content ,
      @Header( "Accept" ) String accept ,
      @Header( "x-auth-token" ) String xToken ,
      @body Map body
      );

  @Post(path: "/api/entity/{entityId}/visitor/{visitorId}/visitorhistory/{visitorhistoryId}/image")
  @multipart
  Future<Response> uploadVisitorImage(
      @Path('entityId') String entityId,
      @Path('visitorId') String visitorId,
      @Path('visitorhistoryId') String visitorHistoryId,
      @Header( "Content-Type" ) String content,
      @Header( "x-auth-token" ) String xToken,
      @Part("file") List<int> bytes
      );

  static AllApi create(){
    final client = ChopperClient(
      baseUrl: "https://vinnoba.com/vinnobaapi" ,
      services:[
        _$AllApi(),
      ],converter: JsonConverter(),);


    return _$AllApi(client);

  }
}