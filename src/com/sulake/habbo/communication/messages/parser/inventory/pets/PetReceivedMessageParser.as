package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_1043:PetData;
      
      private var var_1482:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1482 = param1.readBoolean();
         var_1043 = new PetData(param1);
         Logger.log("Got PetReceived: " + var_1482 + ", " + var_1043.id + ", " + var_1043.name + ", " + pet.figure + ", " + var_1043.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1482;
      }
      
      public function get pet() : PetData
      {
         return var_1043;
      }
   }
}
