package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1278:int;
      
      private var var_1000:String;
      
      private var var_761:Array;
      
      private var var_1071:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_761.slice();
      }
      
      public function flush() : Boolean
      {
         var_1000 = "";
         var_1071 = [];
         var_761 = [];
         var_1278 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1278;
      }
      
      public function get question() : String
      {
         return var_1000;
      }
      
      public function get choices() : Array
      {
         return var_1071.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1000 = param1.readString();
         var_1071 = [];
         var_761 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_1071.push(param1.readString());
            var_761.push(param1.readInteger());
            _loc3_++;
         }
         var_1278 = param1.readInteger();
         return true;
      }
   }
}
