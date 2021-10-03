package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_366:Number = 0.5;
      
      private static const const_797:int = 3;
      
      private static const const_1147:Number = 1;
       
      
      private var var_2187:Boolean = false;
      
      private var var_2185:Boolean = false;
      
      private var var_1109:int = 0;
      
      private var var_285:Vector3d = null;
      
      private var var_2180:int = 0;
      
      private var var_2188:int = 0;
      
      private var var_2186:Boolean = false;
      
      private var var_2183:int = -2;
      
      private var var_2182:Boolean = false;
      
      private var var_2184:int = 0;
      
      private var var_2181:int = -1;
      
      private var var_441:Vector3d = null;
      
      private var var_2179:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_2180;
      }
      
      public function get targetId() : int
      {
         return var_2181;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_2184 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_2180 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_2187 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_2181 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_2185 = param1;
      }
      
      public function dispose() : void
      {
         var_441 = null;
         var_285 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_441 == null)
         {
            var_441 = new Vector3d();
         }
         var_441.assign(param1);
         var_1109 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_2183;
      }
      
      public function get screenHt() : int
      {
         return var_2179;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_2188 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_285;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_2179 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_2184;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_2187;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_2185;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_441 != null && var_285 != null)
         {
            ++var_1109;
            _loc2_ = Vector3d.dif(var_441,var_285);
            if(_loc2_.length <= const_366)
            {
               var_285 = var_441;
               var_441 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_366 * (const_797 + 1))
               {
                  _loc2_.mul(const_366);
               }
               else if(var_1109 <= const_797)
               {
                  _loc2_.mul(const_366);
               }
               else
               {
                  _loc2_.mul(const_1147);
               }
               var_285 = Vector3d.sum(var_285,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_2186 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_2188;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_2182 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_2183 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_285 != null)
         {
            return;
         }
         var_285 = new Vector3d();
         var_285.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_2186;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_2182;
      }
   }
}
