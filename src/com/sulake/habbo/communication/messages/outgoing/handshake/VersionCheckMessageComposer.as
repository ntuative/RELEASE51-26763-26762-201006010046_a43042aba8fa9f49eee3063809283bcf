package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_1815:String;
      
      private var var_1145:String;
      
      private var var_1816:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_1816 = param1;
         var_1145 = param2;
         var_1815 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1816,var_1145,var_1815];
      }
      
      public function dispose() : void
      {
      }
   }
}
