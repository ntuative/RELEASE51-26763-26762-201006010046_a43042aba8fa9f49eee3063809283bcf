package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var var_313:String = "";
      
      private var var_1966:String = "";
      
      private var var_1970:int = 0;
      
      private var var_1968:int = 0;
      
      private var _type:int = 0;
      
      private var var_1971:String = "";
      
      private var var_571:String = "";
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var var_1967:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set groupStatus(param1:int) : void
      {
         var_1970 = param1;
      }
      
      public function set groupID(param1:String) : void
      {
         var_1971 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set figure(param1:String) : void
      {
         var_313 = param1;
      }
      
      public function set sex(param1:String) : void
      {
         var_571 = param1;
      }
      
      public function get groupStatus() : int
      {
         return var_1970;
      }
      
      public function set webID(param1:int) : void
      {
         var_1967 = param1;
      }
      
      public function get groupID() : String
      {
         return var_1971;
      }
      
      public function set custom(param1:String) : void
      {
         var_1966 = param1;
      }
      
      public function get figure() : String
      {
         return var_313;
      }
      
      public function get sex() : String
      {
         return var_571;
      }
      
      public function get custom() : String
      {
         return var_1966;
      }
      
      public function get webID() : int
      {
         return var_1967;
      }
      
      public function set xp(param1:int) : void
      {
         var_1968 = param1;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function get xp() : int
      {
         return var_1968;
      }
   }
}
