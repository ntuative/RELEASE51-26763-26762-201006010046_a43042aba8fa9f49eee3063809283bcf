package com.sulake.habbo.communication.encryption
{
   public class PseudoRandom
   {
      
      private static const const_1137:int = 19979;
      
      private static const const_1138:int = 5;
       
      
      private var seed:int;
      
      private var modulus:int;
      
      public function PseudoRandom(param1:int, param2:int)
      {
         super();
         this.seed = param1;
         this.modulus = param2;
      }
      
      public function nextInt() : int
      {
         var _loc1_:int = Math.abs(const_1137 * seed + const_1138) % modulus;
         seed = _loc1_;
         return _loc1_;
      }
   }
}
