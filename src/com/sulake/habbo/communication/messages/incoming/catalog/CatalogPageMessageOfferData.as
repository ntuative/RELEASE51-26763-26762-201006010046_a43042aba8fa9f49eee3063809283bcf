package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_914:Array;
      
      private var var_937:int;
      
      private var var_1373:String;
      
      private var _offerId:int;
      
      private var var_936:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1373 = param1.readString();
         var_937 = param1.readInteger();
         var_936 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_914 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_914.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_914;
      }
      
      public function get priceInCredits() : int
      {
         return var_937;
      }
      
      public function get localizationId() : String
      {
         return var_1373;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_936;
      }
   }
}
