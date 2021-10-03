package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var var_2307:Boolean;
      
      protected var var_1577:Number;
      
      protected var var_2306:Boolean;
      
      protected var _type:int;
      
      protected var var_2304:Boolean;
      
      protected var var_1648:int;
      
      protected var var_2308:Boolean;
      
      protected var var_1411:String;
      
      protected var var_2115:int;
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var var_1439:String;
      
      protected var var_2113:Boolean;
      
      protected var _category:int;
      
      protected var var_2118:int;
      
      protected var var_2305:int;
      
      protected var var_2117:int;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         _id = param1;
         _type = param2;
         _ref = param3;
         _category = param4;
         var_2113 = param5;
         var_2308 = param6;
         var_2307 = param7;
         var_2306 = param8;
         var_1411 = param9;
         var_1577 = param10;
         var_2305 = param11;
         var_2117 = param12;
         var_2118 = param13;
         var_2115 = param14;
         var_1439 = param15;
         var_1648 = param16;
      }
      
      public function get locked() : Boolean
      {
         return var_2304;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get extra() : Number
      {
         return var_1577;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var_2304 = param1;
      }
      
      public function get ref() : int
      {
         return _ref;
      }
      
      public function get songId() : int
      {
         return var_1648;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get sellable() : Boolean
      {
         return var_2306;
      }
      
      public function get slotId() : String
      {
         return var_1439;
      }
      
      public function get expires() : int
      {
         return var_2305;
      }
      
      public function get creationYear() : int
      {
         return var_2115;
      }
      
      public function get creationDay() : int
      {
         return var_2117;
      }
      
      public function get stuffData() : String
      {
         return var_1411;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tradeable() : Boolean
      {
         return var_2308;
      }
      
      public function get groupable() : Boolean
      {
         return var_2113;
      }
      
      public function get creationMonth() : int
      {
         return var_2118;
      }
      
      public function get recyclable() : Boolean
      {
         return var_2307;
      }
   }
}
