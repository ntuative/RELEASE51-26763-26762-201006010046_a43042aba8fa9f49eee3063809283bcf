package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1571:int;
      
      private var var_1572:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1571;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1571 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1571 = this.var_1571;
         _loc1_.var_1572 = this.var_1572;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1572 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1572;
      }
   }
}
