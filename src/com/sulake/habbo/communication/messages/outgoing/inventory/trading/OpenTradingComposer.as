package com.sulake.habbo.communication.messages.outgoing.inventory.trading
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenTradingComposer implements IMessageComposer
   {
       
      
      private var var_2190:int;
      
      public function OpenTradingComposer(param1:int)
      {
         super();
         var_2190 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [var_2190];
      }
   }
}
