package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_680:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_680 = new ByteArray();
         var_680.writeShort(param1);
         var_680.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_680.position = 0;
         if(false)
         {
            _loc1_ = var_680.readShort();
            var_680.position = 0;
         }
         return _loc1_;
      }
   }
}
