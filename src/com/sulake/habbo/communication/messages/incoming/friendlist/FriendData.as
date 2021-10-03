package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_313:String;
      
      private var var_1288:String;
      
      private var var_1286:String;
      
      private var var_1269:int;
      
      private var var_570:int;
      
      private var var_1287:String;
      
      private var _name:String;
      
      private var var_1251:Boolean;
      
      private var var_750:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_570 = param1.readInteger();
         this.var_750 = param1.readBoolean();
         this.var_1251 = param1.readBoolean();
         this.var_313 = param1.readString();
         this.var_1269 = param1.readInteger();
         this.var_1286 = param1.readString();
         this.var_1288 = param1.readString();
         this.var_1287 = param1.readString();
      }
      
      public function get gender() : int
      {
         return var_570;
      }
      
      public function get realName() : String
      {
         return var_1287;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1286;
      }
      
      public function get categoryId() : int
      {
         return var_1269;
      }
      
      public function get online() : Boolean
      {
         return var_750;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1251;
      }
      
      public function get lastAccess() : String
      {
         return var_1288;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_313;
      }
   }
}
