package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2363:int;
      
      private var var_2364:int;
      
      private var var_90:Array;
      
      private var var_238:Array;
      
      private var var_2362:int;
      
      private var var_2361:int;
      
      private var var_2366:int;
      
      private var var_2365:int;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_90 = new Array();
         this.var_238 = new Array();
         return true;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2363;
      }
      
      public function get friends() : Array
      {
         return this.var_238;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2362;
      }
      
      public function get categories() : Array
      {
         return this.var_90;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2364;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2365;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2365 = param1.readInteger();
         this.var_2362 = param1.readInteger();
         this.var_2363 = param1.readInteger();
         this.var_2366 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_90.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_238.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2364 = param1.readInteger();
         this.var_2361 = param1.readInteger();
         return true;
      }
      
      public function get evenMoreExtendedFriendLimit() : int
      {
         return this.var_2366;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2361;
      }
   }
}
