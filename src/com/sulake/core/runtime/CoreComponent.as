package com.sulake.core.runtime
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.runtime.events.WarningEvent;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.LibraryLoader;
   import com.sulake.core.utils.LibraryLoaderEvent;
   import com.sulake.core.utils.profiler.ProfilerViewer;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   import flash.utils.getTimer;
   
   public final class CoreComponent extends ComponentContext implements ICore
   {
      
      private static const const_144:uint = 3;
      
      private static const const_1082:String = "zip-libraries";
      
      private static const const_1085:String = "library";
      
      private static const const_1083:String = "library";
      
      private static const const_1087:String = "asset-libraries";
      
      private static const const_1088:String = "library";
      
      private static const const_1089:String = "service-libraries";
      
      private static const const_1086:String = "library";
      
      private static const const_1084:String = "component-libraries";
       
      
      private var var_256:uint;
      
      private var var_258:Array;
      
      private var var_300:uint;
      
      private var var_1022:IEventDispatcher;
      
      private var var_818:Profiler;
      
      private var var_255:Array;
      
      private var var_257:Array;
      
      private var var_483:Array;
      
      private var var_581:Array;
      
      private var var_259:Array;
      
      private var var_691:ProfilerViewer;
      
      public function CoreComponent(param1:DisplayObjectContainer, param2:uint)
      {
         super(this,Component.COMPONENT_FLAG_CONTEXT,new AssetLibraryCollection("_core_assets"));
         var_1420 = (param2 & 0) == Core.CORE_SETUP_DEBUG;
         var_483 = new Array();
         var_581 = new Array();
         var_215 = param1;
         var _loc3_:int = 0;
         while(_loc3_ < CoreComponent.const_144)
         {
            var_483.push(new Array());
            var_581.push(0);
            _loc3_++;
         }
         var_256 = getTimer();
         attachComponent(this,[new IIDCore()]);
         switch(param2 & 0)
         {
            case Core.const_1295:
               debug("Core; using simple frame update handler");
               var_215.addEventListener(Event.ENTER_FRAME,simpleFrameUpdateHandler);
               break;
            case Core.const_1048:
               debug("Core; using complex frame update handler");
               var_215.addEventListener(Event.ENTER_FRAME,complexFrameUpdateHandler);
               break;
            case Core.const_1261:
               debug("Core; using profiler frame update handler");
               var_215.addEventListener(Event.ENTER_FRAME,profilerFrameUpdateHandler);
               var_818 = new Profiler(this);
               attachComponent(var_818,[new IIDProfiler()]);
               var_691 = new ProfilerViewer();
               var_215.addChild(var_691);
               break;
            case Core.CORE_SETUP_DEBUG:
               debug("Core; using debug frame update handler");
               var_215.addEventListener(Event.ENTER_FRAME,debugFrameUpdateHandler);
         }
      }
      
      private function updateLoadingProgress(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(var_1022)
         {
            _loc2_ = getNumberOfFilesPending() - 1;
            _loc3_ = Number(param1.bytesLoaded) / Number(param1.bytesTotal);
            var_1022.dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS,false,false,param1.bytesLoaded,param1.bytesTotal));
         }
      }
      
      public function getNumberOfFilesLoaded() : uint
      {
         return var_300 - getNumberOfFilesPending();
      }
      
      private function debugFrameUpdateHandler(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = 0;
         var _loc8_:int = 0;
         var _loc2_:uint = getTimer();
         var _loc3_:uint = _loc2_ - var_256;
         var_256 = _loc2_;
         _loc4_ = 0;
         while(_loc4_ < CoreComponent.const_144)
         {
            var_581[_loc4_] = 0;
            _loc5_ = var_483[_loc4_];
            _loc8_ = 0;
            _loc7_ = uint(_loc5_.length);
            while(_loc8_ != _loc7_)
            {
               _loc6_ = IUpdateReceiver(_loc5_[_loc8_]);
               if(_loc6_ == null || _loc6_.disposed)
               {
                  _loc5_.splice(_loc8_,1);
                  _loc7_--;
               }
               else
               {
                  _loc6_.update(_loc3_);
                  _loc8_++;
               }
            }
            _loc4_++;
         }
      }
      
      public function getLastErrorMessage() : String
      {
         return var_970;
      }
      
      override public function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void
      {
         if(param4)
         {
            ErrorReportStorage.setParameter("error_data",String(param4.getStackTrace()));
         }
         ErrorReportStorage.setParameter("error_cat",String(param3));
         ErrorReportStorage.setParameter("error_desc",param1);
         super.error(param1,param2,param3);
         if(param2)
         {
            dispose();
         }
      }
      
      public function initialize() : void
      {
         _events.dispatchEvent(new Event(Component.COMPONENT_EVENT_RUNNING));
         Logger.log(toXMLString());
      }
      
      public function warning(param1:String) : void
      {
         var_2383 = param1;
         if(events == null)
         {
            Logger.log("Failed to dispatch an error because events was null. Message: " + param1);
         }
         else
         {
            events.dispatchEvent(new WarningEvent(Component.COMPONENT_EVENT_WARNING,param1));
         }
      }
      
      private function profilerFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:IUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_256;
         var_256 = msCurrentTime;
         var_818.start();
         criticality = 0;
         while(criticality < CoreComponent.const_144)
         {
            var_581[criticality] = 0;
            receivers = var_483[criticality];
            index = 0;
            length = receivers.length;
            while(index != length)
            {
               receiver = IUpdateReceiver(receivers[index]);
               if(receiver == null || receiver.disposed)
               {
                  receivers.splice(index,1);
                  length--;
               }
               else
               {
                  try
                  {
                     var_818.update(receiver,msSinceLastUpdate);
                  }
                  catch(e:Error)
                  {
                     error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                     return;
                  }
                  index++;
               }
            }
            criticality++;
         }
         var_818.stop();
         var_691.refresh(var_818);
      }
      
      private function finalizeLoadingEventDelegate() : void
      {
         if(var_1022)
         {
            var_1022.dispatchEvent(new Event(Event.COMPLETE));
         }
      }
      
      private function complexFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:IUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var skip:Boolean = false;
         var t:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_256;
         var maxTimePerFrame:uint = 1000 / var_215.stage.frameRate;
         var_256 = msCurrentTime;
         criticality = 0;
         while(criticality < CoreComponent.const_144)
         {
            t = getTimer();
            skip = false;
            if(t - msCurrentTime > maxTimePerFrame)
            {
               if(var_581[criticality] < criticality)
               {
                  ++0;
                  skip = true;
               }
            }
            if(!skip)
            {
               var_581[criticality] = 0;
               receivers = var_483[criticality];
               index = 0;
               length = receivers.length;
               while(index != length)
               {
                  receiver = IUpdateReceiver(receivers[index]);
                  if(receiver == null || receiver.disposed)
                  {
                     receivers.splice(index,1);
                     length--;
                  }
                  else
                  {
                     try
                     {
                        receiver.update(msSinceLastUpdate);
                     }
                     catch(e:Error)
                     {
                        trace(e.getStackTrace());
                        error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                        return;
                     }
                     index++;
                  }
               }
            }
            criticality++;
         }
      }
      
      private function simpleFrameUpdateHandler(param1:Event) : void
      {
         var criticality:uint = 0;
         var receivers:Array = null;
         var receiver:IUpdateReceiver = null;
         var length:uint = 0;
         var index:uint = 0;
         var event:Event = param1;
         var msCurrentTime:uint = getTimer();
         var msSinceLastUpdate:uint = msCurrentTime - var_256;
         var_256 = msCurrentTime;
         criticality = 0;
         while(criticality < CoreComponent.const_144)
         {
            var_581[criticality] = 0;
            receivers = var_483[criticality];
            index = 0;
            length = receivers.length;
            while(index != length)
            {
               receiver = IUpdateReceiver(receivers[index]);
               if(receiver == null || receiver.disposed)
               {
                  receivers.splice(index,1);
                  length--;
               }
               else
               {
                  try
                  {
                     receiver.update(msSinceLastUpdate);
                  }
                  catch(e:Error)
                  {
                     trace(e.getStackTrace());
                     error("Error in update receiver \"" + getQualifiedClassName(receiver) + "\": " + e.message,true,e.errorID,e);
                     return;
                  }
                  index++;
               }
            }
            criticality++;
         }
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(!disposed)
         {
            debug("Disposing core");
            var_215.removeEventListener(Event.ENTER_FRAME,simpleFrameUpdateHandler);
            var_215.removeEventListener(Event.ENTER_FRAME,complexFrameUpdateHandler);
            var_215.removeEventListener(Event.ENTER_FRAME,profilerFrameUpdateHandler);
            var_215 = null;
            _loc3_ = 0;
            while(_loc3_ < CoreComponent.const_144)
            {
               _loc2_ = var_483[_loc3_] as Array;
               _loc1_ = uint(_loc2_.length);
               while(_loc1_-- > 0)
               {
                  _loc2_.pop();
               }
               _loc3_++;
            }
            if(var_255 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_255.pop();
               }
            }
            if(var_259 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_259.pop();
               }
            }
            if(var_258 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_258.pop();
               }
            }
            if(var_257 != null)
            {
               _loc1_ = 0;
               while(_loc1_-- > 0)
               {
                  var_257.pop();
               }
            }
            if(var_691 != null)
            {
               var_691.dispose();
               var_691 = null;
            }
            super.dispose();
         }
      }
      
      public function getNumberOfFilesPending() : uint
      {
         return NaN;
      }
      
      public function readConfigDocument(param1:XML, param2:IEventDispatcher = null) : void
      {
         var node:XML = null;
         var list:XMLList = null;
         var item:XML = null;
         var url:String = null;
         var config:XML = param1;
         var loadingEventDelegate:IEventDispatcher = param2;
         debug("Parsing config document");
         var_1022 = loadingEventDelegate;
         if(var_255 == null)
         {
            var_255 = new Array();
         }
         try
         {
            node = config.child(const_1082)[0];
            if(node != null)
            {
               list = node.child(const_1085);
               for each(item in list)
               {
                  url = item.attribute("url").toString();
                  var_255.push(url);
                  ++var_300;
               }
            }
         }
         catch(e:Error)
         {
            error("Failed to parse zip libraries from config xml!",true,Core.const_192,e);
         }
         if(var_259 == null)
         {
            var_259 = new Array();
         }
         try
         {
            node = config.child(const_1087)[0];
            if(node != null)
            {
               list = node.child(const_1088);
               for each(item in list)
               {
                  url = item.attribute("url").toString();
                  var_259.push(url);
                  ++var_300;
               }
            }
         }
         catch(e:Error)
         {
            error("Failed to parse asset libraries from config xml!",true,Core.const_192,e);
         }
         if(var_258 == null)
         {
            var_258 = new Array();
         }
         try
         {
            node = config.child(const_1089)[0];
            if(node != null)
            {
               list = node.child(const_1086);
               for each(item in list)
               {
                  url = item.attribute("url").toString();
                  var_258.push(url);
                  ++var_300;
               }
            }
         }
         catch(e:Error)
         {
            error("Failed to parse interfaces from config xml!",true,Core.const_192,e);
         }
         if(var_257 == null)
         {
            var_257 = new Array();
         }
         try
         {
            node = config.child(const_1084)[0];
            if(node != null)
            {
               list = node.child(const_1083);
               for each(item in list)
               {
                  url = item.attribute("url").toString();
                  var_257.push(url);
                  ++var_300;
               }
            }
         }
         catch(e:Error)
         {
            error("Failed to parse components from config xml!",true,Core.const_192,e);
         }
         if(!disposed)
         {
            updateLoadingProcess();
         }
      }
      
      private function updateLoadingProcess(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 != null)
         {
            if(param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE || param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR)
            {
               _loc2_ = param1.target as LibraryLoader;
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               _loc2_.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,updateLoadingProgress);
               _loc3_ = _loc2_.url;
               debug("Loading library \"" + _loc3_ + "\" " + (param1.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE ? "ready" : "failed\n" + _loc2_.getLastErrorMessage()));
               if(false)
               {
                  if(var_255[0] == _loc3_)
                  {
                     var_255.splice(0,1);
                  }
               }
               if(false)
               {
                  if(var_259[0] == _loc3_)
                  {
                     var_259.splice(0,1);
                  }
               }
               if(false)
               {
                  if(var_258[0] == _loc3_)
                  {
                     var_258.splice(0,1);
                  }
               }
               if(false)
               {
                  if(var_257[0] == _loc3_)
                  {
                     var_257.splice(0,1);
                  }
               }
            }
         }
         if(false)
         {
            _loc3_ = "null";
            _loc2_ = _assets.loadFromArchive(new URLRequest(_loc3_),null);
            if(_loc2_.ready)
            {
               var_255.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,updateLoadingProgress);
               debug("Loading zip library " + _loc3_);
            }
            return;
         }
         if(false)
         {
            _loc3_ = "null";
            _loc4_ = new LoaderContext(false,new ApplicationDomain());
            _loc2_ = _assets.loadFromFile(new URLRequest(_loc3_),true,_loc4_);
            if(_loc2_.ready)
            {
               var_259.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,updateLoadingProgress);
               debug("Loading asset library " + _loc3_);
            }
            return;
         }
         if(false)
         {
            _loc3_ = "null";
            _loc2_ = loadFromFile(new URLRequest(_loc3_),new LoaderContext(false,ApplicationDomain.currentDomain,null));
            if(_loc2_.ready)
            {
               var_258.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,updateLoadingProgress);
               debug("Loading service library " + _loc3_);
            }
            return;
         }
         if(false)
         {
            _loc3_ = "null";
            _loc2_ = loadFromFile(new URLRequest(_loc3_),new LoaderContext(false,ApplicationDomain.currentDomain,null));
            if(_loc2_.ready)
            {
               var_257.splice(0,1);
               updateLoadingProcess();
            }
            else
            {
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,updateLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,errorInLoadingProcess);
               _loc2_.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,updateLoadingProgress);
               debug("Loading component library " + _loc3_);
            }
            return;
         }
         finalizeLoadingEventDelegate();
         debug("All libraries loaded, Core is now running");
      }
      
      private function errorInLoadingProcess(param1:LibraryLoaderEvent = null) : void
      {
         var _loc2_:LibraryLoader = LibraryLoader(param1.target);
         error("Failed to download library \"" + _loc2_.url + "\" HTTP status " + param1.status + ": " + _loc2_.getLastErrorMessage(),true,Core.const_1334);
         if(!_isDisposed)
         {
            updateLoadingProcess(param1);
         }
      }
      
      public function getLastDebugMessage() : String
      {
         return var_2321;
      }
      
      override public function registerUpdateReceiver(param1:IUpdateReceiver, param2:uint) : void
      {
         removeUpdateReceiver(param1);
         param2 = param2 >= CoreComponent.const_144 ? 4294967295 : uint(param2);
         var _loc3_:Array = var_483[param2] as Array;
         _loc3_.push(param1);
      }
      
      override public function removeUpdateReceiver(param1:IUpdateReceiver) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         while(_loc4_ < CoreComponent.const_144)
         {
            _loc3_ = var_483[_loc4_] as Array;
            _loc2_ = _loc3_.indexOf(param1);
            if(_loc2_ > -1)
            {
               _loc3_[_loc2_] = null;
               return;
            }
            _loc4_++;
         }
      }
   }
}
