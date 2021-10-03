package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1578:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1508:String = "ROE_MOUSE_ENTER";
      
      public static const const_393:String = "ROE_MOUSE_MOVE";
      
      public static const const_1603:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_218:String = "ROE_MOUSE_CLICK";
      
      public static const const_418:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1763:Boolean;
      
      private var var_1761:Boolean;
      
      private var var_1762:Boolean;
      
      private var var_1760:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_1762 = param4;
         var_1760 = param5;
         var_1763 = param6;
         var_1761 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1761;
      }
      
      public function get altKey() : Boolean
      {
         return var_1762;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1760;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1763;
      }
   }
}
