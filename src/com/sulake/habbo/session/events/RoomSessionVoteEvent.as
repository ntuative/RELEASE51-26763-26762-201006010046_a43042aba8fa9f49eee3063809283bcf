package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_135:String = "RSPE_VOTE_RESULT";
      
      public static const const_116:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1278:int = 0;
      
      private var var_1000:String = "";
      
      private var var_761:Array;
      
      private var var_1071:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_1071 = [];
         var_761 = [];
         super(param1,param2,param7,param8);
         var_1000 = param3;
         var_1071 = param4;
         var_761 = param5;
         if(var_761 == null)
         {
            var_761 = [];
         }
         var_1278 = param6;
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
