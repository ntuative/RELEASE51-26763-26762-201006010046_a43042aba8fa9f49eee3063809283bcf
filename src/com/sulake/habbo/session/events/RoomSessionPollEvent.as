package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPollEvent extends RoomSessionEvent
   {
      
      public static const const_142:String = "RSPE_POLL_CONTENT";
      
      public static const const_138:String = "RSPE_POLL_OFFER";
      
      public static const const_65:String = "RSPE_POLL_ERROR";
       
      
      private var var_1112:Array = null;
      
      private var var_1375:String = "";
      
      private var var_1359:String;
      
      private var var_1374:String = "";
      
      private var var_1111:int = 0;
      
      private var _id:int = -1;
      
      public function RoomSessionPollEvent(param1:String, param2:IRoomSession, param3:int)
      {
         _id = param3;
         super(param1,param2);
      }
      
      public function get questionArray() : Array
      {
         return var_1112;
      }
      
      public function get startMessage() : String
      {
         return var_1375;
      }
      
      public function get summary() : String
      {
         return var_1359;
      }
      
      public function set startMessage(param1:String) : void
      {
         var_1375 = param1;
      }
      
      public function set numQuestions(param1:int) : void
      {
         var_1111 = param1;
      }
      
      public function set summary(param1:String) : void
      {
         var_1359 = param1;
      }
      
      public function get numQuestions() : int
      {
         return var_1111;
      }
      
      public function set endMessage(param1:String) : void
      {
         var_1374 = param1;
      }
      
      public function get endMessage() : String
      {
         return var_1374;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set questionArray(param1:Array) : void
      {
         var_1112 = param1;
      }
   }
}
