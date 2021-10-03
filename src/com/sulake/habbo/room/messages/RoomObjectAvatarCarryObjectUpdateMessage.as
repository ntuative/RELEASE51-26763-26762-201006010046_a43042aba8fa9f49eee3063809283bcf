package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1095:int;
      
      private var var_1335:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_1095 = param1;
         var_1335 = param2;
      }
      
      public function get itemType() : int
      {
         return var_1095;
      }
      
      public function get itemName() : String
      {
         return var_1335;
      }
   }
}
