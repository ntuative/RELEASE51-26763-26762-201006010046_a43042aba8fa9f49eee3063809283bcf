package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2333:Boolean;
      
      private var var_2332:int;
      
      private var var_2335:Boolean;
      
      private var var_1560:String;
      
      private var var_1287:String;
      
      private var var_1754:int;
      
      private var var_2083:String;
      
      private var var_2334:String;
      
      private var var_2084:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1754 = param1.readInteger();
         this.var_1560 = param1.readString();
         this.var_2083 = param1.readString();
         this.var_2333 = param1.readBoolean();
         this.var_2335 = param1.readBoolean();
         param1.readString();
         this.var_2332 = param1.readInteger();
         this.var_2084 = param1.readString();
         this.var_2334 = param1.readString();
         this.var_1287 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1287;
      }
      
      public function get avatarName() : String
      {
         return this.var_1560;
      }
      
      public function get avatarId() : int
      {
         return this.var_1754;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2333;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2334;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2084;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2335;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2083;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2332;
      }
   }
}
