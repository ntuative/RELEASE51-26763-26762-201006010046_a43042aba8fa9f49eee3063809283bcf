package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_313:String;
      
      private var var_2340:String;
      
      private var var_2337:int;
      
      private var var_2338:int;
      
      private var var_571:String;
      
      private var var_1287:String;
      
      private var _name:String;
      
      private var var_512:int;
      
      private var var_887:int;
      
      private var var_2341:int;
      
      private var _respectTotal:int;
      
      private var var_2339:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2338;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1287;
      }
      
      public function get customData() : String
      {
         return this.var_2340;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_512;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2337;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2339;
      }
      
      public function get figure() : String
      {
         return this.var_313;
      }
      
      public function get respectTotal() : int
      {
         return this._respectTotal;
      }
      
      public function get sex() : String
      {
         return this.var_571;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_313 = param1.readString();
         this.var_571 = param1.readString();
         this.var_2340 = param1.readString();
         this.var_1287 = param1.readString();
         this.var_2341 = param1.readInteger();
         this.var_2339 = param1.readString();
         this.var_2337 = param1.readInteger();
         this.var_2338 = param1.readInteger();
         this._respectTotal = param1.readInteger();
         this.var_887 = param1.readInteger();
         this.var_512 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2341;
      }
      
      public function get respectLeft() : int
      {
         return this.var_887;
      }
   }
}
