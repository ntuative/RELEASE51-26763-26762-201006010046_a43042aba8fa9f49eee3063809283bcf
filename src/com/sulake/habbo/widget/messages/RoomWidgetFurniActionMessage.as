package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_274:String = "RWFAM_MOVE";
      
      public static const const_720:String = "RWFUAM_ROTATE";
      
      public static const const_592:String = "RWFAM_PICKUP";
       
      
      private var var_1662:int = 0;
      
      private var var_1705:int = 0;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         var_1662 = param2;
         var_1705 = param3;
      }
      
      public function get furniId() : int
      {
         return var_1662;
      }
      
      public function get furniCategory() : int
      {
         return var_1705;
      }
   }
}
