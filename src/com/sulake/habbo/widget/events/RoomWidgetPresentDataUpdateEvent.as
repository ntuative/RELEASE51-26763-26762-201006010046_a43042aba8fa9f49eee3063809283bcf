package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPresentDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_395:String = "RWPDUE_CONTENTS_CLUB";
      
      public static const const_409:String = "RWPDUE_CONTENTS_LANDSCAPE";
      
      public static const const_83:String = "RWPDUE_CONTENTS";
      
      public static const const_485:String = "RWPDUE_CONTENTS_WALLPAPER";
      
      public static const const_470:String = "RWPDUE_CONTENTS_FLOOR";
      
      public static const const_69:String = "RWPDUE_PACKAGEINFO";
       
      
      private var var_193:String;
      
      private var var_2148:BitmapData;
      
      private var var_154:int = -1;
      
      private var var_29:Boolean;
      
      public function RoomWidgetPresentDataUpdateEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:BitmapData = null, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_154 = param2;
         var_193 = param3;
         var_29 = param4;
         var_2148 = param5;
      }
      
      public function get iconBitmapData() : BitmapData
      {
         return var_2148;
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
