package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_133:int = 0;
      
      public static const const_128:int = 1;
      
      public static const const_112:int = 2;
      
      public static const const_641:String = "RWCM_MESSAGE_CHAT";
       
      
      private var var_1398:int = 0;
      
      private var var_1685:String = "";
      
      private var var_193:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         var_193 = param2;
         var_1398 = param3;
         var_1685 = param4;
      }
      
      public function get recipientName() : String
      {
         return var_1685;
      }
      
      public function get chatType() : int
      {
         return var_1398;
      }
      
      public function get text() : String
      {
         return var_193;
      }
   }
}
