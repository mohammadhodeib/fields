
class Sporttypes {
   List<String> sports = ['basketball','football','volleyball','tennis','kidsplayzone','lasertag','openarea','balling',
    'pingpong'] ;

  Sporttypes () {}

    List<String> filledsports (List<int> indexes) {
      List<String> result =[];
      int i ;
      for (i=0 ; i<indexes.length ; i++) {result.add(sports[indexes[i]])   ;}
      return result ;
      }
  }