package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1148:int = 31;
      
      private static const const_1121:int = 32;
      
      private static const const_519:int = 30;
      
      private static const const_798:int = 20;
      
      private static const const_520:int = 10;
       
      
      private var var_636:Boolean = false;
      
      private var var_246:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_246 = new Array();
         super();
         super.setAnimation(const_519);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            var_636 = true;
            var_246 = new Array();
            var_246.push(const_1148);
            var_246.push(const_1121);
            return;
         }
         if(param1 > 0 && param1 <= const_520)
         {
            if(var_636)
            {
               var_636 = false;
               var_246 = new Array();
               if(_direction == 2)
               {
                  var_246.push(const_798 + 5 - param1);
                  var_246.push(const_520 + 5 - param1);
               }
               else
               {
                  var_246.push(const_798 + param1);
                  var_246.push(const_520 + param1);
               }
               var_246.push(const_519);
               return;
            }
            super.setAnimation(const_519);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
         {
            if(false)
            {
               super.setAnimation(var_246.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
