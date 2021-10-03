package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_269:uint = 1;
      
      public static const const_466:uint = 0;
      
      public static const const_837:uint = 8;
      
      public static const const_258:uint = 4;
      
      public static const const_453:uint = 2;
       
      
      private var var_389:uint;
      
      private var var_1896:uint;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var var_1897:uint;
      
      private var var_101:Rectangle;
      
      private var var_656:Array;
      
      private var _id:uint;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         _id = param1;
         _name = param2;
         var_101 = param3;
         _color = param4;
         var_389 = param5;
         var_1896 = param6;
         var_1897 = param7;
         var_656 = new Array();
      }
      
      public function get scaleH() : uint
      {
         return var_1896;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get blend() : uint
      {
         return var_389;
      }
      
      public function get scaleV() : uint
      {
         return var_1897;
      }
      
      public function get tags() : Array
      {
         return var_656;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function dispose() : void
      {
         var_101 = null;
         var_656 = null;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get region() : Rectangle
      {
         return var_101;
      }
   }
}
