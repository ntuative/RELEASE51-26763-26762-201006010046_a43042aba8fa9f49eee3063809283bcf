package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData
   {
       
      
      private var var_2054:int;
      
      private var var_1304:int;
      
      private var var_1907:int;
      
      private var var_2053:int = -1;
      
      private var var_163:int;
      
      private var var_1661:int;
      
      private var _image:BitmapData;
      
      private var _offerId:int;
      
      private var var_1305:int;
      
      private var var_1662:int;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int = -1)
      {
         super();
         _offerId = param1;
         var_1662 = param2;
         var_1661 = param3;
         var_1304 = param4;
         var_163 = param5;
         var_1907 = param6;
         var_1305 = param7;
      }
      
      public function set imageCallback(param1:int) : void
      {
         var_2054 = param1;
      }
      
      public function get imageCallback() : int
      {
         return var_2054;
      }
      
      public function get price() : int
      {
         return var_1304;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_2053;
      }
      
      public function get offerCount() : int
      {
         return var_1305;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return var_1661;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         var_2053 = param1;
      }
      
      public function dispose() : void
      {
         if(_image)
         {
            _image.dispose();
            _image = null;
         }
      }
      
      public function set price(param1:int) : void
      {
         var_1304 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1305 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get status() : int
      {
         return var_163;
      }
      
      public function get averagePrice() : int
      {
         return var_1907;
      }
      
      public function set offerId(param1:int) : void
      {
         _offerId = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(_image != null)
         {
            _image.dispose();
         }
         _image = param1;
      }
      
      public function get furniId() : int
      {
         return var_1662;
      }
   }
}
