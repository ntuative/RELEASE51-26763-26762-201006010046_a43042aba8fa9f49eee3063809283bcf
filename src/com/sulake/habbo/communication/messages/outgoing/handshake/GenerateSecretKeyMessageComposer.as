package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class GenerateSecretKeyMessageComposer implements IMessageComposer
   {
       
      
      private var var_1819:String;
      
      public function GenerateSecretKeyMessageComposer(param1:String)
      {
         super();
         var_1819 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1819];
      }
      
      public function dispose() : void
      {
      }
   }
}
