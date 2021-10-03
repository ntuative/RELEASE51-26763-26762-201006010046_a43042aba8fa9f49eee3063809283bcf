package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1304:int;
      
      private var var_2053:int = -1;
      
      private var var_163:int;
      
      private var var_1907:int;
      
      private var var_1661:int;
      
      private var _offerId:int;
      
      private var var_1305:int;
      
      private var var_1662:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         _offerId = param1;
         var_1662 = param2;
         var_1661 = param3;
         var_1304 = param4;
         var_163 = param5;
         var_2053 = param6;
         var_1907 = param7;
         var_1305 = param8;
      }
      
      public function get status() : int
      {
         return var_163;
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
      
      public function get averagePrice() : int
      {
         return var_1907;
      }
      
      public function get furniId() : int
      {
         return var_1662;
      }
   }
}
