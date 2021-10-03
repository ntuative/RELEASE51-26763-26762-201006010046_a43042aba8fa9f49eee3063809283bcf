package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_155:int = 1;
      
      public static const const_1326:int = 3;
      
      public static const const_427:int = 2;
       
      
      private var var_2263:int;
      
      private var var_1767:int;
      
      private var var_2259:int;
      
      private var var_1713:int;
      
      private var var_35:int;
      
      private var var_406:int;
      
      private var var_1390:int;
      
      private var var_1745:int;
      
      private var var_1075:int;
      
      private var _roomResources:String;
      
      private var var_2095:int;
      
      private var var_2258:int;
      
      private var var_2264:String;
      
      private var var_1985:String;
      
      private var var_2260:int = 0;
      
      private var var_1284:String;
      
      private var _message:String;
      
      private var var_1707:int;
      
      private var var_2261:String;
      
      private var var_1269:int;
      
      private var var_699:String;
      
      private var var_2262:String;
      
      private var var_1533:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_1075 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_2260 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_2258;
      }
      
      public function set roomName(param1:String) : void
      {
         var_699 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_2095 = param1;
      }
      
      public function get state() : int
      {
         return var_35;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_699;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1713 = param1;
      }
      
      public function set state(param1:int) : void
      {
         var_35 = param1;
      }
      
      public function get unitPort() : int
      {
         return var_1767;
      }
      
      public function get priority() : int
      {
         return var_2263 + var_2260;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1745 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1985;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1533) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1269;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_2258 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1390;
      }
      
      public function set flatType(param1:String) : void
      {
         var_2264 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_2095;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1713;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_2262 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1284 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1745;
      }
      
      public function set priority(param1:int) : void
      {
         var_2263 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_1767 = param1;
      }
      
      public function get flatType() : String
      {
         return var_2264;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_2259 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1985 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1707 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1284;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1390 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_2259;
      }
      
      public function set flatId(param1:int) : void
      {
         var_406 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1269 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1533 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1707;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_2261 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1533;
      }
      
      public function get reportedUserId() : int
      {
         return var_1075;
      }
      
      public function get flatId() : int
      {
         return var_406;
      }
      
      public function get flatOwnerName() : String
      {
         return var_2262;
      }
      
      public function get reporterUserName() : String
      {
         return var_2261;
      }
   }
}
