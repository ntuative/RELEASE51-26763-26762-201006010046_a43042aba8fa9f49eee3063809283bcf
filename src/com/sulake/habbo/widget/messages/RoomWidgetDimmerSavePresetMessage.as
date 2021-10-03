package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_647:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1921:int;
      
      private var var_1920:int;
      
      private var var_1922:Boolean;
      
      private var var_1067:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_647);
         var_1920 = param1;
         var_1921 = param2;
         _color = param3;
         var_1067 = param4;
         var_1922 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1921;
      }
      
      public function get presetNumber() : int
      {
         return var_1920;
      }
      
      public function get brightness() : int
      {
         return var_1067;
      }
      
      public function get apply() : Boolean
      {
         return var_1922;
      }
   }
}
