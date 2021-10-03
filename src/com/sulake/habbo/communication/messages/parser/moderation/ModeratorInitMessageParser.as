package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitMessageParser implements IMessageParser
   {
       
      
      private var _roomMessageTemplates:Array;
      
      private var var_2176:Boolean;
      
      private var var_1588:Array;
      
      private var var_2175:Boolean;
      
      private var var_2173:Boolean;
      
      private var var_2172:Boolean;
      
      private var var_152:Array;
      
      private var var_2171:Boolean;
      
      private var var_2170:Boolean;
      
      private var var_1587:Array;
      
      private var var_2177:Boolean;
      
      private var var_2174:Boolean;
      
      public function ModeratorInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get banPermission() : Boolean
      {
         return var_2174;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_2176;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_2175;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_2171;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return _roomMessageTemplates;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_2170;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1588;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_152 = [];
         var_1588 = [];
         _roomMessageTemplates = [];
         var_1587 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(!_loc2_.parse(param1))
            {
               return false;
            }
            var_152.push(_loc2_.issueData);
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1588.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1587.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_2171 = param1.readBoolean();
         var_2172 = param1.readBoolean();
         var_2175 = param1.readBoolean();
         var_2173 = param1.readBoolean();
         var_2174 = param1.readBoolean();
         var_2170 = param1.readBoolean();
         var_2176 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _roomMessageTemplates.push(param1.readString());
            _loc4_++;
         }
         var_2177 = param1.readBoolean();
         return true;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_2173;
      }
      
      public function get offenceCategories() : Array
      {
         return var_1587;
      }
      
      public function get issues() : Array
      {
         return var_152;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_2177;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_2172;
      }
   }
}
