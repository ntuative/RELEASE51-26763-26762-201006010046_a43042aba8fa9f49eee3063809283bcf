package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1866:int;
      
      private var var_1304:int;
      
      private var var_1865:int;
      
      private var _offerId:int;
      
      private var var_1863:int;
      
      private var var_1867:int;
      
      private var var_1864:Boolean;
      
      private var var_1862:int;
      
      private var var_1868:Boolean;
      
      private var var_1152:String;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1152 = param1.readString();
         var_1304 = param1.readInteger();
         var_1868 = param1.readBoolean();
         var_1864 = param1.readBoolean();
         var_1865 = param1.readInteger();
         var_1862 = param1.readInteger();
         var_1863 = param1.readInteger();
         var_1866 = param1.readInteger();
         var_1867 = param1.readInteger();
      }
      
      public function get year() : int
      {
         return var_1863;
      }
      
      public function get month() : int
      {
         return var_1866;
      }
      
      public function get price() : int
      {
         return var_1304;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get periods() : int
      {
         return var_1865;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1862;
      }
      
      public function get upgrade() : Boolean
      {
         return var_1868;
      }
      
      public function get day() : int
      {
         return var_1867;
      }
      
      public function get vip() : Boolean
      {
         return var_1864;
      }
      
      public function get productCode() : String
      {
         return var_1152;
      }
   }
}
