package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var _removeSetType:String;
      
      private var var_1506:int = -1;
      
      private var var_1247:Boolean;
      
      private var var_1246:String;
      
      private var var_1935:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_1935 = String(param1["set-type"]);
         var_1246 = String(param1["flipped-set-type"]);
         _removeSetType = String(param1["remove-set-type"]);
         var_1247 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_1506 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return var_1246;
      }
      
      public function get staticId() : int
      {
         return var_1506;
      }
      
      public function set staticId(param1:int) : void
      {
         var_1506 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_1247;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_1247 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_1246 = param1;
      }
      
      public function get setType() : String
      {
         return var_1935;
      }
      
      public function get removeSetType() : String
      {
         return _removeSetType;
      }
   }
}
