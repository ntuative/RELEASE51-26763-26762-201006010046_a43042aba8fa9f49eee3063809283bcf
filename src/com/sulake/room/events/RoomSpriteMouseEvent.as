package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_1761:Boolean = false;
      
      private var var_1762:Boolean = false;
      
      private var var_1884:String = "";
      
      private var _type:String = "";
      
      private var var_1763:Boolean = false;
      
      private var var_1885:Number = 0;
      
      private var var_1886:Number = 0;
      
      private var var_1887:Number = 0;
      
      private var var_1882:String = "";
      
      private var var_1883:Number = 0;
      
      private var var_1760:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_1882 = param2;
         var_1884 = param3;
         var_1886 = param4;
         var_1887 = param5;
         var_1885 = param6;
         var_1883 = param7;
         var_1760 = param8;
         var_1762 = param9;
         var_1763 = param10;
         var_1761 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1760;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1761;
      }
      
      public function get localX() : Number
      {
         return var_1885;
      }
      
      public function get localY() : Number
      {
         return var_1883;
      }
      
      public function get canvasId() : String
      {
         return var_1882;
      }
      
      public function get altKey() : Boolean
      {
         return var_1762;
      }
      
      public function get spriteTag() : String
      {
         return var_1884;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_1886;
      }
      
      public function get screenY() : Number
      {
         return var_1887;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1763;
      }
   }
}
