package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class SetClothingChangeDataMessageComposer implements IMessageComposer
   {
       
      
      private var var_570:String;
      
      private var var_154:int;
      
      private var var_2189:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      public function SetClothingChangeDataMessageComposer(param1:int, param2:String, param3:String = "", param4:int = 0, param5:int = 0)
      {
         super();
         var_154 = param1;
         var_570 = param2;
         var_2189 = param3;
         _roomId = param4;
         _roomCategory = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_154,var_570,var_2189];
      }
      
      public function dispose() : void
      {
      }
   }
}
