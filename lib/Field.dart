import 'package:playfields2/Sporttypes.dart';

class Field {
  String _name;
  List<String> sporttype;
  String _location;
  int _openhour;
  int _closehour;
  bool _open;
  int distancetolocation;
  String photourl ;

  String get Name => _name ;
  String get Location => _location ;
  int get Openhour => _openhour;
  int get Closehour => _closehour;



  Field(this._name, this.sporttype, this._location, this._openhour,
      this._closehour, this._open, this.distancetolocation, this.photourl) ;

  List<String> sportforeach (){
   return sporttype;
  }


}

