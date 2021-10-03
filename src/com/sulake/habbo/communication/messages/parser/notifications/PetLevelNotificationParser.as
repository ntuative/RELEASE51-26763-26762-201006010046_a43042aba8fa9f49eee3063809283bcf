package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_313:String;
      
      private var var_1677:int;
      
      private var var_2239:String;
      
      private var var_1092:int;
      
      private var var_1273:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1273;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1273 = param1.readInteger();
         var_2239 = param1.readString();
         var_1677 = param1.readInteger();
         var_313 = param1.readString();
         var_1092 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_2239;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_313;
      }
      
      public function get petType() : int
      {
         return var_1092;
      }
      
      public function get level() : int
      {
         return var_1677;
      }
   }
}
