package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_121:DisplayObject;
      
      private var var_2360:uint;
      
      private var var_868:IWindowToolTipAgentService;
      
      private var var_865:IWindowMouseScalingService;
      
      private var var_221:IWindowContext;
      
      private var var_867:IWindowFocusManagerService;
      
      private var var_864:IWindowMouseListenerService;
      
      private var var_866:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2360 = 0;
         var_121 = param2;
         var_221 = param1;
         var_866 = new WindowMouseDragger(param2);
         var_865 = new WindowMouseScaler(param2);
         var_864 = new WindowMouseListener(param2);
         var_867 = new FocusManager(param2);
         var_868 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_865;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_867;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_868;
      }
      
      public function dispose() : void
      {
         if(var_866 != null)
         {
            var_866.dispose();
            var_866 = null;
         }
         if(var_865 != null)
         {
            var_865.dispose();
            var_865 = null;
         }
         if(var_864 != null)
         {
            var_864.dispose();
            var_864 = null;
         }
         if(var_867 != null)
         {
            var_867.dispose();
            var_867 = null;
         }
         if(var_868 != null)
         {
            var_868.dispose();
            var_868 = null;
         }
         var_221 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_864;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_866;
      }
   }
}
