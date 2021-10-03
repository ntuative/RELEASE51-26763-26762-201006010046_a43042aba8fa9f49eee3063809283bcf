package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneBitmapMask
   {
       
      
      private var var_1923:Number = 0.0;
      
      private var _type:String = null;
      
      private var var_1925:Number = 0.0;
      
      public function RoomPlaneBitmapMask(param1:String, param2:Number, param3:Number)
      {
         super();
         _type = param1;
         var_1923 = param2;
         var_1925 = param3;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1923;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1925;
      }
   }
}
