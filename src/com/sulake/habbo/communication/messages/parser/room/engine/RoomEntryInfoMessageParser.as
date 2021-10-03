package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2121:int;
      
      private var var_405:Boolean;
      
      private var var_2120:Boolean;
      
      private var var_921:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2120 = param1.readBoolean();
         if(var_2120)
         {
            var_2121 = param1.readInteger();
            var_405 = param1.readBoolean();
         }
         else
         {
            var_921 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_921 != null)
         {
            var_921.dispose();
            var_921 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_2121;
      }
      
      public function get owner() : Boolean
      {
         return var_405;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_2120;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_921;
      }
   }
}
