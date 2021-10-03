package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1095:String;
      
      private var var_1903:int;
      
      private var var_2116:int;
      
      private var var_1577:int;
      
      private var var_2115:int;
      
      private var _category:int;
      
      private var var_2419:int;
      
      private var var_2117:int;
      
      private var var_2114:int;
      
      private var var_2119:int;
      
      private var var_2118:int;
      
      private var var_2113:Boolean;
      
      private var var_1411:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_1903 = param1;
         var_1095 = param2;
         var_2116 = param3;
         var_2119 = param4;
         _category = param5;
         var_1411 = param6;
         var_1577 = param7;
         var_2114 = param8;
         var_2117 = param9;
         var_2118 = param10;
         var_2115 = param11;
         var_2113 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_2119;
      }
      
      public function get extra() : int
      {
         return var_1577;
      }
      
      public function get stuffData() : String
      {
         return var_1411;
      }
      
      public function get groupable() : Boolean
      {
         return var_2113;
      }
      
      public function get creationMonth() : int
      {
         return var_2118;
      }
      
      public function get roomItemID() : int
      {
         return var_2116;
      }
      
      public function get itemType() : String
      {
         return var_1095;
      }
      
      public function get itemID() : int
      {
         return var_1903;
      }
      
      public function get songID() : int
      {
         return var_1577;
      }
      
      public function get timeToExpiration() : int
      {
         return var_2114;
      }
      
      public function get creationYear() : int
      {
         return var_2115;
      }
      
      public function get creationDay() : int
      {
         return var_2117;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
