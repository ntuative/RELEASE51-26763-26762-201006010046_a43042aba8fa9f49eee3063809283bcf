package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1773:int;
      
      private var var_1774:String;
      
      private var var_1106:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1106 = param1.readInteger();
         this.var_1774 = param1.readString();
         this.var_1773 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_1106;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_1773;
      }
      
      public function get requesterName() : String
      {
         return this.var_1774;
      }
   }
}
