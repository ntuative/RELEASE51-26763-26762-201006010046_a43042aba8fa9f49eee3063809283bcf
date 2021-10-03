package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1677:int;
      
      private var var_1830:int;
      
      private var var_1667:int;
      
      private var var_1671:int;
      
      private var _nutrition:int;
      
      private var var_1273:int;
      
      private var var_1672:int;
      
      private var var_1669:int;
      
      private var _energy:int;
      
      private var var_1676:int;
      
      private var var_1670:int;
      
      private var _ownerName:String;
      
      private var var_1673:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1677;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function set respect(param1:int) : void
      {
         var_1830 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1677 = param1;
      }
      
      public function get petId() : int
      {
         return var_1273;
      }
      
      public function get experienceMax() : int
      {
         return var_1669;
      }
      
      public function get nutritionMax() : int
      {
         return var_1671;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_1672 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_1673;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1273 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_1670;
      }
      
      public function get respect() : int
      {
         return var_1830;
      }
      
      public function get levelMax() : int
      {
         return var_1672;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_1669 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1667 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_1671 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_1673 = param1;
      }
      
      public function get experience() : int
      {
         return var_1667;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_1670 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1676 = param1;
      }
      
      public function get age() : int
      {
         return var_1676;
      }
   }
}
