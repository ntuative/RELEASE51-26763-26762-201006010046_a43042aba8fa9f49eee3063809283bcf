package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1493:Array;
      
      private var var_1907:int;
      
      private var var_1906:int;
      
      private var var_1905:int;
      
      private var var_1909:int;
      
      private var _dayOffsets:Array;
      
      private var var_1908:int;
      
      private var var_1492:Array;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1493;
      }
      
      public function set averagePrices(param1:Array) : void
      {
         var_1493 = param1.slice();
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         _dayOffsets = param1.slice();
      }
      
      public function get furniTypeId() : int
      {
         return var_1906;
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         var_1492 = param1.slice();
      }
      
      public function set averagePrice(param1:int) : void
      {
         var_1907 = param1;
      }
      
      public function get historyLength() : int
      {
         return var_1905;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1909;
      }
      
      public function get offerCount() : int
      {
         return var_1908;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1908 = param1;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1492;
      }
      
      public function get averagePrice() : int
      {
         return var_1907;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         var_1909 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         var_1905 = param1;
      }
      
      public function set furniTypeId(param1:int) : void
      {
         var_1906 = param1;
      }
   }
}
