package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_1738:int = 0;
      
      private var var_1441:int = 0;
      
      private var var_1737:Boolean = false;
      
      private var var_1740:int = 0;
      
      private var var_1736:int = 0;
      
      private var var_1442:int = 0;
      
      private var var_1739:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get clubDays() : int
      {
         return var_1441;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1441 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_1737 = param1;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         var_1739 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return var_1441 > 0 || var_1442 > 0;
      }
      
      public function get credits() : int
      {
         return var_1740;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         var_1736 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1442;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1737;
      }
      
      public function get pastClubDays() : int
      {
         return var_1739;
      }
      
      public function get pastVipDays() : int
      {
         return var_1736;
      }
      
      public function set pixels(param1:int) : void
      {
         var_1738 = param1;
      }
      
      public function get pixels() : int
      {
         return var_1738;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1442 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_1740 = param1;
      }
   }
}
