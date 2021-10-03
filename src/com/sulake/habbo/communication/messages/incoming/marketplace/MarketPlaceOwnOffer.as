package com.sulake.habbo.communication.messages.incoming.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOwnOffer
   {
      
      public static const const_1639:int = 2;
      
      public static const const_1575:int = 1;
      
      public static const const_1486:int = 0;
       
      
      private var var_1304:int;
      
      private var var_163:int;
      
      private var var_2403:int;
      
      private var _offerId:int;
      
      private var var_1661:int;
      
      private var var_1662:int;
      
      private var _image:BitmapData;
      
      public function MarketPlaceOwnOffer(param1:int, param2:int, param3:int, param4:int)
      {
         super();
         _offerId = param1;
         var_1662 = param2;
         var_1661 = param3;
         var_1304 = param4;
      }
      
      public function get furniId() : int
      {
         return var_1662;
      }
      
      public function get furniType() : int
      {
         return var_1661;
      }
      
      public function get price() : int
      {
         return var_1304;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
   }
}
