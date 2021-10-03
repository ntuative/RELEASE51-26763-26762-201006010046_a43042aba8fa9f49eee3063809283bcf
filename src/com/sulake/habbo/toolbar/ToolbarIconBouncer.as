package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_1880:Number;
      
      private var var_595:Number = 0;
      
      private var var_1879:Number;
      
      private var var_596:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_1880 = param1;
         var_1879 = param2;
      }
      
      public function update() : void
      {
         var_596 += var_1879;
         var_595 += var_596;
         if(var_595 > 0)
         {
            var_595 = 0;
            var_596 = var_1880 * -1 * var_596;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_596 = param1;
         var_595 = 0;
      }
      
      public function get location() : Number
      {
         return var_595;
      }
   }
}
