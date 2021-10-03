package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_1924:Number = 0.0;
      
      private var var_1923:Number = 0.0;
      
      private var var_1925:Number = 0.0;
      
      private var var_1926:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1923 = param1;
         var_1925 = param2;
         var_1924 = param3;
         var_1926 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1923;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1924;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1925;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1926;
      }
   }
}
