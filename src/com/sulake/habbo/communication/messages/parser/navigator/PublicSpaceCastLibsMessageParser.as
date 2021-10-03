package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PublicSpaceCastLibsMessageParser implements IMessageParser
   {
       
      
      private var var_1767:int;
      
      private var var_1769:String;
      
      private var var_1186:int;
      
      public function PublicSpaceCastLibsMessageParser()
      {
         super();
      }
      
      public function get unitPort() : int
      {
         return var_1767;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get castLibs() : String
      {
         return var_1769;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1186 = param1.readInteger();
         this.var_1769 = param1.readString();
         this.var_1767 = param1.readInteger();
         return true;
      }
      
      public function get nodeId() : int
      {
         return var_1186;
      }
   }
}
