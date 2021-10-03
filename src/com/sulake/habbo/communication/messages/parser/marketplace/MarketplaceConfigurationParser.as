package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1657:int;
      
      private var var_1590:int;
      
      private var var_1659:int;
      
      private var var_1658:int;
      
      private var var_1660:int;
      
      private var var_1591:int;
      
      private var var_1656:int;
      
      private var var_1165:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1657;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1590;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1656;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1658;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1660;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1591;
      }
      
      public function get commission() : int
      {
         return var_1659;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1165 = param1.readBoolean();
         var_1659 = param1.readInteger();
         var_1590 = param1.readInteger();
         var_1591 = param1.readInteger();
         var_1658 = param1.readInteger();
         var_1657 = param1.readInteger();
         var_1660 = param1.readInteger();
         var_1656 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1165;
      }
   }
}
