package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_2205:int;
      
      private var var_2201:String;
      
      private var var_1429:IActionDefinition;
      
      private var var_2203:Boolean;
      
      private var _color:IPartColor;
      
      private var var_2200:String;
      
      private var var_2202:String;
      
      private var var_1850:Boolean;
      
      private var var_2204:ColorTransform;
      
      private var var_1873:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_2201 = param1;
         var_2200 = param2;
         var_2205 = param3;
         _color = param4;
         _frames = param5;
         var_1429 = param6;
         var_1850 = param7;
         var_1873 = param8;
         var_2202 = param9;
         var_2203 = param10;
         var_2204 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_1850;
      }
      
      public function get partType() : String
      {
         return var_2200;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_1873;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_2203;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_2205;
      }
      
      public function get flippedPartType() : String
      {
         return var_2202;
      }
      
      public function get bodyPartId() : String
      {
         return var_2201;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1429;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_2204;
      }
   }
}
