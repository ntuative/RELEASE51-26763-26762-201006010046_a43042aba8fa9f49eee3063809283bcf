package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var _password:String;
      
      private var var_2013:int;
      
      private var var_2015:int;
      
      private var var_2017:Boolean;
      
      private var var_2019:Boolean;
      
      private var var_2014:Array;
      
      private var var_2020:Boolean;
      
      private var var_1269:int;
      
      private var _name:String;
      
      private var _roomId:int;
      
      private var var_656:Array;
      
      private var var_1229:String;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function get doorMode() : int
      {
         return var_2015;
      }
      
      public function get description() : String
      {
         return var_1229;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_2019;
      }
      
      public function get maximumVisitors() : int
      {
         return var_2013;
      }
      
      public function set description(param1:String) : void
      {
         var_1229 = param1;
      }
      
      public function get password() : String
      {
         return _password;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_2020 = param1;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_2013 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get categoryId() : int
      {
         return var_1269;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_2014;
      }
      
      public function get tags() : Array
      {
         return var_656;
      }
      
      public function get allowPets() : Boolean
      {
         return var_2020;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_2015 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_2017 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_656 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_2014 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1269 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_2017;
      }
      
      public function set password(param1:String) : void
      {
         _password = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_2019 = param1;
      }
   }
}
