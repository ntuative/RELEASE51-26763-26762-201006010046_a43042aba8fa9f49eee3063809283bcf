package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ToolbarIcon
   {
       
      
      private var var_550:ToolbarIconGroup;
      
      private var var_1119:Boolean = false;
      
      private var var_2283:String;
      
      private var var_896:Number;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_1120:String = "-1";
      
      private var _window:IBitmapWrapperWindow;
      
      private var var_35:String = "-1";
      
      private var var_101:IRegionWindow;
      
      private var _bitmapData:BitmapData;
      
      private var var_784:String;
      
      private var var_2164:int;
      
      private var var_783:Timer;
      
      private var var_1626:Array;
      
      private var var_1122:ToolbarIconBouncer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _events:IEventDispatcher;
      
      private var var_2377:Array;
      
      private var var_290:ToolbarBarMenuAnimator;
      
      private var var_454:ToolbarIconAnimator;
      
      private var var_651:Array;
      
      private var var_953:Array;
      
      private var var_954:String = "-1";
      
      private var var_2428:Boolean = true;
      
      private var var_1121:Array;
      
      private var var_1396:Timer;
      
      private var var_2284:int;
      
      private var var_88:Number = 0;
      
      private var _y:Number = 0;
      
      public function ToolbarIcon(param1:ToolbarIconGroup, param2:IHabboWindowManager, param3:IAssetLibrary, param4:String, param5:IEventDispatcher, param6:ToolbarBarMenuAnimator)
      {
         var_651 = new Array();
         var_953 = new Array();
         var_2377 = new Array();
         var_1122 = new ToolbarIconBouncer(0.8,1);
         super();
         var_550 = param1;
         _windowManager = param2;
         _assetLibrary = param3;
         var_784 = param4;
         _events = param5;
         var_290 = param6;
         var_1396 = new Timer(40,40);
         var_1396.addEventListener(TimerEvent.TIMER,updateBouncer);
         var_101 = param2.createWindow("TOOLBAR_ICON_" + param4 + "_REGION","",WindowType.const_377,HabboWindowStyle.const_40,HabboWindowParam.const_44,new Rectangle(0,0,1,1),onMouseEvent) as IRegionWindow;
         var_101.background = true;
         var_101.mouseTreshold = 0;
         var_101.visible = false;
         _window = IBitmapWrapperWindow(param2.createWindow("TOOLBAR_ICON_" + param4,"",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_40,HabboWindowParam.const_40,new Rectangle(0,0,1,1),onMouseEvent,0));
         var_101.addChild(_window);
         _window.addEventListener(WindowEvent.const_47,onWindowResized);
      }
      
      private function getStateObject(param1:String) : StateItem
      {
         return var_1626[var_1121.indexOf(param1)];
      }
      
      public function get windowOffsetFromIcon() : Number
      {
         return var_2284;
      }
      
      public function get iconId() : String
      {
         return var_784;
      }
      
      private function onWindowResized(param1:WindowEvent) : void
      {
         updateRegion();
      }
      
      public function changePosition(param1:Number) : void
      {
         var_896 = param1;
         updateRegion();
      }
      
      public function setIcon(param1:Boolean = true) : void
      {
         exists = param1;
         setAnimator();
      }
      
      public function set state(param1:String) : void
      {
         var_35 = param1;
         exists = true;
         setAnimator();
         setTooltip();
      }
      
      private function updateRegion() : void
      {
         if(var_101 == null || _window == null)
         {
            return;
         }
         var_101.width = _window.width;
         var_101.height = _window.height;
         var _loc1_:Boolean = false;
         if(_loc1_)
         {
            var_88 = (0 - 0) / 2;
            _y = var_896 + (0 - 0) / 2;
         }
         else
         {
            var_88 = var_896 + (0 - 0) / 2;
            _y = (0 - 0) / 2;
         }
         var_101.x = var_88;
         var_101.y = _y;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_101 != null)
         {
            var_101.dispose();
            var_101 = null;
         }
         var_651 = null;
         var_953 = null;
         exists = false;
         _windowManager = null;
         _events = null;
         var_290 = null;
         var_454 = null;
         _bitmapData = null;
      }
      
      public function dockMenu(param1:String, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         if(var_651.indexOf(param1) < 0)
         {
            var_651.push(param1);
            _loc4_ = new MenuSettingsItem(param1,param2,param3);
            var_953.push(_loc4_);
         }
      }
      
      private function onMouseEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(!var_1119)
         {
            return;
         }
         var _loc3_:StateItem = getCurrentStateObject();
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(var_290)
               {
                  var_290.method_6(var_784,true);
               }
               if(_events != null)
               {
                  _loc4_ = new HabboToolbarEvent(HabboToolbarEvent.const_60);
                  _loc4_.iconId = var_784;
                  _events.dispatchEvent(_loc4_);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(false)
               {
                  if(_loc3_.hasStateOver)
                  {
                     state = _loc3_.stateOver;
                  }
                  else
                  {
                     state = var_1120;
                  }
               }
               break;
            case WindowMouseEvent.const_33:
               if(false)
               {
                  if(_loc3_.hasDefaultState)
                  {
                     state = _loc3_.defaultState;
                  }
                  else
                  {
                     state = var_954;
                  }
               }
         }
      }
      
      public function docksMenu(param1:String) : Boolean
      {
         return var_651.indexOf(param1) > -1;
      }
      
      public function menuLockedToIcon(param1:String) : Boolean
      {
         if(!docksMenu(param1))
         {
            return false;
         }
         var _loc2_:MenuSettingsItem = var_953[var_651.indexOf(param1)];
         return _loc2_.lockToIcon;
      }
      
      public function set exists(param1:Boolean) : void
      {
         var_1119 = param1;
         if(var_101 != null)
         {
            var_101.visible = var_1119;
         }
      }
      
      private function setTooltip() : void
      {
         if(var_101 == null)
         {
            return;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && _loc1_.tooltip != null)
         {
            var_101.toolTipCaption = "${toolbar.icon.tooltip." + _loc1_.tooltip + "}";
         }
         else
         {
            var_101.toolTipCaption = "${toolbar.icon.tooltip." + var_2283.toLowerCase() + "}";
         }
         var_101.toolTipDelay = 100;
      }
      
      public function animateWindowIn(param1:String, param2:IWindowContainer, param3:Number, param4:String, param5:Point) : void
      {
         if(var_290 != null)
         {
            var_290.animateWindowIn(this,param1,param2,var_784,param3,param4,getMenuYieldList(param1));
         }
      }
      
      private function updateAnimator(param1:Event) : void
      {
         if(var_454 != null && _window != null)
         {
            var_454.update(_window);
            if(var_454.hasNextState())
            {
               state = var_454.nextState;
            }
         }
      }
      
      public function defineFromXML(param1:XML) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_1626 = new Array();
         var_1121 = new Array();
         var_2283 = param1.@id;
         var_2284 = int(param1.@window_offset_from_icon);
         var_2164 = int(param1.@window_margin);
         var _loc2_:XMLList = param1.elements("state");
         if(_loc2_.length() > 0)
         {
            if(param1.attribute("state_over").length() > 0)
            {
               var_1120 = param1.@state_over;
            }
            if(param1.attribute("state_default").length() > 0)
            {
               var_954 = param1.@state_default;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length())
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = new StateItem(_loc4_,param1.@id.toLowerCase());
               var_1121.push(_loc5_.id);
               var_1626.push(_loc5_);
               if(_loc3_ == 0)
               {
                  if(var_1120 == "-1")
                  {
                     var_1120 = _loc5_.id;
                  }
                  if(var_954 == "-1")
                  {
                     var_954 = _loc5_.id;
                  }
               }
               _loc3_++;
            }
         }
         var_35 = var_954;
      }
      
      public function setIconBitmapData(param1:BitmapData = null) : void
      {
         exists = true;
         _bitmapData = param1;
         setAnimator();
      }
      
      public function hideWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_290 != null)
         {
            var_290.hideWindow(param1,param2,var_784,param3);
         }
      }
      
      public function positionWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_290 != null)
         {
            var_290.positionWindow(this,param1,param2,var_784,param3,getMenuYieldList(param1));
         }
      }
      
      public function animateWindowOut(param1:String, param2:IWindowContainer, param3:String) : void
      {
         if(var_290 != null)
         {
            var_290.animateWindowOut(this,param1,param2,param3);
         }
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get exists() : Boolean
      {
         return var_1119;
      }
      
      private function updateBouncer(param1:Event) : void
      {
         if(var_1122 != null && _window != null)
         {
            var_1122.update();
            _window.y = var_1122.location;
         }
      }
      
      private function setAnimator() : void
      {
         if(var_783 != null)
         {
            var_783.stop();
            var_783 = null;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && var_1119)
         {
            if(_loc1_.frames == null)
            {
               return;
            }
            var_454 = new ToolbarIconAnimator(_loc1_,_assetLibrary,_window,var_88,_y,_bitmapData);
            if(false)
            {
               var_783 = new Timer(_loc1_.timer);
               var_783.addEventListener(TimerEvent.TIMER,updateAnimator);
               var_783.start();
            }
            if(_loc1_.bounce)
            {
               var_1122.reset(-7);
               var_1396.reset();
               var_1396.start();
            }
         }
         else
         {
            var_454 = null;
            _window.bitmap = null;
         }
      }
      
      public function get method_4() : Number
      {
         return var_2164 + var_550.method_4;
      }
      
      private function getCurrentStateObject() : StateItem
      {
         return getStateObject(var_35);
      }
      
      public function get window() : IWindow
      {
         return var_101;
      }
      
      public function get x() : Number
      {
         return var_88;
      }
      
      private function getMenuYieldList(param1:String) : Array
      {
         if(!docksMenu(param1))
         {
            return null;
         }
         var _loc2_:MenuSettingsItem = var_953[var_651.indexOf(param1)];
         return _loc2_.yieldList;
      }
      
      public function get group() : ToolbarIconGroup
      {
         return var_550;
      }
   }
}
