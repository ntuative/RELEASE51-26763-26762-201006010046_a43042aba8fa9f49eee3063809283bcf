package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1790:String;
      
      private var var_406:int;
      
      private var var_1788:String;
      
      private var var_1785:String;
      
      private var var_1787:int;
      
      private var var_1789:String;
      
      private var var_1786:int;
      
      private var var_656:Array;
      
      private var var_1119:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_656 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1119 = false;
            return;
         }
         this.var_1119 = true;
         var_1787 = int(_loc2_);
         var_1788 = param1.readString();
         var_406 = int(param1.readString());
         var_1786 = param1.readInteger();
         var_1790 = param1.readString();
         var_1785 = param1.readString();
         var_1789 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_656.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_1786;
      }
      
      public function get eventName() : String
      {
         return var_1790;
      }
      
      public function get eventDescription() : String
      {
         return var_1785;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_1788;
      }
      
      public function get tags() : Array
      {
         return var_656;
      }
      
      public function get creationTime() : String
      {
         return var_1789;
      }
      
      public function get exists() : Boolean
      {
         return var_1119;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_1787;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
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
      
      public function get flatId() : int
      {
         return var_406;
      }
   }
}
