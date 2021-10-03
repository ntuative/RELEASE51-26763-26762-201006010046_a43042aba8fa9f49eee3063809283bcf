package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1832:int;
      
      private var var_1833:Boolean;
      
      private var var_1648:int;
      
      private var var_1411:String;
      
      private var var_1836:Boolean = false;
      
      private var var_1834:int;
      
      private var var_457:int;
      
      private var var_1095:String;
      
      private var var_1439:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1339:int;
      
      private var var_1831:Boolean;
      
      private var var_1835:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1832 = param1;
         var_1095 = param2;
         _objId = param3;
         var_1339 = param4;
         var_1411 = param5;
         var_1833 = param6;
         var_1831 = param7;
         var_1834 = param8;
         var_1439 = param9;
         var_1648 = param10;
         var_457 = -1;
      }
      
      public function get songId() : int
      {
         return var_1648;
      }
      
      public function get iconCallbackId() : int
      {
         return var_457;
      }
      
      public function get expiryTime() : int
      {
         return var_1834;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_1835 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_1836 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_457 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1831;
      }
      
      public function get slotId() : String
      {
         return var_1439;
      }
      
      public function get classId() : int
      {
         return var_1339;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1833;
      }
      
      public function get stuffData() : String
      {
         return var_1411;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1832;
      }
      
      public function get isLocked() : Boolean
      {
         return var_1836;
      }
      
      public function get prevCallbackId() : int
      {
         return var_1835;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_1095;
      }
   }
}
