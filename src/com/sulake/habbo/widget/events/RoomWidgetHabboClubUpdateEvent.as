package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_227:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2127:Boolean = false;
      
      private var var_2125:int = 0;
      
      private var var_2128:int = 0;
      
      private var var_1852:int;
      
      private var var_2126:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_227,param6,param7);
         var_2126 = param1;
         var_2128 = param2;
         var_2125 = param3;
         var_2127 = param4;
         var_1852 = param5;
      }
      
      public function get clubLevel() : int
      {
         return var_1852;
      }
      
      public function get pastPeriods() : int
      {
         return var_2125;
      }
      
      public function get periodsLeft() : int
      {
         return var_2128;
      }
      
      public function get daysLeft() : int
      {
         return var_2126;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_2127;
      }
   }
}
