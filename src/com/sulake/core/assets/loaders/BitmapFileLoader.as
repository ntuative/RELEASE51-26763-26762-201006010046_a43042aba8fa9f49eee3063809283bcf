package com.sulake.core.assets.loaders
{
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   
   public class BitmapFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_975:LoaderContext;
      
      protected var var_658:String;
      
      protected var var_15:Loader;
      
      protected var _type:String;
      
      public function BitmapFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_658 = param2 == null ? "" : param2.url;
         _type = param1;
         var_15 = new Loader();
         var_975 = new LoaderContext();
         var_975.checkPolicyFile = true;
         var_15.contentLoaderInfo.addEventListener(Event.COMPLETE,loadEventHandler);
         var_15.contentLoaderInfo.addEventListener(Event.UNLOAD,loadEventHandler);
         var_15.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_15.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_15.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_15.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null && param2.url != null)
         {
            var_15.load(param2,var_975);
         }
      }
      
      public function get content() : Object
      {
         return !!var_15 ? var_15.content : null;
      }
      
      public function get bytesLoaded() : uint
      {
         return !!var_15 ? uint(var_15.contentLoaderInfo.bytesLoaded) : uint(0);
      }
      
      public function get mimeType() : String
      {
         return _type;
      }
      
      public function get bytesTotal() : uint
      {
         return !!var_15 ? uint(var_15.contentLoaderInfo.bytesTotal) : uint(0);
      }
      
      public function get loaderContext() : LoaderContext
      {
         return var_975;
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            var_15.contentLoaderInfo.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_15.contentLoaderInfo.removeEventListener(Event.UNLOAD,loadEventHandler);
            var_15.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_15.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_15.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_15.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            try
            {
               var_15.close();
            }
            catch(e:*)
            {
            }
            var_15.unload();
            var_15 = null;
            _type = null;
            var_658 = null;
         }
      }
      
      public function load(param1:URLRequest) : void
      {
         var_658 = param1.url;
         var_381 = 0;
         var_15.load(param1,var_975);
      }
      
      override protected function retry() : Boolean
      {
         if(!_disposed)
         {
            if(++var_381 < var_2382)
            {
               try
               {
                  var_15.close();
                  var_15.unload();
               }
               catch(e:Error)
               {
               }
               var_15.load(new URLRequest(var_658 + (var_658.indexOf("?") == -1 ? "?" : "&") + "retry=" + var_381),var_975);
               return true;
            }
         }
         return false;
      }
      
      public function get ready() : Boolean
      {
         return bytesTotal > 0 ? bytesTotal == bytesLoaded : false;
      }
      
      public function get url() : String
      {
         return var_658;
      }
   }
}
