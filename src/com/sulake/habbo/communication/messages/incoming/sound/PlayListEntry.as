package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1648:int;
      
      private var var_1645:int = 0;
      
      private var var_1646:String;
      
      private var var_1647:int;
      
      private var var_1649:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1648 = param1;
         var_1647 = param2;
         var_1649 = param3;
         var_1646 = param4;
      }
      
      public function get length() : int
      {
         return var_1647;
      }
      
      public function get name() : String
      {
         return var_1649;
      }
      
      public function get creator() : String
      {
         return var_1646;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_1645;
      }
      
      public function get id() : int
      {
         return var_1648;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_1645 = param1;
      }
   }
}
