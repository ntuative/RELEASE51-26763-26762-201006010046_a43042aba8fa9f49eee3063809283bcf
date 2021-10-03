package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1485:int = 9;
      
      public static const const_1689:int = 4;
      
      public static const const_1707:int = 1;
      
      public static const const_1263:int = 10;
      
      public static const const_1488:int = 2;
      
      public static const const_1258:int = 7;
      
      public static const const_1349:int = 11;
      
      public static const const_1493:int = 3;
      
      public static const const_1297:int = 8;
      
      public static const const_1386:int = 5;
      
      public static const const_1599:int = 6;
      
      public static const const_1373:int = 12;
       
      
      private var var_1666:String;
      
      private var _roomId:int;
      
      private var var_1164:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_1666;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1164 = param1.readInteger();
         var_1666 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1164;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
