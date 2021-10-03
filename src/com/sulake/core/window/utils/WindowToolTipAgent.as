package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IInteractiveWindow;
   import com.sulake.core.window.components.IToolTipWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowType;
   import flash.display.DisplayObject;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class WindowToolTipAgent extends WindowMouseOperator implements IWindowToolTipAgentService
   {
       
      
      protected var var_332:Timer;
      
      protected var var_972:String;
      
      protected var var_973:uint;
      
      protected var var_1139:Point;
      
      protected var var_248:IToolTipWindow;
      
      protected var var_1140:Point;
      
      public function WindowToolTipAgent(param1:DisplayObject)
      {
         var_1139 = new Point();
         var_1140 = new Point(20,20);
         var_973 = 500;
         super(param1);
      }
      
      override public function end(param1:IWindow) : IWindow
      {
         if(var_332 != null)
         {
            var_332.stop();
            var_332.removeEventListener(TimerEvent.TIMER,showToolTip);
            var_332 = null;
         }
         hideToolTip();
         return super.end(param1);
      }
      
      override public function operate(param1:int, param2:int) : void
      {
         if(_window && true)
         {
            _mouse.x = param1;
            _mouse.y = param2;
            getMousePositionRelativeTo(_window,_mouse,var_1139);
            if(var_248 != null && true)
            {
               var_248.x = param1 + var_1140.x;
               var_248.y = param2 + var_1140.y;
            }
         }
      }
      
      protected function showToolTip(param1:TimerEvent) : void
      {
         var _loc2_:* = null;
         if(var_332 != null)
         {
            var_332.reset();
         }
         if(_window && true)
         {
            if(var_248 == null || false)
            {
               var_248 = _window.context.create("undefined::ToolTip",var_972,WindowType.const_328,_window.style,0 | 0,null,null,null,0,null,null) as IToolTipWindow;
            }
            _loc2_ = new Point();
            _window.getGlobalPosition(_loc2_);
            var_248.x = _loc2_.x + var_1139.x + var_1140.x;
            var_248.y = _loc2_.y + var_1139.y + var_1140.y;
         }
      }
      
      override public function begin(param1:IWindow, param2:uint = 0) : IWindow
      {
         if(param1 && !param1.disposed)
         {
            if(param1 is IInteractiveWindow)
            {
               var_972 = IInteractiveWindow(param1).toolTipCaption;
               var_973 = IInteractiveWindow(param1).toolTipDelay;
            }
            else
            {
               var_972 = param1.caption;
               var_973 = 500;
            }
            _mouse.x = var_121.mouseX;
            _mouse.y = var_121.mouseY;
            getMousePositionRelativeTo(param1,_mouse,var_1139);
            if(var_972 != null && var_972 != "")
            {
               if(var_332 == null)
               {
                  var_332 = new Timer(var_973,1);
                  var_332.addEventListener(TimerEvent.TIMER,showToolTip);
               }
               var_332.reset();
               var_332.start();
            }
         }
         return super.begin(param1,param2);
      }
      
      protected function hideToolTip() : void
      {
         if(var_248 != null && true)
         {
            var_248.destroy();
            var_248 = null;
         }
      }
   }
}
