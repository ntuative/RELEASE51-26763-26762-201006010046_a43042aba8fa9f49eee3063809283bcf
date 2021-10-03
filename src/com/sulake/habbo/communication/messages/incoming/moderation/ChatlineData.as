package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1568:String;
      
      private var var_2107:int;
      
      private var var_2108:int;
      
      private var var_2109:int;
      
      private var var_2110:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_2107 = param1.readInteger();
         var_2109 = param1.readInteger();
         var_2108 = param1.readInteger();
         var_2110 = param1.readString();
         var_1568 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1568;
      }
      
      public function get hour() : int
      {
         return var_2107;
      }
      
      public function get minute() : int
      {
         return var_2109;
      }
      
      public function get chatterName() : String
      {
         return var_2110;
      }
      
      public function get chatterId() : int
      {
         return var_2108;
      }
   }
}
