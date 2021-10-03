package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_418:FloorRasterizer;
      
      private var var_803:Boolean = false;
      
      private var var_602:PlaneMaskManager;
      
      private var var_416:WallRasterizer;
      
      private var var_601:WallAdRasterizer;
      
      private var var_417:LandscapeRasterizer;
      
      public function RoomVisualizationData()
      {
         super();
         var_416 = new WallRasterizer();
         var_418 = new FloorRasterizer();
         var_601 = new WallAdRasterizer();
         var_417 = new LandscapeRasterizer();
         var_602 = new PlaneMaskManager();
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return var_416;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return var_601;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return var_418;
      }
      
      public function get initialized() : Boolean
      {
         return var_803;
      }
      
      protected function reset() : void
      {
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return var_602;
      }
      
      public function dispose() : void
      {
         if(var_416 != null)
         {
            var_416.dispose();
            var_416 = null;
         }
         if(var_418 != null)
         {
            var_418.dispose();
            var_418 = null;
         }
         if(var_601 != null)
         {
            var_601.dispose();
            var_601 = null;
         }
         if(var_417 != null)
         {
            var_417.dispose();
            var_417 = null;
         }
         if(var_602 != null)
         {
            var_602.dispose();
            var_602 = null;
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            var_416.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            var_418.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            var_601.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            var_417.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            var_602.initialize(_loc11_);
         }
         return true;
      }
      
      public function clearCache() : void
      {
         if(var_416 != null)
         {
            var_416.clearCache();
         }
         if(var_418 != null)
         {
            var_418.clearCache();
         }
         if(var_417 != null)
         {
            var_417.clearCache();
         }
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return var_417;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(var_803)
         {
            return;
         }
         var_416.initializeAssetCollection(param1);
         var_418.initializeAssetCollection(param1);
         var_601.initializeAssetCollection(param1);
         var_417.initializeAssetCollection(param1);
         var_602.initializeAssetCollection(param1);
         var_803 = true;
      }
   }
}
