package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1676:int;
      
      private var var_313:String;
      
      private var var_1677:int;
      
      private var var_1830:int;
      
      private var var_1667:int;
      
      private var var_2003:int;
      
      private var _nutrition:int;
      
      private var var_1273:int;
      
      private var var_2004:int;
      
      private var var_2005:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1673:int;
      
      private var var_2002:int;
      
      public function PetInfoMessageParser()
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
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_2003;
      }
      
      public function flush() : Boolean
      {
         var_1273 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_2004;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_2005;
      }
      
      public function get maxNutrition() : int
      {
         return var_2002;
      }
      
      public function get figure() : String
      {
         return var_313;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1830;
      }
      
      public function get petId() : int
      {
         return var_1273;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1273 = param1.readInteger();
         _name = param1.readString();
         var_1677 = param1.readInteger();
         var_2004 = param1.readInteger();
         var_1667 = param1.readInteger();
         var_2005 = param1.readInteger();
         _energy = param1.readInteger();
         var_2003 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_2002 = param1.readInteger();
         var_313 = param1.readString();
         var_1830 = param1.readInteger();
         var_1673 = param1.readInteger();
         var_1676 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1667;
      }
      
      public function get ownerId() : int
      {
         return var_1673;
      }
      
      public function get age() : int
      {
         return var_1676;
      }
   }
}
