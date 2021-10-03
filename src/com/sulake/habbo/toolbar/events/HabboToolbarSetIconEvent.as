package com.sulake.habbo.toolbar.events
{
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class HabboToolbarSetIconEvent extends Event
   {
      
      public static const const_923:String = "HTIE_SET_TOOLBAR_ICON_BITMAP";
      
      public static const const_170:String = "HTIE_REMOVE_TOOLBAR_ICON";
      
      public static const const_118:String = "HTIE_SET_TOOLBAR_ICON";
      
      public static const const_176:String = "HTIE_SET_TOOLBAR_ICON_STATE";
       
      
      private var var_1778:String;
      
      private var var_784:String;
      
      private var var_1189:String;
      
      private var _bitmapData:BitmapData;
      
      public function HabboToolbarSetIconEvent(param1:String, param2:String, param3:String = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         var_784 = param2;
         var_1189 = param3;
      }
      
      public function set bitmapData(param1:BitmapData) : void
      {
         _bitmapData = param1;
      }
      
      public function get iconState() : String
      {
         return var_1778;
      }
      
      public function get iconId() : String
      {
         return var_784;
      }
      
      public function set assetName(param1:String) : void
      {
         var_1189 = param1;
      }
      
      public function set iconState(param1:String) : void
      {
         var_1778 = param1;
      }
      
      public function get bitmapData() : BitmapData
      {
         return _bitmapData;
      }
      
      public function get assetName() : String
      {
         return var_1189;
      }
   }
}
