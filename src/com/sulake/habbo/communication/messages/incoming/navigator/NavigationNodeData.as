package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class NavigationNodeData
   {
       
      
      private var var_1186:int;
      
      private var var_1494:String;
      
      public function NavigationNodeData(param1:int, param2:String)
      {
         super();
         var_1186 = param1;
         var_1494 = param2;
         Logger.log("READ NODE: " + var_1186 + ", " + var_1494);
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
