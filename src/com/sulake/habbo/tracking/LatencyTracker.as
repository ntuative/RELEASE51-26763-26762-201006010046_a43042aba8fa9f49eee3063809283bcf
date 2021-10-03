package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.tracking.LatencyPingResponseMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingReportMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingRequestMessageComposer;
   import com.sulake.habbo.communication.messages.parser.tracking.LatencyPingResponseMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LatencyTracker
   {
       
      
      private var var_157:Array;
      
      private var var_35:Boolean = false;
      
      private var var_1468:int = 0;
      
      private var var_1469:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_489:Map;
      
      private var var_1840:int = 0;
      
      private var var_1467:int = 0;
      
      private var var_159:IHabboConfigurationManager;
      
      private var var_1218:int = 0;
      
      private var _connection:IConnection;
      
      private var var_1470:int = 0;
      
      public function LatencyTracker()
      {
         super();
      }
      
      public function update(param1:uint) : void
      {
         if(!var_35)
         {
            return;
         }
         if(getTimer() - var_1468 > var_1469)
         {
            testLatency();
         }
      }
      
      private function testLatency() : void
      {
         var_1468 = getTimer();
         var_489.add(var_1218,var_1468);
         _connection.send(new LatencyPingRequestMessageComposer(var_1218));
         ++var_1218;
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function init() : void
      {
         if(var_159 == null || _communication == null || _connection == null)
         {
            return;
         }
         var_1469 = int(var_159.getKey("latencytest.interval"));
         var_1470 = int(var_159.getKey("latencytest.report.index"));
         var_1840 = int(var_159.getKey("latencytest.report.delta"));
         _communication.addHabboConnectionMessageEvent(new LatencyPingResponseMessageEvent(onPingResponse));
         if(var_1469 < 1)
         {
            return;
         }
         var_489 = new Map();
         var_157 = new Array();
         var_35 = true;
      }
      
      private function onPingResponse(param1:IMessageEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         if(var_489 == null || var_157 == null)
         {
            return;
         }
         var _loc2_:LatencyPingResponseMessageParser = (param1 as LatencyPingResponseMessageEvent).getParser();
         var _loc3_:int = var_489.getValue(_loc2_.requestId);
         var_489.remove(_loc2_.requestId);
         var _loc4_:int = getTimer() - _loc3_;
         var_157.push(_loc4_);
         if(var_157.length == var_1470 && var_1470 > 0)
         {
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc8_ < var_157.length)
            {
               _loc5_ += var_157[_loc8_];
               _loc8_++;
            }
            _loc9_ = _loc5_ / 0;
            _loc8_ = 0;
            while(_loc8_ < var_157.length)
            {
               if(var_157[_loc8_] < _loc9_ * 2)
               {
                  _loc6_ += var_157[_loc8_];
                  _loc7_++;
               }
               _loc8_++;
            }
            if(_loc7_ == 0)
            {
               var_157 = [];
               return;
            }
            _loc10_ = _loc6_ / _loc7_;
            if(Math.abs(_loc9_ - var_1467) > var_1840 || var_1467 == 0)
            {
               var_1467 = _loc9_;
               _loc11_ = new LatencyPingReportMessageComposer(_loc9_,_loc10_,var_157.length);
               _connection.send(_loc11_);
            }
            var_157 = [];
         }
      }
      
      public function dispose() : void
      {
         var_35 = false;
         var_159 = null;
         _communication = null;
         _connection = null;
         if(var_489 != null)
         {
            var_489.dispose();
            var_489 = null;
         }
         var_157 = null;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_159 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
