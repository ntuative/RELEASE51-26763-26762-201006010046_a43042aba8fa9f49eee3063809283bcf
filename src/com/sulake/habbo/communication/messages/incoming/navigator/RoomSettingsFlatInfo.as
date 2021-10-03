package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomSettingsFlatInfo
   {
      
      public static const const_378:int = 0;
      
      public static const const_126:int = 2;
      
      public static const const_164:int = 1;
      
      public static const const_741:Array = ["open","closed","password"];
       
      
      private var _id:int;
      
      private var var_2244:Boolean;
      
      private var _password:String;
      
      private var var_2015:int;
      
      private var _type:String;
      
      private var _ownerName:String;
      
      private var var_2241:Boolean;
      
      private var var_2243:Boolean;
      
      private var _name:String;
      
      private var var_2242:Boolean;
      
      private var var_1229:String;
      
      public function RoomSettingsFlatInfo()
      {
         super();
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set password(param1:String) : void
      {
         _password = param1;
      }
      
      public function set allowFurniMoving(param1:Boolean) : void
      {
         var_2244 = param1;
      }
      
      public function get method_13() : Boolean
      {
         return var_2243;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      public function set showOwnerName(param1:Boolean) : void
      {
         var_2241 = param1;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_2242;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get showOwnerName() : Boolean
      {
         return var_2241;
      }
      
      public function get allowFurniMoving() : Boolean
      {
         return var_2244;
      }
      
      public function set method_13(param1:Boolean) : void
      {
         var_2243 = param1;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_2015 = param1;
      }
      
      public function set allowTrading(param1:Boolean) : void
      {
         var_2242 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_2015;
      }
      
      public function get password() : String
      {
         return _password;
      }
      
      public function set id(param1:int) : void
      {
         _id = param1;
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
