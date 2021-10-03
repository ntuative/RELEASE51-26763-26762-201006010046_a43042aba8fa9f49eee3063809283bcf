package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_987:Boolean;
      
      private var var_1352:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_987 = param1.readInteger() > 0;
         var_1352 = param1.readInteger() > 0;
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_987;
      }
      
      public function get onShutDown() : Boolean
      {
         return var_1352;
      }
      
      public function flush() : Boolean
      {
         var_987 = false;
         var_1352 = false;
         return true;
      }
   }
}
