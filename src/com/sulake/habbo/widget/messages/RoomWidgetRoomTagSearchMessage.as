package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_757:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_1839:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_757);
         var_1839 = param1;
      }
      
      public function get tag() : String
      {
         return var_1839;
      }
   }
}
