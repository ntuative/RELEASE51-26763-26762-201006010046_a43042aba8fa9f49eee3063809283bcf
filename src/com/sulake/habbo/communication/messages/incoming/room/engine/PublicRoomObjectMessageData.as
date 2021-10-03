package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class PublicRoomObjectMessageData
   {
       
      
      private var var_1005:int = 0;
      
      private var var_89:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_199:Boolean = false;
      
      private var var_237:int = 0;
      
      private var _type:String = "";
      
      private var _name:String = "";
      
      private var var_88:Number = 0;
      
      private var var_1006:int = 0;
      
      public function PublicRoomObjectMessageData()
      {
         super();
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_199)
         {
            var_89 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return var_1005;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get dir() : int
      {
         return var_237;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         if(!var_199)
         {
            _name = param1;
         }
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_199)
         {
            var_237 = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_199)
         {
            _y = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_199 = true;
      }
      
      public function get z() : Number
      {
         return var_89;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_199)
         {
            var_1005 = param1;
         }
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_199)
         {
            var_1006 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_199)
         {
            var_88 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_88;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function set type(param1:String) : void
      {
         if(!var_199)
         {
            _type = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_1006;
      }
   }
}
