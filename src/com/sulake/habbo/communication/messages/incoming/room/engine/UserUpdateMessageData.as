package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_89:Number = 0;
      
      private var var_237:int = 0;
      
      private var var_2068:int = 0;
      
      private var var_2252:Number = 0;
      
      private var var_2254:Number = 0;
      
      private var var_2251:Number = 0;
      
      private var var_2253:Number = 0;
      
      private var var_2255:Boolean = false;
      
      private var var_88:Number = 0;
      
      private var _id:int = 0;
      
      private var var_239:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_239 = [];
         super();
         _id = param1;
         var_88 = param2;
         _y = param3;
         var_89 = param4;
         var_2253 = param5;
         var_237 = param6;
         var_2068 = param7;
         var_2252 = param8;
         var_2254 = param9;
         var_2251 = param10;
         var_2255 = param11;
         var_239 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_89;
      }
      
      public function get dir() : int
      {
         return var_237;
      }
      
      public function get localZ() : Number
      {
         return var_2253;
      }
      
      public function get isMoving() : Boolean
      {
         return var_2255;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_2068;
      }
      
      public function get targetX() : Number
      {
         return var_2252;
      }
      
      public function get targetY() : Number
      {
         return var_2254;
      }
      
      public function get targetZ() : Number
      {
         return var_2251;
      }
      
      public function get x() : Number
      {
         return var_88;
      }
      
      public function get actions() : Array
      {
         return var_239.slice();
      }
   }
}
