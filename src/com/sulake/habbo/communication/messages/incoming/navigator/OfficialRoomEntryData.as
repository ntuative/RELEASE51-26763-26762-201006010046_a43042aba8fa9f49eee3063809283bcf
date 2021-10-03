package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1365:int = 4;
      
      public static const const_755:int = 3;
      
      public static const const_571:int = 2;
      
      public static const const_918:int = 1;
       
      
      private var var_2010:String;
      
      private var _disposed:Boolean;
      
      private var var_1928:int;
      
      private var var_2009:Boolean;
      
      private var var_830:String;
      
      private var var_884:PublicRoomData;
      
      private var var_2012:int;
      
      private var _index:int;
      
      private var var_2011:String;
      
      private var _type:int;
      
      private var var_1839:String;
      
      private var var_885:GuestRoomData;
      
      private var var_2008:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_2010 = param1.readString();
         var_2008 = param1.readString();
         var_2009 = param1.readInteger() == 1;
         var_2011 = param1.readString();
         var_830 = param1.readString();
         var_2012 = param1.readInteger();
         var_1928 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_918)
         {
            var_1839 = param1.readString();
         }
         else if(_type == const_755)
         {
            var_884 = new PublicRoomData(param1);
         }
         else if(_type == const_571)
         {
            var_885 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_2012;
      }
      
      public function get popupCaption() : String
      {
         return var_2010;
      }
      
      public function get userCount() : int
      {
         return var_1928;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_2009;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_918)
         {
            return 0;
         }
         if(this.type == const_571)
         {
            return this.var_885.maxUserCount;
         }
         if(this.type == const_755)
         {
            return this.var_884.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_2008;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_885 != null)
         {
            this.var_885.dispose();
            this.var_885 = null;
         }
         if(this.var_884 != null)
         {
            this.var_884.dispose();
            this.var_884 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_885;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_2011;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_884;
      }
      
      public function get picRef() : String
      {
         return var_830;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1839;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
