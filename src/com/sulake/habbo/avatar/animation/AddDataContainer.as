package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var var_1503:String;
      
      private var var_1531:String;
      
      private var var_982:String;
      
      private var var_389:Number = 1;
      
      private var _id:String;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         _id = String(param1.@id);
         var_1503 = String(param1.@align);
         var_982 = String(param1.@base);
         var_1531 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            var_389 = Number(_loc2_);
            if(var_389 > 1)
            {
               var_389 /= 100;
            }
         }
      }
      
      public function get align() : String
      {
         return var_1503;
      }
      
      public function get ink() : String
      {
         return var_1531;
      }
      
      public function get base() : String
      {
         return var_982;
      }
      
      public function get isBlended() : Boolean
      {
         return var_389 != 1;
      }
      
      public function get blend() : Number
      {
         return var_389;
      }
      
      public function get id() : String
      {
         return _id;
      }
   }
}
