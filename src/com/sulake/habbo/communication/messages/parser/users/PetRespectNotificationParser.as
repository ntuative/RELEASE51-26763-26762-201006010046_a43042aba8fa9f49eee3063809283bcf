package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1830:int;
      
      private var var_1215:PetData;
      
      private var var_1829:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1830;
      }
      
      public function get petData() : PetData
      {
         return var_1215;
      }
      
      public function flush() : Boolean
      {
         var_1215 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_1829;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1830 = param1.readInteger();
         var_1829 = param1.readInteger();
         var_1215 = new PetData(param1);
         return true;
      }
   }
}
