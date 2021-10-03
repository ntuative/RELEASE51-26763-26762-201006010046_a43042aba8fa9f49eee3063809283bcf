package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1910:Date;
      
      private var var_1230:Boolean = false;
      
      private var _type:int;
      
      private var var_379:BitmapData;
      
      private var var_286:Boolean = false;
      
      private var var_1219:int;
      
      private var var_600:int = 1;
      
      private var var_1049:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_379;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_600;
         if(var_600 < 0)
         {
            var_600 = 0;
         }
         var_1049 = var_1219;
         var_286 = false;
         var_1230 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_1049 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return var_286;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_379 = param1;
      }
      
      public function get duration() : int
      {
         return var_1219;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1230;
      }
      
      public function get effectsInInventory() : int
      {
         return var_600;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_379;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_286)
         {
            var_1910 = new Date();
         }
         var_286 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_600 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_286)
         {
            _loc1_ = var_1049 - (new Date().valueOf() - var_1910.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_1049;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1230 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1219 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
