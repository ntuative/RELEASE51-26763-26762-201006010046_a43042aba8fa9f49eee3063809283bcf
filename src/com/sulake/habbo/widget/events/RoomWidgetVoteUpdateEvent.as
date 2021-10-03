package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_135:String = "RWPUE_VOTE_RESULT";
      
      public static const const_116:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1278:int;
      
      private var var_1000:String;
      
      private var var_761:Array;
      
      private var var_1071:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_1000 = param2;
         var_1071 = param3;
         var_761 = param4;
         if(var_761 == null)
         {
            var_761 = [];
         }
         var_1278 = param5;
      }
      
      public function get votes() : Array
      {
         return var_761.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1278;
      }
      
      public function get question() : String
      {
         return var_1000;
      }
      
      public function get choices() : Array
      {
         return var_1071.slice();
      }
   }
}
