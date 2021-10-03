package com.sulake.habbo.toolbar
{
   public class StateItem
   {
       
      
      private var var_1400:Boolean;
      
      private var var_1734:String;
      
      private var _frames:XMLList;
      
      private var var_1120:String = "-1";
      
      private var var_657:String;
      
      private var var_183:int = 120;
      
      private var var_1171:String = "-1";
      
      private var var_1172:String;
      
      private var var_1735:Boolean;
      
      private var var_1440:String = "-1";
      
      private var _id:String;
      
      public function StateItem(param1:XML, param2:String)
      {
         super();
         _id = param1.@id;
         if(param1.attribute("loop").length() > 0)
         {
            var_1400 = Boolean(param1.@loop);
         }
         if(param1.attribute("bounce").length() > 0)
         {
            var_1735 = Boolean(param1.@loop);
         }
         if(param1.attribute("timer").length() > 0)
         {
            var_183 = int(param1.@timer);
         }
         if(param1.attribute("namebase").length() > 0)
         {
            var_1172 = param1.@namebase;
         }
         else
         {
            var_1172 = param2;
         }
         if(param1.attribute("state_over").length() > 0)
         {
            var_1120 = param1.@state_over;
         }
         if(param1.attribute("nextState").length() > 0)
         {
            var_1171 = param1.@nextState;
         }
         else
         {
            var_1171 = _id;
         }
         if(param1.attribute("state_default").length() > 0)
         {
            var_1440 = param1.@state_default;
         }
         if(param1.attribute("tooltip").length() > 0)
         {
            var_1734 = param1.@tooltip;
         }
         if(param1.attribute("background").length() > 0)
         {
            var_657 = param1.@background;
         }
         var _loc3_:XMLList = param1.elements("frame");
         if(_loc3_.length() > 0)
         {
            _frames = _loc3_;
         }
      }
      
      public function get hasStateOver() : Boolean
      {
         return var_1120 != "-1";
      }
      
      public function get bounce() : Boolean
      {
         return var_1735;
      }
      
      public function get defaultState() : String
      {
         return var_1440;
      }
      
      public function get hasDefaultState() : Boolean
      {
         return var_1440 != "-1";
      }
      
      public function get tooltip() : String
      {
         return var_1734;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function get timer() : int
      {
         return var_183;
      }
      
      public function get loop() : Boolean
      {
         return var_1400;
      }
      
      public function get nextState() : String
      {
         return var_1171;
      }
      
      public function get frames() : XMLList
      {
         return _frames;
      }
      
      public function get background() : String
      {
         return var_657;
      }
      
      public function get stateOver() : String
      {
         return var_1120;
      }
      
      public function get nameBase() : String
      {
         return var_1172;
      }
   }
}
