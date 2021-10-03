package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToHeight implements BinarySearchTest
   {
       
      
      private var var_185:String;
      
      private var var_449:int;
      
      private var var_193:ITextWindow;
      
      public function CutToHeight()
      {
         super();
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         var_185 = param1;
         var_193 = param2;
         var_449 = param3;
      }
      
      public function test(param1:int) : Boolean
      {
         var_193.text = var_185.substring(0,param1) + "...";
         return var_193.textHeight > var_449;
      }
   }
}
