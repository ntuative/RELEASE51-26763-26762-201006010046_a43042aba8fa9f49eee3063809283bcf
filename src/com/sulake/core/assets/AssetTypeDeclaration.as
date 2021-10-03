package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2138:Class;
      
      private var var_2137:Class;
      
      private var var_2136:String;
      
      private var var_1349:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_2136 = param1;
         var_2137 = param2;
         var_2138 = param3;
         if(rest == null)
         {
            var_1349 = new Array();
         }
         else
         {
            var_1349 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_2138;
      }
      
      public function get assetClass() : Class
      {
         return var_2137;
      }
      
      public function get mimeType() : String
      {
         return var_2136;
      }
      
      public function get fileTypes() : Array
      {
         return var_1349;
      }
   }
}
