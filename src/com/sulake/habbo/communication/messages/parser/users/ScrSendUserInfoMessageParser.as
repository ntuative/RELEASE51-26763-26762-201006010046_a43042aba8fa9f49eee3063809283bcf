package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1242:int = 2;
      
      public static const const_1710:int = 1;
       
      
      private var var_1954:int;
      
      private var var_1953:int;
      
      private var var_1737:Boolean;
      
      private var var_1955:int;
      
      private var var_1313:String;
      
      private var var_1957:Boolean;
      
      private var var_1736:int;
      
      private var var_1956:int;
      
      private var var_1739:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_1953;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1737;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_1956;
      }
      
      public function get memberPeriods() : int
      {
         return var_1955;
      }
      
      public function get productName() : String
      {
         return var_1313;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_1957;
      }
      
      public function get responseType() : int
      {
         return var_1954;
      }
      
      public function get pastClubDays() : int
      {
         return var_1739;
      }
      
      public function get pastVipDays() : int
      {
         return var_1736;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1313 = param1.readString();
         var_1953 = param1.readInteger();
         var_1955 = param1.readInteger();
         var_1956 = param1.readInteger();
         var_1954 = param1.readInteger();
         var_1957 = param1.readBoolean();
         var_1737 = param1.readBoolean();
         var_1739 = param1.readInteger();
         var_1736 = param1.readInteger();
         return true;
      }
   }
}
