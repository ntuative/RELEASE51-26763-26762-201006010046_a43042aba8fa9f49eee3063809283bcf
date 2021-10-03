package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_1677:int;
      
      private var var_1667:int;
      
      private var var_1671:int;
      
      private var _type:int;
      
      private var var_1273:int = -1;
      
      private var var_1672:int;
      
      private var _nutrition:int;
      
      private var var_1669:int;
      
      private var _energy:int;
      
      private var var_1668:int;
      
      private var var_1670:int;
      
      private var var_1675:int;
      
      private var var_1676:int;
      
      private var _petRespect:int;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var _image:BitmapData;
      
      private var _ownerName:String;
      
      private var var_1674:Boolean;
      
      private var _name:String = "";
      
      private var var_1673:int;
      
      public function InfoStandPetData()
      {
         super();
      }
      
      public function get isOwnPet() : Boolean
      {
         return var_1674;
      }
      
      public function get level() : int
      {
         return var_1677;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get experienceMax() : int
      {
         return var_1669;
      }
      
      public function get id() : int
      {
         return var_1273;
      }
      
      public function get nutritionMax() : int
      {
         return var_1671;
      }
      
      public function get ownerId() : int
      {
         return var_1673;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         _name = param1.name;
         var_1273 = param1.id;
         _type = param1.petType;
         var_1668 = param1.petRace;
         _image = param1.image;
         var_1674 = param1.isOwnPet;
         var_1673 = param1.ownerId;
         _ownerName = param1.ownerName;
         _canOwnerBeKicked = param1.canOwnerBeKicked;
         var_1677 = param1.level;
         var_1672 = param1.levelMax;
         var_1667 = param1.experience;
         var_1669 = param1.experienceMax;
         _energy = param1.energy;
         var_1670 = param1.energyMax;
         _nutrition = param1.nutrition;
         var_1671 = param1.nutritionMax;
         _petRespect = param1.petRespect;
         var_1675 = param1.roomIndex;
         var_1676 = param1.age;
      }
      
      public function get roomIndex() : int
      {
         return var_1675;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get energyMax() : int
      {
         return var_1670;
      }
      
      public function get levelMax() : int
      {
         return var_1672;
      }
      
      public function get petRespect() : int
      {
         return _petRespect;
      }
      
      public function get race() : int
      {
         return var_1668;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return _canOwnerBeKicked;
      }
      
      public function get experience() : int
      {
         return var_1667;
      }
      
      public function get age() : int
      {
         return var_1676;
      }
   }
}
