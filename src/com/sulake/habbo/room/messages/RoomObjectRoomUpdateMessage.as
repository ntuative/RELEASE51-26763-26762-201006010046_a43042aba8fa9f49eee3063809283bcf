package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectRoomUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_658:String = "RORUM_ROOM_FLOOR_UPDATE";
      
      public static const const_692:String = "RORUM_ROOM_LANDSCAPE_UPDATE";
      
      public static const const_725:String = "RORUM_ROOM_WALL_UPDATE";
       
      
      private var _type:String = "";
      
      private var var_185:String = "";
      
      public function RoomObjectRoomUpdateMessage(param1:String, param2:String)
      {
         super(null,null);
         _type = param1;
         var_185 = param2;
      }
      
      public function get value() : String
      {
         return var_185;
      }
      
      public function get type() : String
      {
         return _type;
      }
   }
}
