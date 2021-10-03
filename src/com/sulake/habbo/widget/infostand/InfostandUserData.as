package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   
   public class InfostandUserData
   {
       
      
      private var var_1995:String = "";
      
      private var var_1996:int = 0;
      
      private var _userName:String = "";
      
      private var var_279:Array;
      
      private var _type:String;
      
      private var _userId:int = 0;
      
      private var var_1994:int = 0;
      
      private var var_887:int = 0;
      
      private var var_1099:int = 0;
      
      private var var_512:int = 0;
      
      public function InfostandUserData()
      {
         var_279 = [];
         super();
      }
      
      public function get groupId() : int
      {
         return var_1099;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_1994 = param1;
      }
      
      public function isBot() : Boolean
      {
         return type == RoomWidgetUserInfoUpdateEvent.BOT;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get userRoomId() : int
      {
         return var_1994;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function set userId(param1:int) : void
      {
         _userId = param1;
      }
      
      public function get carryItem() : int
      {
         return var_1996;
      }
      
      public function get petRespectLeft() : int
      {
         return var_512;
      }
      
      public function get groupBadgeId() : String
      {
         return var_1995;
      }
      
      public function set badges(param1:Array) : void
      {
         var_279 = param1;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_887 = param1;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_1996 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_887;
      }
      
      public function set petRespectLeft(param1:int) : void
      {
         var_512 = param1;
      }
      
      public function set userName(param1:String) : void
      {
         _userName = param1;
      }
      
      public function get badges() : Array
      {
         return var_279.slice();
      }
      
      public function setData(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         userId = param1.webID;
         userName = param1.name;
         badges = param1.badges;
         groupId = param1.groupId;
         groupBadgeId = param1.groupBadgeId;
         respectLeft = param1.respectLeft;
         carryItem = param1.carryItem;
         userRoomId = param1.userRoomId;
         type = param1.type;
      }
      
      public function set groupId(param1:int) : void
      {
         var_1099 = param1;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_1995 = param1;
      }
   }
}
