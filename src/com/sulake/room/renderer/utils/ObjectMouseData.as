package com.sulake.room.renderer.utils
{
   public class ObjectMouseData
   {
       
      
      private var var_1884:String = "";
      
      private var var_154:String = "";
      
      public function ObjectMouseData()
      {
         super();
      }
      
      public function set spriteTag(param1:String) : void
      {
         var_1884 = param1;
      }
      
      public function set objectId(param1:String) : void
      {
         var_154 = param1;
      }
      
      public function get spriteTag() : String
      {
         return var_1884;
      }
      
      public function get objectId() : String
      {
         return var_154;
      }
   }
}
