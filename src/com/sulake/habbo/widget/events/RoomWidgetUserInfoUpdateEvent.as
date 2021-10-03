package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_228:String = "RWUIUE_PEER";
      
      public static const const_240:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1183:String = "BOT";
      
      public static const const_1038:int = 2;
      
      public static const const_1406:int = 0;
      
      public static const const_824:int = 3;
       
      
      private var var_313:String = "";
      
      private var var_1286:String = "";
      
      private var var_2064:Boolean = false;
      
      private var var_1968:int = 0;
      
      private var var_1994:int = 0;
      
      private var var_2059:Boolean = false;
      
      private var var_1287:String = "";
      
      private var var_2060:Boolean = false;
      
      private var var_887:int = 0;
      
      private var var_2061:Boolean = true;
      
      private var var_1099:int = 0;
      
      private var var_2057:Boolean = false;
      
      private var var_1376:Boolean = false;
      
      private var var_2065:Boolean = false;
      
      private var var_1996:int = 0;
      
      private var var_2058:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_279:Array;
      
      private var var_1377:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1967:int = 0;
      
      private var var_2063:Boolean = false;
      
      private var var_2062:int = 0;
      
      private var var_1995:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_279 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_1994;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_1994 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_2064;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_2061;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_2061 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_2060 = param1;
      }
      
      public function get motto() : String
      {
         return var_1286;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_2057 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1376;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1286 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_2063;
      }
      
      public function get groupBadgeId() : String
      {
         return var_1995;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1376 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_2058;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_1996 = param1;
      }
      
      public function get badges() : Array
      {
         return var_279;
      }
      
      public function get amIController() : Boolean
      {
         return var_2059;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_2059 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_2063 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_2062 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_1995 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1287 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_2060;
      }
      
      public function set figure(param1:String) : void
      {
         var_313 = param1;
      }
      
      public function get carryItem() : int
      {
         return var_1996;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1377;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_2057;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_887 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_2062;
      }
      
      public function get realName() : String
      {
         return var_1287;
      }
      
      public function get figure() : String
      {
         return var_313;
      }
      
      public function set webID(param1:int) : void
      {
         var_1967 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_279 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_2065 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_2058 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_887;
      }
      
      public function get webID() : int
      {
         return var_1967;
      }
      
      public function set groupId(param1:int) : void
      {
         var_1099 = param1;
      }
      
      public function get xp() : int
      {
         return var_1968;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_2064 = param1;
      }
      
      public function get groupId() : int
      {
         return var_1099;
      }
      
      public function get canTrade() : Boolean
      {
         return var_2065;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1377 = param1;
      }
      
      public function set xp(param1:int) : void
      {
         var_1968 = param1;
      }
   }
}
