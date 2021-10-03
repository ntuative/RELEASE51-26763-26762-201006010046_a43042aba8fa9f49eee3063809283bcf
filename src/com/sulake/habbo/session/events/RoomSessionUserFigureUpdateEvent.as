package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionUserFigureUpdateEvent extends RoomSessionEvent
   {
      
      public static const const_156:String = "RSUBE_FIGURE";
       
      
      private var var_570:String = "";
      
      private var var_313:String = "";
      
      private var _userId:int = 0;
      
      public function RoomSessionUserFigureUpdateEvent(param1:IRoomSession, param2:int, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_156,param1,param5,param6);
         _userId = param2;
         var_313 = param3;
         var_570 = param4;
      }
      
      public function get gender() : String
      {
         return var_570;
      }
      
      public function get figure() : String
      {
         return var_313;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
