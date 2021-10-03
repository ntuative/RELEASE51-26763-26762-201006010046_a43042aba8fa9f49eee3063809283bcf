package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1668:String;
      
      private var var_313:String;
      
      private var var_570:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         var_313 = param1;
         var_570 = param2;
         var_1668 = param3;
      }
      
      public function get race() : String
      {
         return var_1668;
      }
      
      public function get figure() : String
      {
         return var_313;
      }
      
      public function get gender() : String
      {
         return var_570;
      }
   }
}
