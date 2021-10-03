package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1814:String;
      
      private var var_570:String;
      
      private var var_1439:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         var_1439 = param1.readInteger();
         var_1814 = param1.readString();
         var_570 = param1.readString();
      }
      
      public function get gender() : String
      {
         return var_570;
      }
      
      public function get figureString() : String
      {
         return var_1814;
      }
      
      public function get slotId() : int
      {
         return var_1439;
      }
   }
}
