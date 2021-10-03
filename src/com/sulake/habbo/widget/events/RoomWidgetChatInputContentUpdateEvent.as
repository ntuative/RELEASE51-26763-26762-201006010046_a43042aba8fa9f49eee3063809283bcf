package com.sulake.habbo.widget.events
{
   public class RoomWidgetChatInputContentUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_999:String = "whisper";
      
      public static const const_1387:String = "shout";
      
      public static const const_590:String = "RWWCIDE_CHAT_INPUT_CONTENT";
       
      
      private var var_1845:String = "";
      
      private var _userName:String = "";
      
      public function RoomWidgetChatInputContentUpdateEvent(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_590,param3,param4);
         var_1845 = param1;
         _userName = param2;
      }
      
      public function get messageType() : String
      {
         return var_1845;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
