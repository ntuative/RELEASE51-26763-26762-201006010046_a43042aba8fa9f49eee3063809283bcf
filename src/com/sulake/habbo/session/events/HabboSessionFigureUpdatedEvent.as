package com.sulake.habbo.session.events
{
   import flash.events.Event;
   
   public class HabboSessionFigureUpdatedEvent extends Event
   {
      
      public static const const_703:String = "HABBO_SESSION_FIGURE_UPDATE";
       
      
      private var var_570:String;
      
      private var var_313:String;
      
      private var _userId:int;
      
      public function HabboSessionFigureUpdatedEvent(param1:int, param2:String, param3:String, param4:Boolean = false, param5:Boolean = false)
      {
         super(const_703,param4,param5);
         _userId = param1;
         var_313 = param2;
         var_570 = param3;
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
