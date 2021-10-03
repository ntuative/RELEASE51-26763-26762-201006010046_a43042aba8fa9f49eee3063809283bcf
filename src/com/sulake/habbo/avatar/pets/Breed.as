package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var var_570:String;
      
      private var _id:int;
      
      private var var_1891:String = "";
      
      private var var_1892:int;
      
      private var var_1893:String;
      
      private var var_1850:Boolean;
      
      public function Breed(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var_1892 = parseInt(param1.@pattern);
         var_570 = String(param1.@gender);
         var_1850 = Boolean(parseInt(param1.@colorable));
         var_1891 = String(param1.@localizationKey);
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get localizationKey() : String
      {
         return var_1891;
      }
      
      public function get isColorable() : Boolean
      {
         return var_1850;
      }
      
      public function get gender() : String
      {
         return var_570;
      }
      
      public function get patternId() : int
      {
         return var_1892;
      }
      
      public function get avatarFigureString() : String
      {
         return var_1893;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         var_1893 = param1;
      }
   }
}
