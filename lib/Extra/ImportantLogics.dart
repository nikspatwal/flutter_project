/*
FutureBuilder<Response> loginAPI(
    BuildContext context ,String username ,String password ,String clientId) {
  Map<String,String>  map = {"clientId" :"HFGKFB$clientId"};
  String credentials = username + ":" + password;

  String auth = "Basic " + base64.encode( utf8.encode( credentials ) );
  print("$map,$auth,$username,$password");

  return FutureBuilder<Response>(
    future: Provider.of<UserSession>(context).login( auth , map ) ,
    builder: (context ,snapshot) {

      if(snapshot.connectionState == ConnectionState.done){

        final Map map = json.decode( snapshot.data.bodyString );
        print(" RESPONSE OF API......${map.toString()}");
        FLog.error(text: "RESPONSE OF API...   ${map.toString()}");
        //("The data is.... ${map.toString()}");
        return Center(
          child: Text( map.toString( ) ) ,
        );
      } else {
        return Center(
          child: CircularProgressIndicator( ) ,
        );
      }
    } ,
);*/
