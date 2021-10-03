package com.sulake.habbo.communication.messages.outgoing.room.avatar
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class SignMessageComposer implements IMessageComposer
   {
       
      
      private var var_1914:int;
      
      public function SignMessageComposer(param1:int)
      {
         super();
         var_1914 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1914];
      }
      
      public function dispose() : void
      {
      }
   }
}
