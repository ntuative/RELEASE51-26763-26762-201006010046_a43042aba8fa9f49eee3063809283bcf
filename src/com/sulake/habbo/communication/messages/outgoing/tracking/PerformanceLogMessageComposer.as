package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1093:int = 0;
      
      private var var_1386:int = 0;
      
      private var var_2072:String = "";
      
      private var var_1094:int = 0;
      
      private var var_2246:String = "";
      
      private var var_2247:int = 0;
      
      private var var_1559:String = "";
      
      private var var_2245:int = 0;
      
      private var var_2248:int = 0;
      
      private var var_2075:String = "";
      
      private var var_2249:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_2245 = param1;
         var_2075 = param2;
         var_1559 = param3;
         var_2072 = param4;
         var_2246 = param5;
         if(param6)
         {
            var_1386 = 1;
         }
         else
         {
            var_1386 = 0;
         }
         var_2247 = param7;
         var_2248 = param8;
         var_1094 = param9;
         var_2249 = param10;
         var_1093 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2245,var_2075,var_1559,var_2072,var_2246,var_1386,var_2247,var_2248,var_1094,var_2249,var_1093];
      }
      
      public function dispose() : void
      {
      }
   }
}
