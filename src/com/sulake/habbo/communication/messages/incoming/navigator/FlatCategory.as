package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_374:Boolean;
      
      private var var_1186:int;
      
      private var var_1494:String;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         var_1186 = param1.readInteger();
         var_1494 = param1.readString();
         var_374 = param1.readBoolean();
      }
      
      public function get visible() : Boolean
      {
         return var_374;
      }
      
      public function get nodeName() : String
      {
         return var_1494;
      }
      
      public function get nodeId() : int
      {
         return var_1186;
      }
   }
}
