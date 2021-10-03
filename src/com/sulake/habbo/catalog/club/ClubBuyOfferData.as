package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var var_1866:int;
      
      private var var_2006:Boolean = false;
      
      private var var_1865:int;
      
      private var var_1863:int;
      
      private var var_1862:int;
      
      private var var_1152:String;
      
      private var var_1304:int;
      
      private var _offerId:int;
      
      private var var_1867:int;
      
      private var var_1864:Boolean;
      
      private var var_1868:Boolean;
      
      private var var_388:ICatalogPage;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         _offerId = param1;
         var_1152 = param2;
         var_1304 = param3;
         var_1868 = param4;
         var_1864 = param5;
         var_1865 = param6;
         var_1862 = param7;
         var_1863 = param8;
         var_1866 = param9;
         var_1867 = param10;
      }
      
      public function get month() : int
      {
         return var_1866;
      }
      
      public function get page() : ICatalogPage
      {
         return var_388;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get vip() : Boolean
      {
         return var_1864;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         var_388 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function get priceInPixels() : int
      {
         return 0;
      }
      
      public function get priceType() : String
      {
         return Offer.const_315;
      }
      
      public function get upgrade() : Boolean
      {
         return var_1868;
      }
      
      public function get localizationId() : String
      {
         return var_1152;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1862;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return var_2006;
      }
      
      public function get day() : int
      {
         return var_1867;
      }
      
      public function get year() : int
      {
         return var_1863;
      }
      
      public function get price() : int
      {
         return var_1304;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         var_2006 = param1;
      }
      
      public function get periods() : int
      {
         return var_1865;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get priceInCredits() : int
      {
         return var_1304;
      }
      
      public function get productCode() : String
      {
         return var_1152;
      }
   }
}
