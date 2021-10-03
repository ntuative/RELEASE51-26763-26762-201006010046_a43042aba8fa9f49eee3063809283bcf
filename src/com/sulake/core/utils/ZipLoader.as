package com.sulake.core.utils
{
   import deng.fzip.FZip;
   import deng.fzip.FZipErrorEvent;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   
   public class ZipLoader extends LibraryLoader
   {
       
      
      private var var_479:uint = 0;
      
      private var var_99:FZip;
      
      private var var_1182:Array;
      
      private var var_1759:uint = 0;
      
      private var var_810:int = 0;
      
      private var var_480:uint = 0;
      
      public function ZipLoader(param1:Boolean)
      {
         super(param1);
         var_1182 = new Array();
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         debug("Load event IO ERROR for file \"undefined\"");
         if(!handleHttpStatus(var_163))
         {
            failure("IO Error, load operation failed for file \"undefined\" (" + var_479 + "/" + var_480 + " bytes): " + param1.text);
            removeEventListeners();
         }
      }
      
      override public function get bytesLoaded() : uint
      {
         return var_479;
      }
      
      private function onParseError(param1:FZipErrorEvent) : void
      {
         debug("Load event parse error for file \"undefined\"");
         if(!handleHttpStatus(var_163))
         {
            failure("Parse Error, load operation failed for file \"undefined\" (" + var_479 + "/" + var_480 + " bytes): " + param1.text);
            removeEventListeners();
         }
      }
      
      override protected function loadEventHandler(param1:Event) : void
      {
      }
      
      override public function get bytesTotal() : uint
      {
         return var_480;
      }
      
      public function get resources() : Array
      {
         return var_1182;
      }
      
      override protected function removeEventListeners() : void
      {
         if(var_99)
         {
            var_99.removeEventListener(Event.COMPLETE,onComplete);
            var_99.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
            var_99.removeEventListener(ProgressEvent.PROGRESS,onProgress);
            var_99.removeEventListener(HTTPStatusEvent.HTTP_STATUS,onHTTPStatus);
            var_99.removeEventListener(FZipErrorEvent.const_140,onParseError);
         }
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var name:String = null;
         var event:Event = param1;
         try
         {
            name = getQualifiedClassName(var_15.content);
            var_1182.push(var_15.contentLoaderInfo.applicationDomain.getDefinition(name));
            ++var_810;
            if(var_1182.length == var_1759)
            {
               var_15.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoaderComplete);
               var_15.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
               removeEventListeners();
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,0,var_480,var_479));
            }
            else
            {
               var_15.loadBytes(var_99.getFileAt(var_810).content);
            }
         }
         catch(e:Error)
         {
            failure("Crashed on ZipLoader.onLoaderComplete: \"undefined\" (" + var_479 + "/" + var_480 + " bytes): " + e.message);
         }
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         var_480 = param1.bytesTotal;
         var_479 = param1.bytesLoaded;
         debug("Load event PROGRESS for file \"undefined\"");
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,0,var_480,var_479));
      }
      
      override public function load(param1:URLRequest, param2:LoaderContext = null, param3:int = 5) : void
      {
         ErrorReportStorage.addDebugData("Library url","Library url " + param1.url);
         var_51 = param1;
         _name = parseNameFromUrl(var_51.url);
         var_291 = param3;
         if(var_99)
         {
            var_99.close();
         }
         ErrorReportStorage.addDebugData("Library name","Library name " + _name);
         var_99 = new FZip();
         var_99.addEventListener(Event.COMPLETE,onComplete);
         var_99.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_99.addEventListener(ProgressEvent.PROGRESS,onProgress);
         var_99.addEventListener(HTTPStatusEvent.HTTP_STATUS,onHTTPStatus);
         var_99.addEventListener(FZipErrorEvent.const_140,onParseError);
         var_99.load(var_51);
      }
      
      private function onComplete(param1:Event) : void
      {
         var event:Event = param1;
         var_810 = 0;
         var_1759 = var_99.getFileCount();
         debug("Load event COMPLETE for file \"undefined\"");
         removeEventListeners();
         try
         {
            if(var_15)
            {
               var_15.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderComplete);
               var_15.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
               var_15.loadBytes(var_99.getFileAt(var_810).content);
            }
         }
         catch(e:Error)
         {
            debug("Failed to extract files from library \"undefined\"");
            if(!handleHttpStatus(var_163))
            {
               failure("Crashed on ZipLoader.onComplete: \"undefined\" (" + var_479 + "/" + var_480 + " bytes): " + e.message);
            }
         }
      }
      
      private function onHTTPStatus(param1:HTTPStatusEvent) : void
      {
         var_163 = param1.status;
         debug("Load event STATUS " + var_163 + " for file \"" + var_51.url + "\"");
      }
      
      override protected function handleHttpStatus(param1:int) : Boolean
      {
         if(param1 == 0 || param1 >= 400)
         {
            if(var_291 > 0)
            {
               if(var_99)
               {
                  var_99.close();
               }
               addRequestCounterToUrlRequest(var_51,const_1054 - var_291);
               if(var_1137)
               {
                  var_51.requestHeaders.push(new URLRequestHeader("pragma","no-cache"));
                  var_51.requestHeaders.push(new URLRequestHeader("Cache-Control","no-cache"));
                  var_1137 = false;
               }
               var_99.load(var_51);
               --var_291;
               return true;
            }
            failure("HTTP Error " + param1 + " \"" + var_51.url + "\" (" + var_479 + "/" + var_480 + " bytes)");
            removeEventListeners();
         }
         return false;
      }
   }
}
