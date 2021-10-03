package com.sulake.habbo.room.object.visualization.furniture
{
   import com.sulake.habbo.room.object.visualization.furniture.data.AnimationFrame;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   
   public class AnimatedFurnitureVisualization extends FurnitureVisualization
   {
       
      
      private var var_1478:int = 0;
      
      private var var_1872:Number = 0;
      
      private var _lastFramePlayed:Array;
      
      private var var_494:int = 0;
      
      private var var_589:AnimatedFurnitureVisualizationData = null;
      
      private var var_303:Array;
      
      private var var_590:Boolean = false;
      
      public function AnimatedFurnitureVisualization()
      {
         var_303 = [];
         _lastFramePlayed = [];
         super();
      }
      
      public function get animationId() : int
      {
         return var_1478;
      }
      
      protected function setAnimation(param1:int) : void
      {
         var_1478 = param1;
         var_494 = 0;
         var_303 = [];
         _lastFramePlayed = [];
         var_590 = false;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_589 = null;
         var_303 = null;
         _lastFramePlayed = null;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         if(!(param1 is AnimatedFurnitureVisualizationData))
         {
            return false;
         }
         var_589 = param1 as AnimatedFurnitureVisualizationData;
         return super.initialize(param1);
      }
      
      override protected function updateObject(param1:Number, param2:Number) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(super.updateObject(param1,param2))
         {
            _loc3_ = object;
            if(_loc3_ == null)
            {
               return false;
            }
            _loc4_ = _loc3_.getState(0);
            if(_loc4_ != var_1478)
            {
               setAnimation(_loc4_);
            }
            return true;
         }
         return false;
      }
      
      override protected function getFrameNumber(param1:int, param2:int) : int
      {
         var _loc3_:* = null;
         if(param1 >= 0 && param1 < var_303.length)
         {
            _loc3_ = var_303[param1] as AnimationFrame;
            if(_loc3_ != null)
            {
               return _loc3_.id;
            }
         }
         return super.getFrameNumber(param1,param2);
      }
      
      protected function getLastFramePlayed(param1:int) : Boolean
      {
         if(param1 < 0 || param1 >= _lastFramePlayed.length)
         {
            return false;
         }
         return _lastFramePlayed[param1];
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(var_589 == null)
         {
            return false;
         }
         if(param1 != var_1872)
         {
            var_303 = [];
            _lastFramePlayed = [];
            var_590 = false;
         }
         if(var_590)
         {
            return false;
         }
         if(var_494 == 0)
         {
            var_494 = var_589.getStartFrame(animationId,param1);
         }
         var_494 += 1;
         var _loc3_:Boolean = false;
         var_590 = true;
         var _loc4_:int = var_589.getLayerCount(param1) - 1;
         while(_loc4_ >= 0)
         {
            _loc5_ = null;
            if(_loc4_ < var_303.length)
            {
               _loc5_ = var_303[_loc4_] as AnimationFrame;
            }
            _lastFramePlayed[_loc4_] = false;
            if(_loc5_ != null)
            {
               if(_loc5_.isLastFrame && _loc5_.remainingFrameRepeats <= 1)
               {
                  _lastFramePlayed[_loc4_] = true;
               }
            }
            if(_loc5_ == null || _loc5_.remainingFrameRepeats >= 0 && _loc7_ <= 0)
            {
               _loc6_ = 0;
               if(_loc5_ != null)
               {
                  _loc6_ = _loc5_.activeSequence;
               }
               if(_loc6_ == AnimationFrame.const_871)
               {
                  _loc5_ = var_589.getFrame(_loc4_,animationId,var_494,param1);
               }
               else
               {
                  _loc5_ = var_589.getFrameFromSequence(_loc4_,animationId,_loc6_,_loc5_.activeSequenceOffset + 1,var_494,param1);
               }
               var_303[_loc4_] = _loc5_;
               if(_loc5_ != null)
               {
                  _loc3_ = true;
               }
            }
            if(_loc5_ == null)
            {
               _lastFramePlayed[_loc4_] = true;
            }
            else if(_loc5_.remainingFrameRepeats >= 0)
            {
               var_590 = false;
            }
            _loc4_--;
         }
         var_1872 = param1;
         return _loc3_;
      }
   }
}
