package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_115:RoomData;
      
      private var _disposed:Boolean;
      
      private var var_1928:int;
      
      private var var_406:int;
      
      private var var_686:RoomData;
      
      private var var_1673:int;
      
      private var _ownerName:String;
      
      private var var_1927:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         var_406 = param1.readInteger();
         var_1928 = param1.readInteger();
         var_1927 = param1.readBoolean();
         var_1673 = param1.readInteger();
         _ownerName = param1.readString();
         var_115 = new RoomData(param1);
         var_686 = new RoomData(param1);
      }
      
      public function get userCount() : int
      {
         return var_1928;
      }
      
      public function get event() : RoomData
      {
         return var_686;
      }
      
      public function get room() : RoomData
      {
         return var_115;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_115 != null)
         {
            var_115.dispose();
            var_115 = null;
         }
         if(var_686 != null)
         {
            var_686.dispose();
            var_686 = null;
         }
      }
      
      public function get flatId() : int
      {
         return var_406;
      }
      
      public function get ownerId() : int
      {
         return var_1673;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return var_1927;
      }
   }
}
