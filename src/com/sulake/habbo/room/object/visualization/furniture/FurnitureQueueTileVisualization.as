package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1070:int = 1;
      
      private static const const_1121:int = 3;
      
      private static const const_1071:int = 2;
      
      private static const const_1072:int = 15;
       
      
      private var var_807:int;
      
      private var var_246:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_246 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1071)
         {
            var_246 = new Array();
            var_246.push(const_1070);
            var_807 = const_1072;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_807 > 0)
         {
            --var_807;
         }
         if(var_807 == 0)
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
