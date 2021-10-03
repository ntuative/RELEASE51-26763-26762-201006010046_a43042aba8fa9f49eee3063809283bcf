package com.sulake.habbo.widget.events
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomWidgetRoomViewUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_715:String = "RWRVUE_ROOM_VIEW_POSITION_CHANGED";
      
      public static const const_570:String = "RWRVUE_ROOM_VIEW_SCALE_CHANGED";
      
      public static const const_256:String = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
       
      
      private var var_1615:Point;
      
      private var var_1614:Rectangle;
      
      private var var_148:Number = 0.0;
      
      public function RoomWidgetRoomViewUpdateEvent(param1:String, param2:Rectangle = null, param3:Point = null, param4:Number = 0.0, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         var_1614 = param2;
         var_1615 = param3;
         var_148 = param4;
      }
      
      public function get rect() : Rectangle
      {
         if(var_1614 != null)
         {
            return var_1614.clone();
         }
         return null;
      }
      
      public function get scale() : Number
      {
         return var_148;
      }
      
      public function get positionDelta() : Point
      {
         if(var_1615 != null)
         {
            return var_1615.clone();
         }
         return null;
      }
   }
}
