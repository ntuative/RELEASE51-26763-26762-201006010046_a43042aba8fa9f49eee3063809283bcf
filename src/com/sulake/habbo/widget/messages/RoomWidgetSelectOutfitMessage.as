package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_1039:String = "select_outfit";
       
      
      private var var_2103:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_1039);
         var_2103 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_2103;
      }
   }
}
