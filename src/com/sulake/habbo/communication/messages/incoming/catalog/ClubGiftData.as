package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_2299:int;
      
      private var var_2298:Boolean;
      
      private var _offerId:int;
      
      private var var_1851:Boolean;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_2298 = param1.readBoolean();
         var_2299 = param1.readInteger();
         var_1851 = param1.readBoolean();
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1851;
      }
      
      public function get monthsRequired() : int
      {
         return var_2299;
      }
      
      public function get isVip() : Boolean
      {
         return var_2298;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
   }
}
