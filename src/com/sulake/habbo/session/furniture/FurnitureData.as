package com.sulake.habbo.session.furniture
{
   public class FurnitureData implements IFurnitureData
   {
      
      public static const const_1574:String = "e";
      
      public static const const_1490:String = "i";
      
      public static const const_1496:String = "s";
       
      
      private var _id:int;
      
      private var var_2221:String;
      
      private var _title:String;
      
      private var _type:String;
      
      private var var_2224:int;
      
      private var var_1217:Array;
      
      private var var_2226:int;
      
      private var var_2222:int;
      
      private var var_2225:int;
      
      private var _name:String;
      
      private var var_2223:int;
      
      private var var_1229:String;
      
      public function FurnitureData(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Array, param10:String, param11:String, param12:String)
      {
         super();
         _type = param1;
         _id = param2;
         _name = param3;
         var_2224 = param4;
         var_2223 = param5;
         var_2226 = param6;
         var_2222 = param7;
         var_2225 = param8;
         var_1217 = param9;
         _title = param10;
         var_1229 = param11;
         var_2221 = param12;
      }
      
      public function get tileSizeY() : int
      {
         return var_2222;
      }
      
      public function get tileSizeZ() : int
      {
         return var_2225;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get adUrl() : String
      {
         return var_2221;
      }
      
      public function get title() : String
      {
         return _title;
      }
      
      public function get revision() : int
      {
         return var_2223;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get colourIndex() : int
      {
         return var_2224;
      }
      
      public function get tileSizeX() : int
      {
         return var_2226;
      }
      
      public function get colours() : Array
      {
         return var_1217;
      }
      
      public function get description() : String
      {
         return var_1229;
      }
   }
}
