package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   
   public class ClubGiftSelectedParser implements IMessageParser
   {
       
      
      private var var_914:Array;
      
      private var var_1152:String;
      
      public function ClubGiftSelectedParser()
      {
         super();
      }
      
      public function get products() : Array
      {
         return var_914;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_914 = new Array();
         var_1152 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_914.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_914 = [];
         return true;
      }
      
      public function get productCode() : String
      {
         return var_1152;
      }
   }
}
