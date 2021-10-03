package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1306:String = "F";
      
      public static const const_896:String = "M";
       
      
      private var var_88:Number = 0;
      
      private var var_313:String = "";
      
      private var var_1969:int = 0;
      
      private var var_1966:String = "";
      
      private var var_1970:int = 0;
      
      private var var_1968:int = 0;
      
      private var var_1971:String = "";
      
      private var var_571:String = "";
      
      private var _id:int = 0;
      
      private var var_199:Boolean = false;
      
      private var var_237:int = 0;
      
      private var var_1965:String = "";
      
      private var _name:String = "";
      
      private var var_1967:int = 0;
      
      private var _y:Number = 0;
      
      private var var_89:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_89;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_237;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_199)
         {
            var_237 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_199)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_1969;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_199)
         {
            var_1970 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_1965;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_199)
         {
            var_1971 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_199)
         {
            var_1965 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_199)
         {
            var_1968 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_199)
         {
            var_313 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_199)
         {
            var_1969 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_199)
         {
            var_571 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1970;
      }
      
      public function get groupID() : String
      {
         return var_1971;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_199)
         {
            var_1967 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_199)
         {
            var_1966 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_199 = true;
      }
      
      public function get sex() : String
      {
         return var_571;
      }
      
      public function get figure() : String
      {
         return var_313;
      }
      
      public function get webID() : int
      {
         return var_1967;
      }
      
      public function get custom() : String
      {
         return var_1966;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_199)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_199)
         {
            var_89 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_199)
         {
            var_88 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_88;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1968;
      }
   }
}
