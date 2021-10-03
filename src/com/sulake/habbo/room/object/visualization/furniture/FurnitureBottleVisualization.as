package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1121:int = -1;
      
      private static const const_798:int = 20;
      
      private static const const_520:int = 9;
       
      
      private var var_636:Boolean = false;
      
      private var var_246:Array;
      
      public function FurnitureBottleVisualization()
      {
         var_246 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            var_636 = true;
            var_246 = new Array();
            var_246.push(const_1121);
            return;
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(var_636)
            {
               var_636 = false;
               var_246 = new Array();
               var_246.push(const_798);
               var_246.push(const_520 + param1);
               var_246.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(0))
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
