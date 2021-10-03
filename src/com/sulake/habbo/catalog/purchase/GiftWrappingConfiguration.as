package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_587:Array;
      
      private var var_1304:int;
      
      private var var_1477:Array;
      
      private var var_588:Array;
      
      private var var_1165:Boolean = false;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var_1165 = _loc2_.isWrappingEnabled;
         var_1304 = _loc2_.wrappingPrice;
         var_1477 = _loc2_.stuffTypes;
         var_588 = _loc2_.boxTypes;
         var_587 = _loc2_.ribbonTypes;
      }
      
      public function get ribbonTypes() : Array
      {
         return var_587;
      }
      
      public function get stuffTypes() : Array
      {
         return var_1477;
      }
      
      public function get price() : int
      {
         return var_1304;
      }
      
      public function get boxTypes() : Array
      {
         return var_588;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1165;
      }
   }
}
