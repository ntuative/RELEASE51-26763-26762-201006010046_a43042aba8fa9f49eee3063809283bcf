package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   
   public class ChangeUserNameResultMessageEvent extends MessageEvent implements IMessageEvent
   {
      
      public static var var_962:int = 3;
      
      public static var var_960:int = 5;
      
      public static var var_1130:int = 7;
      
      public static var var_655:int = 0;
      
      public static var var_1129:int = 6;
      
      public static var var_964:int = 4;
      
      public static var var_961:int = 2;
      
      public static var var_963:int = 1;
       
      
      public function ChangeUserNameResultMessageEvent(param1:Function)
      {
         super(param1,ChangeUserNameResultMessageParser);
      }
      
      public function getParser() : ChangeUserNameResultMessageParser
      {
         return var_7 as ChangeUserNameResultMessageParser;
      }
   }
}
