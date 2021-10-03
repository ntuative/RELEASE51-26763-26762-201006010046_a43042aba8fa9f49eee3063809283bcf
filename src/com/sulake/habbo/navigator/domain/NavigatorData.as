package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1451:int = 10;
       
      
      private var var_1444:NavigatorSettingsMessageParser;
      
      private var var_1179:int;
      
      private var var_1748:int;
      
      private var var_1749:Boolean;
      
      private var var_1012:Array;
      
      private var var_808:Dictionary;
      
      private var var_1013:Array;
      
      private var var_2342:int;
      
      private var var_1751:int;
      
      private var var_1754:int;
      
      private var var_1752:int;
      
      private var var_572:PublicRoomShortData;
      
      private var var_402:RoomEventData;
      
      private var var_127:MsgWithRequestId;
      
      private var var_1753:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_1750:Boolean;
      
      private var var_194:GuestRoomData;
      
      private var var_683:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_1012 = new Array();
         var_1013 = new Array();
         var_808 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_1748;
      }
      
      public function get eventMod() : Boolean
      {
         return var_1750;
      }
      
      public function startLoading() : void
      {
         this.var_683 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_1750 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_402 != null)
         {
            var_402.dispose();
         }
         var_402 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_127 != null && var_127 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_127 != null && var_127 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_127 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_194;
      }
      
      public function get allCategories() : Array
      {
         return var_1012;
      }
      
      public function onRoomExit() : void
      {
         if(var_402 != null)
         {
            var_402.dispose();
            var_402 = null;
         }
         if(var_572 != null)
         {
            var_572.dispose();
            var_572 = null;
         }
         if(var_194 != null)
         {
            var_194.dispose();
            var_194 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_127 = param1;
         var_683 = false;
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1444;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_127 = param1;
         var_683 = false;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_572 = null;
         var_194 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_572 = param1.publicSpace;
            var_402 = null;
         }
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2342 = param1.limit;
         this.var_1179 = param1.favouriteRoomIds.length;
         this.var_808 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_808[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_127 as PopularRoomTagsData;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_572;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_1749;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_127 = param1;
         var_683 = false;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1754 = param1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_194 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_683;
      }
      
      public function get visibleCategories() : Array
      {
         return var_1013;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         var_1012 = param1;
         var_1013 = new Array();
         for each(_loc2_ in var_1012)
         {
            if(_loc2_.visible)
            {
               var_1013.push(_loc2_);
            }
         }
      }
      
      public function get currentRoomRating() : int
      {
         return var_1751;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_1752;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1444 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_127 == null)
         {
            return;
         }
         var_127.dispose();
         var_127 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_402;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_808[param1] = !!param2 ? "yes" : null;
         var_1179 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_127 as OfficialRoomsData;
      }
      
      public function get avatarId() : int
      {
         return var_1754;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_127 != null && var_127 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_1749 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_1751 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_1753 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_194 != null)
         {
            var_194.dispose();
         }
         var_194 = param1;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_194 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1444.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1179 >= var_2342;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_1752 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_1753;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_194 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_1748 = param1;
      }
   }
}
