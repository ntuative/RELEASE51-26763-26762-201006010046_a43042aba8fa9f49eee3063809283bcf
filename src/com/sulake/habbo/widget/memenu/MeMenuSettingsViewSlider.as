package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.events.WindowEvent;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class MeMenuSettingsViewSlider
   {
       
      
      private var var_915:MeMenuSettingsView;
      
      private var var_2411:int;
      
      private var var_604:BitmapData;
      
      private var var_1054:Number = 1.0;
      
      private var var_1501:int;
      
      private var var_712:Number = 0.0;
      
      private var _sliderContainer:IWindowContainer;
      
      private var var_603:BitmapData;
      
      public function MeMenuSettingsViewSlider(param1:MeMenuSettingsView, param2:IWindowContainer, param3:IAssetLibrary, param4:Number = 0.0, param5:Number = 1.0)
      {
         super();
         var_915 = param1;
         _sliderContainer = param2;
         var_712 = param4;
         var_1054 = param5;
         storeAssets(param3);
         displaySlider();
      }
      
      private function buttonProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_473)
         {
            return;
         }
         var_915.saveVolume(getValue(param2.x),false);
      }
      
      private function displaySlider() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_sliderContainer == null)
         {
            return;
         }
         _loc2_ = _sliderContainer.findChildByName("slider_base") as IBitmapWrapperWindow;
         if(_loc2_ != null && var_603 != null)
         {
            _loc2_.bitmap = new BitmapData(var_603.width,var_603.height,true,16777215);
            _loc2_.bitmap.copyPixels(var_603,var_603.rect,new Point(0,0),null,null,true);
         }
         _loc1_ = _sliderContainer.findChildByName("slider_movement_area") as IWindowContainer;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.findChildByName("slider_button") as IBitmapWrapperWindow;
            if(_loc2_ != null && var_604 != null)
            {
               _loc2_.bitmap = new BitmapData(var_604.width,var_604.height,true,16777215);
               _loc2_.bitmap.copyPixels(var_604,var_604.rect,new Point(0,0),null,null,true);
               _loc2_.procedure = buttonProcedure;
               var_1501 = _loc1_.width - _loc2_.width;
            }
         }
      }
      
      private function storeAssets(param1:IAssetLibrary) : void
      {
         var _loc2_:* = null;
         if(param1 == null)
         {
            return;
         }
         _loc2_ = BitmapDataAsset(param1.getAssetByName("memenu_settings_slider_base"));
         var_603 = BitmapData(_loc2_.content);
         _loc2_ = BitmapDataAsset(param1.getAssetByName("memenu_settings_slider_button"));
         var_604 = BitmapData(_loc2_.content);
      }
      
      public function set max(param1:Number) : void
      {
         var_1054 = param1;
         setValue(var_915.volume);
      }
      
      public function dispose() : void
      {
         var_915 = null;
         _sliderContainer = null;
         var_603 = null;
         var_604 = null;
      }
      
      private function getSliderPosition(param1:Number) : int
      {
         return int(var_1501 * (Number(param1 - var_712) / (var_1054 - var_712)));
      }
      
      public function set min(param1:Number) : void
      {
         var_712 = param1;
         setValue(var_915.volume);
      }
      
      public function setValue(param1:Number) : void
      {
         if(_sliderContainer == null)
         {
            return;
         }
         var _loc2_:IWindow = _sliderContainer.findChildByName("slider_button");
         if(_loc2_ != null)
         {
            _loc2_.x = getSliderPosition(param1);
         }
      }
      
      private function getValue(param1:Number) : Number
      {
         return param1 / var_1501 * (var_1054 - var_712) + var_712;
      }
   }
}
