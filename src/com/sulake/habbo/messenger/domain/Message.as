package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_729:int = 2;
      
      public static const const_939:int = 6;
      
      public static const const_524:int = 1;
      
      public static const const_752:int = 3;
      
      public static const const_902:int = 4;
      
      public static const const_695:int = 5;
       
      
      private var var_1989:String;
      
      private var var_1124:int;
      
      private var var_1990:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_1124 = param2;
         var_1990 = param3;
         var_1989 = param4;
      }
      
      public function get time() : String
      {
         return var_1989;
      }
      
      public function get senderId() : int
      {
         return var_1124;
      }
      
      public function get messageText() : String
      {
         return var_1990;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
