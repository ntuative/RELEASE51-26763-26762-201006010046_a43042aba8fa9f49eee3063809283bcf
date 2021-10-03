package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1411:String;
      
      private var var_1095:String;
      
      private var var_1837:Boolean;
      
      private var var_1577:int;
      
      private var var_1832:int;
      
      private var var_1838:Boolean;
      
      private var var_1439:String = "";
      
      private var var_1833:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1339:int;
      
      private var var_1831:Boolean;
      
      private var var_1648:int = -1;
      
      private var var_1834:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_1832 = param1;
         var_1095 = param2;
         _objId = param3;
         var_1339 = param4;
         _category = param5;
         var_1411 = param6;
         var_1837 = param7;
         var_1833 = param8;
         var_1831 = param9;
         var_1838 = param10;
         var_1834 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1439;
      }
      
      public function get extra() : int
      {
         return var_1577;
      }
      
      public function get classId() : int
      {
         return var_1339;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_1838;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_1837;
      }
      
      public function get stripId() : int
      {
         return var_1832;
      }
      
      public function get stuffData() : String
      {
         return var_1411;
      }
      
      public function get songId() : int
      {
         return var_1648;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1439 = param1;
         var_1577 = param2;
      }
      
      public function get itemType() : String
      {
         return var_1095;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_1834;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1831;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1833;
      }
   }
}
