package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_616:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_193:String;
      
      private var var_701:String;
      
      private var var_1466:String;
      
      private var var_154:int = -1;
      
      private var var_29:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_154 = param2;
         var_1466 = param3;
         var_193 = param4;
         var_701 = param5;
         var_29 = param6;
      }
      
      public function get objectType() : String
      {
         return var_1466;
      }
      
      public function get colorHex() : String
      {
         return var_701;
      }
      
      public function get text() : String
      {
         return var_193;
      }
      
      public function get objectId() : int
      {
         return var_154;
      }
      
      public function get controller() : Boolean
      {
         return var_29;
      }
   }
}
