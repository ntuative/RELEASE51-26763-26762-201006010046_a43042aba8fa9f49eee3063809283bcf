package com.sulake.habbo.communication.messages.outgoing.room.session
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenConnectionMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int;
      
      private var var_1993:int;
      
      private var var_1992:Boolean;
      
      public function OpenConnectionMessageComposer(param1:Boolean, param2:int, param3:int = 0)
      {
         super();
         _roomId = param2;
         var_1992 = param1;
         var_1993 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [int(var_1992),_roomId,var_1993];
      }
      
      public function dispose() : void
      {
      }
   }
}
