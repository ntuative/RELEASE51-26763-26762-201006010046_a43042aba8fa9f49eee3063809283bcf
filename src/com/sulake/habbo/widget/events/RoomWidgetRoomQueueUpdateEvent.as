package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_373:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
      
      public static const const_313:String = "RWRQUE_VISITOR_QUEUE_STATUS";
       
      
      private var var_896:int;
      
      private var var_286:Boolean;
      
      private var var_2147:Boolean;
      
      private var var_1524:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_896 = param2;
         var_2147 = param3;
         var_286 = param4;
         var_1524 = param5;
      }
      
      public function get position() : int
      {
         return var_896;
      }
      
      public function get isActive() : Boolean
      {
         return var_286;
      }
      
      public function get isClubQueue() : Boolean
      {
         return var_1524;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return var_2147;
      }
   }
}
