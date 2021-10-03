package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1928:int;
      
      private var var_2275:String;
      
      private var var_2273:int;
      
      private var var_2274:int;
      
      private var var_686:Boolean;
      
      private var var_2020:Boolean;
      
      private var var_406:int;
      
      private var var_1229:String;
      
      private var var_2015:int;
      
      private var var_1269:int;
      
      private var _ownerName:String;
      
      private var var_699:String;
      
      private var var_2272:int;
      
      private var var_2271:RoomThumbnailData;
      
      private var var_2242:Boolean;
      
      private var var_656:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_656 = new Array();
         super();
         var_406 = param1.readInteger();
         var_686 = param1.readBoolean();
         var_699 = param1.readString();
         _ownerName = param1.readString();
         var_2015 = param1.readInteger();
         var_1928 = param1.readInteger();
         var_2272 = param1.readInteger();
         var_1229 = param1.readString();
         var_2273 = param1.readInteger();
         var_2242 = param1.readBoolean();
         var_2274 = param1.readInteger();
         var_1269 = param1.readInteger();
         var_2275 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_656.push(_loc4_);
            _loc3_++;
         }
         var_2271 = new RoomThumbnailData(param1);
         var_2020 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_2272;
      }
      
      public function get roomName() : String
      {
         return var_699;
      }
      
      public function get userCount() : int
      {
         return var_1928;
      }
      
      public function get score() : int
      {
         return var_2274;
      }
      
      public function get eventCreationTime() : String
      {
         return var_2275;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_2242;
      }
      
      public function get tags() : Array
      {
         return var_656;
      }
      
      public function get allowPets() : Boolean
      {
         return var_2020;
      }
      
      public function get event() : Boolean
      {
         return var_686;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_656 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1269;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_2273;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_2271;
      }
      
      public function get doorMode() : int
      {
         return var_2015;
      }
      
      public function get flatId() : int
      {
         return var_406;
      }
      
      public function get description() : String
      {
         return var_1229;
      }
   }
}
