package com.sulake.habbo.window.utils
{
   class AlertDialogCaption implements ICaption
   {
       
      
      private var var_374:Boolean;
      
      private var var_193:String;
      
      private var var_1213:String;
      
      function AlertDialogCaption(param1:String, param2:String, param3:Boolean)
      {
         super();
         var_193 = param1;
         var_1213 = param2;
         var_374 = param3;
      }
      
      public function get toolTip() : String
      {
         return var_1213;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var_374 = param1;
      }
      
      public function get text() : String
      {
         return var_193;
      }
      
      public function get visible() : Boolean
      {
         return var_374;
      }
      
      public function set toolTip(param1:String) : void
      {
         var_1213 = param1;
      }
      
      public function set text(param1:String) : void
      {
         var_193 = param1;
      }
   }
}
