package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_2095:int;
      
      private var var_1075:int;
      
      private var var_2096:int;
      
      private var var_1570:int;
      
      private var var_115:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1570 = param1.readInteger();
         var_2096 = param1.readInteger();
         var_1075 = param1.readInteger();
         var_2095 = param1.readInteger();
         var_115 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1570);
      }
      
      public function get chatRecordId() : int
      {
         return var_2095;
      }
      
      public function get reportedUserId() : int
      {
         return var_1075;
      }
      
      public function get callerUserId() : int
      {
         return var_2096;
      }
      
      public function get callId() : int
      {
         return var_1570;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_115;
      }
   }
}
