package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1316:int;
      
      private var var_1164:int;
      
      private var var_1317:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function get messageId() : int
      {
         return var_1316;
      }
      
      public function flush() : Boolean
      {
         var_1164 = 0;
         var_1316 = 0;
         var_1317 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1164;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1316 = param1.readInteger();
         var_1164 = param1.readInteger();
         var_1317 = param1.readString();
         return true;
      }
      
      public function get timestamp() : String
      {
         return var_1317;
      }
   }
}
