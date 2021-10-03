package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_875:String = "inventory_badges";
      
      public static const const_1388:String = "inventory_clothes";
      
      public static const const_1220:String = "inventory_furniture";
      
      public static const const_566:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_906:String = "inventory_effects";
       
      
      private var var_1962:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_566);
         var_1962 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_1962;
      }
   }
}
