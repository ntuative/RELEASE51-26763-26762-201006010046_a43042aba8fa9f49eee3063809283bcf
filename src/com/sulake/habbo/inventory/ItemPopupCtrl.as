package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ItemPopupCtrl
   {
      
      private static const const_1159:int = 100;
      
      private static const const_1161:int = 200;
      
      private static const const_1158:int = 180;
      
      public static const const_829:int = 1;
      
      public static const const_424:int = 2;
      
      private static const const_1160:int = 250;
      
      private static const const_810:int = 5;
       
      
      private var var_646:BitmapData;
      
      private var var_327:Timer;
      
      private var var_9:IWindowContainer;
      
      private var var_777:BitmapData;
      
      private var var_326:Timer;
      
      private var var_74:IWindowContainer;
      
      private var var_1621:int = 2;
      
      private var _assets:IAssetLibrary;
      
      public function ItemPopupCtrl(param1:IWindowContainer, param2:IAssetLibrary)
      {
         var_326 = new Timer(const_1160,1);
         var_327 = new Timer(const_1159,1);
         super();
         if(param1 == null)
         {
            return;
         }
         if(param2 == null)
         {
            return;
         }
         var_74 = param1;
         var_74.visible = false;
         _assets = param2;
         var_326.addEventListener(TimerEvent.TIMER,onDisplayTimer);
         var_327.addEventListener(TimerEvent.TIMER,onHideTimer);
         var _loc3_:BitmapDataAsset = _assets.getAssetByName("popup_arrow_right_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_777 = _loc3_.content as BitmapData;
         }
         _loc3_ = _assets.getAssetByName("popup_arrow_left_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_646 = _loc3_.content as BitmapData;
         }
      }
      
      public function hide() : void
      {
         var_74.visible = false;
         var_327.reset();
         var_326.reset();
         if(var_9 != null)
         {
            var_9.removeChild(var_74);
         }
      }
      
      public function hideDelayed() : void
      {
         var_327.reset();
         var_326.reset();
         var_327.start();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         hide();
      }
      
      public function dispose() : void
      {
         if(var_326 != null)
         {
            var_326.removeEventListener(TimerEvent.TIMER,onDisplayTimer);
            var_326.stop();
            var_326 = null;
         }
         if(var_327 != null)
         {
            var_327.removeEventListener(TimerEvent.TIMER,onHideTimer);
            var_327.stop();
            var_327 = null;
         }
         _assets = null;
         var_74 = null;
         var_9 = null;
         var_646 = null;
         var_777 = null;
      }
      
      public function showDelayed() : void
      {
         var_327.reset();
         var_326.reset();
         var_326.start();
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         show();
      }
      
      public function updateContent(param1:IWindowContainer, param2:String, param3:BitmapData, param4:int = 2) : void
      {
         var _loc7_:* = null;
         if(var_74 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param3 == null)
         {
            param3 = new BitmapData(1,1,true,16777215);
         }
         if(var_9 != null)
         {
            var_9.removeChild(var_74);
         }
         var_9 = param1;
         var_1621 = param4;
         var _loc5_:ITextWindow = ITextWindow(var_74.findChildByName("item_name_text"));
         if(_loc5_)
         {
            _loc5_.text = param2;
         }
         var _loc6_:IBitmapWrapperWindow = var_74.findChildByName("item_image") as IBitmapWrapperWindow;
         if(_loc6_)
         {
            _loc7_ = new BitmapData(Math.min(const_1158,param3.width),Math.min(const_1161,param3.height),true,16777215);
            _loc7_.copyPixels(param3,new Rectangle(0,0,_loc7_.width,_loc7_.height),new Point(0,0),null,null,true);
            _loc6_.bitmap = _loc7_;
            _loc6_.width = _loc6_.bitmap.width;
            _loc6_.height = _loc6_.bitmap.height;
            _loc6_.x = (0 - _loc6_.width) / 2;
            var_74.height = _loc6_.rectangle.bottom + 10;
         }
      }
      
      private function refreshArrow(param1:int = 2) : void
      {
         if(var_74 == null || false)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(var_74.findChildByName("arrow_pointer"));
         if(!_loc2_)
         {
            return;
         }
         switch(param1)
         {
            case const_829:
               _loc2_.bitmap = var_777.clone();
               _loc2_.width = var_777.width;
               _loc2_.height = var_777.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = -1;
               break;
            case const_424:
               _loc2_.bitmap = var_646.clone();
               _loc2_.width = var_646.width;
               _loc2_.height = var_646.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = 1;
         }
         _loc2_.invalidate();
      }
      
      public function show() : void
      {
         var_327.reset();
         var_326.reset();
         if(var_9 == null)
         {
            return;
         }
         var_74.visible = true;
         var_9.addChild(var_74);
         refreshArrow(var_1621);
         switch(var_1621)
         {
            case const_829:
               var_74.x = 0 - const_810;
               break;
            case const_424:
               var_74.x = var_9.width + const_810;
         }
         var_74.y = (0 - 0) / 2;
      }
   }
}
