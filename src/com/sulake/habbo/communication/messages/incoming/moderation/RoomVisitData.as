package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_699:String;
      
      private var var_1912:int;
      
      private var var_1500:Boolean;
      
      private var _roomId:int;
      
      private var var_1911:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1500 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_699 = param1.readString();
         var_1911 = param1.readInteger();
         var_1912 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1500;
      }
      
      public function get roomName() : String
      {
         return var_699;
      }
      
      public function get enterMinute() : int
      {
         return var_1912;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_1911;
      }
   }
}
