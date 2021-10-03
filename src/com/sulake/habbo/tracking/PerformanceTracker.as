package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1558:GarbageMonitor = null;
      
      private var var_1323:int = 0;
      
      private var var_1386:Boolean = false;
      
      private var var_2072:String = "";
      
      private var var_1559:String = "";
      
      private var var_357:Number = 0;
      
      private var var_1326:int = 10;
      
      private var var_2374:Array;
      
      private var var_666:int = 0;
      
      private var var_1324:int = 60;
      
      private var var_1093:int = 0;
      
      private var var_1094:int = 0;
      
      private var var_2246:String = "";
      
      private var var_2073:Number = 0;
      
      private var var_1325:int = 1000;
      
      private var var_2076:Boolean = true;
      
      private var var_2074:Number = 0.15;
      
      private var var_159:IHabboConfigurationManager = null;
      
      private var var_2075:String = "";
      
      private var var_1327:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2374 = [];
         super();
         var_1559 = Capabilities.version;
         var_2072 = Capabilities.os;
         var_1386 = Capabilities.isDebugger;
         var_2075 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1558 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1323 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1558.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1558.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_357;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1324 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1559;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_1094;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1325)
         {
            ++var_1093;
            _loc3_ = true;
         }
         else
         {
            ++var_666;
            if(var_666 <= 1)
            {
               var_357 = param1;
            }
            else
            {
               _loc4_ = Number(var_666);
               var_357 = var_357 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1323 > var_1324 * 1000 && var_1327 < var_1326)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_357);
            _loc5_ = true;
            if(var_2076 && var_1327 > 0)
            {
               _loc6_ = differenceInPercents(var_2073,var_357);
               if(_loc6_ < var_2074)
               {
                  _loc5_ = false;
               }
            }
            var_1323 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_2073 = var_357;
               if(sendReport())
               {
                  ++var_1327;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1326 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1325 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_2075,var_1559,var_2072,var_2246,var_1386,_loc4_,_loc3_,var_1094,var_357,var_1093);
            _connection.send(_loc1_);
            var_1094 = 0;
            var_357 = 0;
            var_666 = 0;
            var_1093 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_159 = param1;
         var_1324 = int(var_159.getKey("performancetest.interval","60"));
         var_1325 = int(var_159.getKey("performancetest.slowupdatelimit","1000"));
         var_1326 = int(var_159.getKey("performancetest.reportlimit","10"));
         var_2074 = Number(var_159.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_2076 = Boolean(int(var_159.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
