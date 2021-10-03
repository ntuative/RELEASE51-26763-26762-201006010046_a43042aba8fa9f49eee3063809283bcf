package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInventoryMessageParser implements IMessageParser
   {
       
      
      private var var_1077:Array;
      
      public function PetInventoryMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:* = null;
         var_1077 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new PetData(param1);
            var_1077.push(_loc4_);
            _loc3_++;
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_1077 = [];
         return true;
      }
      
      public function get pets() : Array
      {
         return var_1077;
      }
   }
}
