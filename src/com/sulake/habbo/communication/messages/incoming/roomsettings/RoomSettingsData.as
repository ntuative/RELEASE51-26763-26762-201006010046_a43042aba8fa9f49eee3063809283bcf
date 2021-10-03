package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_378:int = 0;
      
      public static const const_126:int = 2;
      
      public static const const_164:int = 1;
      
      public static const const_741:Array = ["open","closed","password"];
       
      
      private var _name:String;
      
      private var var_2017:Boolean;
      
      private var var_2019:Boolean;
      
      private var var_2016:int;
      
      private var var_2014:Array;
      
      private var var_2018:int;
      
      private var var_2020:Boolean;
      
      private var var_1229:String;
      
      private var var_2013:int;
      
      private var var_2015:int;
      
      private var var_1269:int;
      
      private var _roomId:int;
      
      private var var_656:Array;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get maximumVisitors() : int
      {
         return var_2013;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_2013 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_656;
      }
      
      public function get allowPets() : Boolean
      {
         return var_2020;
      }
      
      public function set controllerCount(param1:int) : void
      {
         var_2018 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_2014 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_656 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_2017;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_2019;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return var_2016;
      }
      
      public function get categoryId() : int
      {
         return var_1269;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_2020 = param1;
      }
      
      public function get controllerCount() : int
      {
         return var_2018;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_2014;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_2015 = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_2017 = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_2019 = param1;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         var_2016 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_2015;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1269 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1229 = param1;
      }
      
      public function get description() : String
      {
         return var_1229;
      }
   }
}
