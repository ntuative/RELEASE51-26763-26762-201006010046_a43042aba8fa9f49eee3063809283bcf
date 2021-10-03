package com.sulake.habbo.widget.messages
{
   public class RoomWidgetPresentOpenedMessage extends RoomWidgetMessage
   {
      
      public static const const_1185:String = "RWPOMD_PRESENT_OPENED";
       
      
      private var var_1339:int;
      
      private var var_1095:String;
      
      public function RoomWidgetPresentOpenedMessage(param1:String, param2:String, param3:int)
      {
         super(param1);
         var_1095 = param2;
         var_1339 = param3;
      }
      
      public function get classId() : int
      {
         return var_1339;
      }
      
      public function get itemType() : String
      {
         return var_1095;
      }
   }
}
