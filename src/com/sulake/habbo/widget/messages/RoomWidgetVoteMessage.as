package com.sulake.habbo.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_136:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_1262:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_136);
         var_1262 = param1;
      }
      
      public function get vote() : int
      {
         return var_1262;
      }
   }
}
