package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_243:String = "e";
      
      public static const const_86:String = "i";
      
      public static const const_84:String = "s";
       
      
      private var var_1082:String;
      
      private var var_1299:String;
      
      private var var_1300:int;
      
      private var var_1849:int;
      
      private var var_1081:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1299 = param1.readString();
         var_1849 = param1.readInteger();
         var_1082 = param1.readString();
         var_1081 = param1.readInteger();
         var_1300 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_1081;
      }
      
      public function get productType() : String
      {
         return var_1299;
      }
      
      public function get expiration() : int
      {
         return var_1300;
      }
      
      public function get furniClassId() : int
      {
         return var_1849;
      }
      
      public function get extraParam() : String
      {
         return var_1082;
      }
   }
}
