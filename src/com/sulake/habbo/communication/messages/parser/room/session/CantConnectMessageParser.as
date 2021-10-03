package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1585:int = 2;
      
      public static const const_1390:int = 4;
      
      public static const const_1184:int = 1;
      
      public static const const_1430:int = 3;
       
      
      private var var_1100:int = 0;
      
      private var var_926:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_1100;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1100 = param1.readInteger();
         if(var_1100 == 3)
         {
            var_926 = param1.readString();
         }
         else
         {
            var_926 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_1100 = 0;
         var_926 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_926;
      }
   }
}
