package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_873:String = "RWOCM_CLUB_MAIN";
      
      public static const const_613:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_1915:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_613);
         var_1915 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_1915;
      }
   }
}
