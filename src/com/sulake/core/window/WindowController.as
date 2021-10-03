package com.sulake.core.window
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.enum.MouseListenerType;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.events.WindowDisposeEvent;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.WindowNotifyEvent;
   import com.sulake.core.window.graphics.GraphicContext;
   import com.sulake.core.window.graphics.IGraphicContext;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.WindowRedrawFlag;
   import com.sulake.core.window.utils.DefaultAttStruct;
   import com.sulake.core.window.utils.WindowRectLimits;
   import flash.display.BitmapData;
   import flash.display.IBitmapDrawable;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class WindowController extends WindowModel implements IWindow, IGraphicContextHost
   {
      
      private static var var_1521:Point = new Point();
      
      protected static const EXCLUDE_CHILD_TAG:String = "_EXCLUDE";
      
      protected static const INTERNAL_CHILD_TAG:String = "_INTERNAL";
      
      private static var var_1274:uint = 0;
       
      
      protected var var_164:Boolean = true;
      
      private var var_1066:Boolean = false;
      
      protected var _events:IEventDispatcher;
      
      private var var_312:Rectangle;
      
      protected var var_660:Function;
      
      protected var _children:Array;
      
      protected var var_1420:Boolean = false;
      
      private var var_2007:uint;
      
      protected var var_9:WindowController;
      
      protected var var_17:IGraphicContext;
      
      public function WindowController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         var _loc14_:* = 0;
         var_2007 = var_1274++;
         var _loc12_:XML = param5.getWindowFactory().getLayoutByTypeAndStyle(param2,param3);
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,!!_loc12_ ? Number(int(_loc12_.attribute("width"))) : Number(10),!!_loc12_ ? Number(int(_loc12_.attribute("height"))) : Number(10));
         }
         super(param11,param1,param2,param3,param4,param5,param6,param10);
         if(!var_17)
         {
            var_17 = getGraphicContext(!testParamFlag(WindowParam.const_36));
         }
         _events = new EventDispatcher(this);
         _children = new Array();
         var_312 = new Rectangle();
         if(_loc12_ != null)
         {
            var_380 = new Rectangle(0,0,int(_loc12_.attribute("width")),int(_loc12_.attribute("height")));
            var_58 = var_380.clone();
            var_8 = var_380.clone();
            param5.getWindowParser().parseAndConstruct(_loc12_,this,null);
            _loc14_ = uint(_param);
            _param &= -1;
            setRectangle(param6.x,param6.y,param6.width,param6.height);
            _param = _loc14_;
            var_58.x = param6.x;
            var_58.y = param6.y;
            var_58.width = param6.width;
            var_58.height = param6.height;
         }
         var _loc13_:DefaultAttStruct = param5.getWindowFactory().getDefaultsByTypeAndStyle(param2,param3);
         if(_loc13_)
         {
            var_389 = _loc13_.blend;
            var_554 = _loc13_.treshold;
            if(var_657 != _loc13_.background)
            {
               background = _loc13_.background;
            }
            if(var_555 != _loc13_.color)
            {
               color = _loc13_.color;
            }
         }
         if(param9)
         {
            this.properties = param9;
         }
         var_660 = param8;
         if(param7 != null)
         {
            var_9 = param7 as WindowController;
            WindowController(param7).addChild(this);
            if(var_17)
            {
               var_16.invalidate(this,var_8,WindowRedrawFlag.const_78);
            }
         }
      }
      
      private static function calculateMouseRegion(param1:WindowController, param2:Rectangle) : void
      {
         var _loc3_:Rectangle = new Rectangle();
         param1.getGlobalRectangle(_loc3_);
         var _loc4_:int = param1.numChildren;
         var _loc5_:int = _loc3_.x;
         var _loc6_:int = _loc3_.y;
         param2.left = _loc5_ < param2.left ? Number(_loc5_) : Number(param2.left);
         param2.top = _loc6_ < param2.top ? Number(_loc6_) : Number(param2.top);
         param2.right = _loc3_.right > param2.right ? Number(_loc3_.right) : Number(param2.right);
         param2.bottom = _loc3_.bottom > param2.bottom ? Number(_loc3_.bottom) : Number(param2.bottom);
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_)
         {
            WindowController.calculateMouseRegion(param1.getChildAt(_loc7_) as WindowController,param2);
            _loc7_++;
         }
      }
      
      public static function resizeToAccommodateChildren(param1:WindowController, param2:Boolean = true) : void
      {
         var _loc3_:int = 0;
         var _loc8_:* = null;
         var _loc12_:* = null;
         var _loc13_:Boolean = false;
         var _loc4_:int = !!param2 ? 0 : 0;
         var _loc5_:int = !!param2 ? 0 : 0;
         var _loc6_:int = !!param2 ? 0 : 0;
         var _loc7_:int = !!param2 ? 0 : 0;
         var _loc9_:Boolean = false;
         var _loc10_:uint = param1.numChildren;
         var _loc11_:Boolean = param1.getParamFlag(WindowParam.const_68);
         if(param2)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc10_)
            {
               _loc8_ = param1.getChildAt(_loc3_).rectangle;
               if(_loc8_.x < _loc4_)
               {
                  _loc4_ = _loc8_.x;
                  _loc9_ = true;
               }
               if(_loc8_.right > _loc6_)
               {
                  _loc6_ = _loc8_.right;
                  _loc9_ = true;
               }
               if(_loc8_.y < _loc5_)
               {
                  _loc5_ = _loc8_.y;
                  _loc9_ = true;
               }
               if(_loc8_.bottom > _loc7_)
               {
                  _loc7_ = _loc8_.bottom;
                  _loc9_ = true;
               }
               _loc3_++;
            }
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < _loc10_)
            {
               _loc8_ = param1.getChildAt(_loc3_).rectangle;
               if(_loc8_.x < _loc4_)
               {
                  _loc4_ = _loc8_.x;
                  _loc9_ = true;
               }
               if(_loc8_.right > _loc6_)
               {
                  _loc6_ = _loc8_.right;
                  _loc9_ = true;
               }
               if(_loc8_.y < _loc5_)
               {
                  _loc5_ = _loc8_.y;
                  _loc9_ = true;
               }
               if(_loc8_.bottom > _loc7_)
               {
                  _loc7_ = _loc8_.bottom;
                  _loc9_ = true;
               }
               _loc3_++;
            }
         }
         if(_loc9_)
         {
            if(_loc11_)
            {
               param1.setParamFlag(WindowParam.const_68,false);
            }
            if(param2)
            {
               _loc3_ = 0;
               while(_loc3_ < _loc10_)
               {
                  _loc12_ = param1.getChildAt(_loc3_);
                  _loc13_ = param1.testParamFlag(WindowParam.const_88);
                  if(_loc13_)
                  {
                     param1.setParamFlag(WindowParam.const_88,false);
                  }
                  param1.offset(-_loc4_,-_loc5_);
                  if(_loc13_)
                  {
                     param1.setParamFlag(WindowParam.const_88,true);
                  }
                  _loc3_++;
               }
            }
            else
            {
               _loc3_ = 0;
               while(_loc3_ < _loc10_)
               {
                  param1.getChildAt(_loc3_).offset(-_loc4_,-_loc5_);
                  _loc3_++;
               }
            }
            param1.setRectangle(param1.x + _loc4_,param1.y + _loc5_,!!param2 ? int(_loc6_ - _loc4_) : int(_loc6_),!!param2 ? int(_loc7_ - _loc5_) : int(_loc7_));
            if(_loc11_)
            {
               param1.setParamFlag(WindowParam.const_68,true);
            }
         }
      }
      
      public static function expandToAccommodateChild(param1:WindowController, param2:IWindow) : void
      {
         var _loc9_:Boolean = false;
         var _loc10_:int = 0;
         var _loc11_:* = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = param1.width;
         var _loc6_:int = param1.height;
         var _loc7_:Rectangle = param2.rectangle.clone();
         var _loc8_:Boolean = false;
         if(_loc7_.x < 0)
         {
            _loc3_ = _loc7_.x;
            _loc5_ -= _loc3_;
            _loc7_.x = 0;
            _loc8_ = true;
         }
         if(_loc7_.right > _loc5_)
         {
            _loc5_ = _loc7_.x + _loc7_.width;
            _loc8_ = true;
         }
         if(_loc7_.y < 0)
         {
            _loc4_ = _loc7_.y;
            _loc6_ -= _loc4_;
            _loc7_.y = 0;
            _loc8_ = true;
         }
         if(_loc7_.bottom > _loc6_)
         {
            _loc6_ = _loc7_.y + _loc7_.height;
            _loc8_ = true;
         }
         if(_loc8_)
         {
            _loc9_ = param1.getParamFlag(WindowParam.const_68);
            param1.setParamFlag(WindowParam.const_68,false);
            param1.setRectangle(param1.x + _loc3_,param1.y + _loc4_,_loc5_,_loc6_);
            if(_loc4_ != 0 || _loc3_ != 0)
            {
               _loc11_ = uint(param1.numChildren);
               _loc10_ = 0;
               while(_loc10_ < _loc11_)
               {
                  IWindow(param1.getChildAt(_loc10_)).offset(-_loc3_,-_loc4_);
                  _loc10_++;
               }
            }
            if(_loc9_)
            {
               param1.setParamFlag(WindowParam.const_68,true);
            }
         }
      }
      
      public function getStyleFlag(param1:uint) : Boolean
      {
         return (var_81 & param1) != 0;
      }
      
      public function resolveHorizontalScale() : Number
      {
         return 0 / 0;
      }
      
      public function getChildByTag(param1:String) : IWindow
      {
         var _loc2_:* = null;
         for each(_loc2_ in _children)
         {
            if(_loc2_.tags.indexOf(param1) > -1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      protected function updateScaleRelativeToParent() : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:* = null;
         if(var_9 == null)
         {
            return;
         }
         var _loc1_:* = !testParamFlag(WindowParam.const_114,WindowParam.const_149);
         var _loc2_:* = !testParamFlag(WindowParam.const_125,WindowParam.const_147);
         if(_loc1_ || _loc2_)
         {
            _loc3_ = var_8.clone();
            if(_loc1_)
            {
               _loc4_ = 0 - 0;
               _loc5_ = uint(_param & 0);
               if(_loc5_ == WindowParam.const_280)
               {
                  _loc3_.width += _loc4_;
               }
               else if(_loc5_ == WindowParam.const_320)
               {
                  _loc3_.x += _loc4_;
               }
               else if(_loc5_ == WindowParam.const_166)
               {
                  if(var_9.width < _loc3_.width && getParamFlag(WindowParam.const_36))
                  {
                     _loc3_.x = 0;
                  }
                  else
                  {
                     _loc3_.x = 0 - _loc3_.width / 2;
                  }
               }
            }
            if(_loc2_)
            {
               _loc4_ = 0 - 0;
               _loc5_ = uint(_param & 0);
               if(_loc5_ == WindowParam.const_259)
               {
                  _loc3_.height += _loc4_;
               }
               else if(_loc5_ == WindowParam.const_329)
               {
                  _loc3_.y += _loc4_;
               }
               else if(_loc5_ == WindowParam.const_183)
               {
                  if(var_9.height < _loc3_.height && getParamFlag(WindowParam.const_36))
                  {
                     _loc3_.y = 0;
                  }
                  else
                  {
                     _loc3_.y = 0 - _loc3_.height / 2;
                  }
               }
            }
            _loc6_ = uint(_param);
            _param &= -1;
            setRectangle(_loc3_.x,_loc3_.y,_loc3_.width,_loc3_.height);
            _param = _loc6_;
         }
         else if(testParamFlag(WindowParam.const_88))
         {
            _loc3_ = var_8.clone();
            if(var_9 != null)
            {
               _loc7_ = var_9.rectangle;
               _loc3_.x = _loc3_.x < 0 ? 0 : Number(_loc3_.x);
               _loc3_.y = _loc3_.y < 0 ? 0 : Number(_loc3_.y);
               _loc3_.x -= _loc3_.x + _loc3_.width > _loc7_.width ? _loc3_.x + _loc3_.width - _loc7_.width : 0;
               _loc3_.y -= _loc3_.y + _loc3_.height > _loc7_.height ? _loc3_.y + _loc3_.height - _loc7_.height : 0;
               _loc3_.width -= _loc3_.x + _loc3_.width > _loc7_.width ? _loc3_.x + _loc3_.width - _loc7_.width : 0;
               _loc3_.height -= _loc3_.y + _loc3_.height > _loc7_.height ? _loc3_.y + _loc3_.height - _loc7_.height : 0;
               if(_loc3_.x != var_8.x || _loc3_.y != var_8.y || _loc3_.width != var_8.width || _loc3_.height != var_8.height)
               {
                  _loc6_ = uint(_param);
                  _param &= -1;
                  setRectangle(_loc3_.x,_loc3_.y,_loc3_.width,_loc3_.height);
                  _param = _loc6_;
               }
            }
         }
      }
      
      public function get desktop() : IDesktopWindow
      {
         return var_16.getDesktopWindow();
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            if(true)
            {
               if(!isChildWindow())
               {
                  if(getStateFlag(WindowState.const_94))
                  {
                     deactivate();
                  }
               }
            }
            while(false)
            {
               IDisposable(_children.pop()).dispose();
            }
            if(parent)
            {
               parent = null;
            }
            dispatchEvent(new WindowDisposeEvent(this));
            if(_events is IDisposable)
            {
               IDisposable(_events).dispose();
               _events = null;
            }
            if(var_17 != null)
            {
               var_17.dispose();
               var_17 = null;
            }
            super.dispose();
         }
      }
      
      protected function forwardKeyboardEvent(param1:KeyboardEvent) : WindowEvent
      {
         var _loc2_:String = "null";
         switch(param1.type)
         {
            case KeyboardEvent.KEY_DOWN:
               _loc2_ = "null";
               break;
            case KeyboardEvent.KEY_UP:
               _loc2_ = "null";
         }
         var _loc4_:WindowEvent = new WindowKeyboardEvent(_loc2_,param1,this,null,false,true);
         procedure(_loc4_,this);
         if(!_loc4_.isWindowOperationPrevented())
         {
            dispatchEvent(_loc4_);
         }
         return _loc4_;
      }
      
      public function set tags(param1:Array) : void
      {
         if(param1 != null)
         {
            var_656 = param1;
         }
      }
      
      public function getChildAt(param1:int) : IWindow
      {
         return _children[param1] as IWindow;
      }
      
      public function set id(param1:uint) : void
      {
         _id = param1;
      }
      
      public function getChildByID(param1:uint) : IWindow
      {
         var _loc2_:* = null;
         for each(_loc2_ in _children)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function findChildByName(param1:String) : IWindow
      {
         var _loc2_:* = null;
         for each(_loc2_ in _children)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         for each(_loc2_ in _children)
         {
            _loc2_ = _loc2_.findChildByName(param1) as WindowController;
            if(_loc2_)
            {
               return _loc2_ as IWindow;
            }
         }
         return null;
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         var _loc2_:Boolean = false;
         if(!_disposed)
         {
            _loc2_ = _events.dispatchEvent(param1);
         }
         return _loc2_;
      }
      
      public function open() : Boolean
      {
         if(getStateFlag(WindowState.const_89))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_899,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         visible = true;
         _loc1_.type = WindowNotifyEvent.const_1007;
         update(this,_loc1_);
         return true;
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         if(!_disposed)
         {
            _events.addEventListener(param1,param2,param3,param4,param5);
         }
      }
      
      public function set position(param1:Point) : void
      {
         setRectangle(param1.x,param1.y,var_8.width,var_8.height);
      }
      
      public function get debug() : Boolean
      {
         return var_1420;
      }
      
      public function set height(param1:int) : void
      {
         if(param1 != var_8.height)
         {
            setRectangle(var_8.x,var_8.y,var_8.width,param1);
         }
      }
      
      public function set background(param1:Boolean) : void
      {
         var_657 = param1;
         var_555 = !!var_657 ? uint(var_555 | var_1410) : uint(var_555 & 16777215);
         var_164 = var_164 || param1;
         var_16.invalidate(this,var_8,WindowRedrawFlag.const_78);
      }
      
      public function set mouseTreshold(param1:uint) : void
      {
         var_554 = param1 > 255 ? 255 : uint(param1);
      }
      
      public function setGlobalRectangle(param1:Rectangle) : void
      {
         var _loc2_:Point = new Point();
         if(var_9 != null)
         {
            var_9.getGlobalPosition(_loc2_);
            _loc2_.x += var_8.x;
            _loc2_.y += var_8.y;
         }
         else
         {
            _loc2_.x = var_8.x;
            _loc2_.y = var_8.y;
         }
         setRectangle(x + (param1.x - _loc2_.x),y + (param1.y - _loc2_.y),param1.width,param1.height);
      }
      
      public function center() : void
      {
         if(var_9 != null)
         {
            x = 0 - 0;
            y = 0 - 0;
         }
      }
      
      public function set properties(param1:Array) : void
      {
      }
      
      private function notifyChildren(param1:WindowNotifyEvent) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in _children)
         {
            _loc2_.update(this,param1);
         }
      }
      
      public function hitTestLocalRectangle(param1:Rectangle) : Boolean
      {
         return var_8.intersects(param1);
      }
      
      public function toString() : String
      {
         return "[Window " + getQualifiedClassName(this) + " " + var_2007 + "]";
      }
      
      public function setupGraphicsContext() : IGraphicContext
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var_17 = getGraphicContext(true);
         if(var_9)
         {
            var_9.setupGraphicsContext();
         }
         if(false)
         {
            if(var_17.numChildContexts != numChildren)
            {
               _loc1_ = 0;
               for each(_loc2_ in _children)
               {
                  var_17.addChildContextAt(_loc2_.getGraphicContext(true),_loc1_++);
               }
            }
         }
         var_1066 = true;
         return var_17;
      }
      
      public function set type(param1:uint) : void
      {
         if(param1 != _type)
         {
            _type = param1;
            var_16.invalidate(this,var_8,WindowRedrawFlag.const_78);
         }
      }
      
      protected function notifyEventListeners(param1:WindowEvent) : void
      {
         procedure(param1,this);
         if(!param1.isWindowOperationPrevented())
         {
            if(hasEventListener(param1.type))
            {
               dispatchEvent(param1);
            }
         }
      }
      
      protected function forwardWindowNotifyEvent(param1:WindowNotifyEvent) : WindowEvent
      {
         var _loc5_:* = null;
         if(_disposed)
         {
            return _loc5_;
         }
         var _loc2_:String = "null";
         var _loc3_:IWindow = !!param1.related ? param1.related : param1.window;
         var _loc4_:Boolean = false;
         switch(param1.type)
         {
            case WindowNotifyEvent.const_608:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_189:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_1005:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_438:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_917:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_308:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_952:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_887:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_1346:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_1414:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_858:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_968:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_481:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_338:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_704:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_745:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_843:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_716:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_1027:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_660:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_899:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_1007:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_876:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_1011:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_1030:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_935:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_1009:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_969:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_912:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_880:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_966:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_869:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_863:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_847:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_388:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_386:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_497:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_754:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_224:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_827:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_282:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_401:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_300:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_960:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_713:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_484:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_271:
               _loc2_ = "null";
         }
         if(_loc2_ == WindowEvent.const_174)
         {
            throw new Error("Unknown window notify event: " + param1.type + "!");
         }
         _loc5_ = new WindowEvent(_loc2_,this,_loc3_,false,_loc4_);
         procedure(_loc5_,this);
         if(!_disposed)
         {
            if(!(_loc4_ && _loc5_.isWindowOperationPrevented()))
            {
               if(hasEventListener(_loc2_))
               {
                  dispatchEvent(_loc5_);
               }
            }
            if(param1.cancelable)
            {
               if(_loc5_.isWindowOperationPrevented())
               {
                  param1.preventWindowOperation();
               }
            }
         }
         return _loc5_;
      }
      
      public function setStyleFlag(param1:uint, param2:Boolean = true) : void
      {
         var _loc3_:uint = var_81;
         var _loc4_:*;
         var_81 = !!param2 ? (_loc4_ = var_81 | param1, var_81 |= param1, uint(_loc4_)) : (_loc4_ = var_81 & ~param1, var_81 &= ~param1, uint(_loc4_));
         if(var_81 != _loc3_)
         {
            update(this,new WindowNotifyEvent(WindowNotifyEvent.const_388,this,null));
         }
      }
      
      public function swapChildrenAt(param1:int, param2:int) : void
      {
         swapChildren(_children[param1],_children[param2]);
         var_17.swapChildContextsAt(param1,param2);
      }
      
      public function getChildByName(param1:String) : IWindow
      {
         var _loc2_:* = null;
         for each(_loc2_ in _children)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function deactivate() : Boolean
      {
         if(!getStateFlag(WindowState.const_94))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_952,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_94,false);
         _loc1_.type = WindowNotifyEvent.const_887;
         update(this,_loc1_);
         return true;
      }
      
      public function restore() : Boolean
      {
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_912,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_70,false);
         _loc1_.type = WindowNotifyEvent.const_880;
         update(this,_loc1_);
         return true;
      }
      
      public function offset(param1:Number, param2:Number) : void
      {
         setRectangle(var_8.x + param1,var_8.y + param2,var_8.width,var_8.height);
      }
      
      public function getGraphicContext(param1:Boolean) : IGraphicContext
      {
         if(param1 && !var_17)
         {
            var_17 = new GraphicContext("GC {" + _name + "}",GraphicContext.const_622,var_8);
            var_17.visible = var_374;
         }
         return var_17;
      }
      
      public function minimize() : Boolean
      {
         if(var_35 & 0)
         {
            return false;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_1030,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_70,true);
         _loc1_.type = WindowNotifyEvent.const_935;
         update(this,_loc1_);
         return true;
      }
      
      public function findChildByTag(param1:String) : IWindow
      {
         if(var_656.indexOf(param1) > -1)
         {
            return this;
         }
         var _loc2_:WindowController = WindowController(getChildByTag(param1));
         if(_loc2_ == null)
         {
            for each(_loc2_ in _children)
            {
               _loc2_ = _loc2_.findChildByTag(param1) as WindowController;
               if(_loc2_ != null)
               {
                  break;
               }
            }
         }
         return _loc2_ as IWindow;
      }
      
      protected function isChildWindow() : Boolean
      {
         return var_9 != context.getDesktopWindow();
      }
      
      public function set debug(param1:Boolean) : void
      {
         var_1420 = param1;
      }
      
      public function set blend(param1:Number) : void
      {
         var_389 = param1 > 1 ? 1 : (param1 < 0 ? 0 : Number(param1));
         var_16.invalidate(this,var_8,WindowRedrawFlag.const_914);
      }
      
      public function addChildAt(param1:IWindow, param2:int) : IWindow
      {
         var _loc3_:WindowController = WindowController(param1);
         if(_loc3_.parent != null)
         {
            WindowController(_loc3_.parent).removeChild(_loc3_);
         }
         _children.splice(param2,0,_loc3_);
         _loc3_.parent = this;
         if(var_1066 || _loc3_.hasGraphicsContext())
         {
            setupGraphicsContext();
            if(_loc3_.getGraphicContext(true).parent != var_17)
            {
               var_17.addChildContextAt(_loc3_.getGraphicContext(true),param2);
            }
         }
         update(this,new WindowNotifyEvent(WindowNotifyEvent.const_300,this,param1));
         return param1;
      }
      
      public function swapChildren(param1:IWindow, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(param1 != null && param2 != null && param1 != param2)
         {
            _loc3_ = _children.indexOf(param1);
            if(_loc3_ < 0)
            {
               return;
            }
            _loc4_ = _children.indexOf(param2);
            if(_loc4_ < 0)
            {
               return;
            }
            if(_loc4_ < _loc3_)
            {
               _loc5_ = param1;
               param1 = param2;
               param2 = _loc5_;
               _loc6_ = _loc3_;
               _loc3_ = _loc4_;
               _loc4_ = _loc6_;
            }
            _children.splice(_loc4_,1);
            _children.splice(_loc3_,1);
            _children.splice(_loc3_,0,param2);
            _children.splice(_loc4_,0,param1);
            if(WindowController(param1).hasGraphicsContext() || WindowController(param2).hasGraphicsContext())
            {
               var_17.swapChildContexts(WindowController(param1).getGraphicContext(true),WindowController(param2).getGraphicContext(true));
            }
         }
      }
      
      public function get parent() : IWindow
      {
         return var_9;
      }
      
      public function getRegionProperties(param1:Rectangle = null, param2:Rectangle = null, param3:Rectangle = null, param4:Rectangle = null) : void
      {
         if(param1 != null)
         {
            param1.x = var_8.x;
            param1.y = var_8.y;
            param1.width = var_8.width;
            param1.height = var_8.height;
         }
         if(param2 != null)
         {
            param2.x = var_58.x;
            param2.y = var_58.y;
            param2.width = var_58.width;
            param2.height = var_58.height;
         }
         if(param3 != null && var_146 != null)
         {
            param3.x = var_146.x;
            param3.y = var_146.y;
            param3.width = var_146.width;
            param3.height = var_146.height;
         }
         if(param4 != null && var_147 != null)
         {
            param4.x = var_147.x;
            param4.y = var_147.y;
            param4.width = var_147.width;
            param4.height = var_147.height;
         }
      }
      
      protected function requiresOwnGraphicContext() : Boolean
      {
         var _loc1_:* = null;
         if(testParamFlag(WindowParam.const_36))
         {
            for each(_loc1_ in _children)
            {
               if(_loc1_.requiresOwnGraphicContext())
               {
                  return true;
               }
            }
            return false;
         }
         return true;
      }
      
      public function hasGraphicsContext() : Boolean
      {
         return !testParamFlag(WindowParam.const_36) || var_17 != null;
      }
      
      public function validateLocalPointIntersection(param1:Point, param2:BitmapData) : Boolean
      {
         return testLocalPointHitAgainstAlpha(param1,param2,var_554);
      }
      
      public function set color(param1:uint) : void
      {
         var_1410 = param1 & 4278190080;
         var_555 = !!var_657 ? uint(param1) : uint(param1 & 16777215);
         var_16.invalidate(this,var_8,WindowRedrawFlag.const_78);
      }
      
      public function getMouseRegion(param1:Rectangle) : void
      {
         var _loc2_:* = null;
         getGlobalRectangle(param1);
         if(param1.width < 0)
         {
            param1.width = 0;
         }
         if(param1.height < 0)
         {
            param1.height = 0;
         }
         if(testParamFlag(WindowParam.const_36))
         {
            _loc2_ = new Rectangle();
            IWindow(var_9).getMouseRegion(_loc2_);
            if(param1.left < _loc2_.left)
            {
               param1.left = _loc2_.left;
            }
            if(param1.top < _loc2_.top)
            {
               param1.top = _loc2_.top;
            }
            if(param1.right > _loc2_.right)
            {
               param1.right = _loc2_.right;
            }
            if(param1.bottom > _loc2_.bottom)
            {
               param1.bottom = _loc2_.bottom;
            }
         }
      }
      
      public function update(param1:WindowController, param2:Event) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = undefined;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         if(!testParamFlag(WindowParam.const_684))
         {
            if(param2 is MouseEvent)
            {
               _loc3_ = forwardMouseEvent(param2 as MouseEvent);
            }
            else if(param2 is KeyboardEvent)
            {
               _loc3_ = forwardKeyboardEvent(param2 as KeyboardEvent);
            }
            else if(param2 is WindowNotifyEvent)
            {
               _loc3_ = forwardWindowNotifyEvent(param2 as WindowNotifyEvent);
            }
            else if(param2 is Event)
            {
               _loc3_ = forwardNormalEvent(param2);
            }
            if(_disposed)
            {
               return true;
            }
            if(_loc3_.cancelable)
            {
               if(_loc3_.isWindowOperationPrevented())
               {
                  return true;
               }
            }
            if(param2.cancelable)
            {
               if(!param2.isDefaultPrevented())
               {
                  return true;
               }
            }
         }
         if(param2 is MouseEvent)
         {
            switch(param2.type)
            {
               case MouseEvent.MOUSE_DOWN:
                  if(activate())
                  {
                     if(param2.cancelable)
                     {
                        param2.preventDefault();
                     }
                  }
                  setStateFlag(WindowState.const_100,true);
                  _loc4_ = var_16.getWindowServices().getMouseListenerService();
                  _loc4_.begin(this);
                  _loc4_.eventTypes.push(MouseEvent.MOUSE_UP);
                  _loc4_.areaLimit = MouseListenerType.const_820;
                  if(testParamFlag(WindowParam.const_307))
                  {
                     _loc5_ = {};
                     while(_loc5_ != null)
                     {
                        if(_loc5_.testParamFlag(WindowParam.const_210))
                        {
                           var_16.getWindowServices().getMouseDraggingService().begin(_loc5_);
                           break;
                        }
                        _loc5_ = _loc5_.parent;
                     }
                  }
                  if((_param & 0) > 0)
                  {
                     _loc5_ = {};
                     while(_loc5_ != null)
                     {
                        if(_loc5_.testParamFlag(WindowParam.const_250))
                        {
                           var_16.getWindowServices().getMouseScalingService().begin(_loc5_,_param & 0);
                           break;
                        }
                        _loc5_ = _loc5_.parent;
                     }
                  }
                  break;
               case MouseEvent.MOUSE_UP:
                  if(testStateFlag(WindowState.const_100))
                  {
                     setStateFlag(WindowState.const_100,false);
                  }
                  var_16.getWindowServices().getMouseListenerService().end(this);
                  if(testParamFlag(WindowParam.const_210))
                  {
                     var_16.getWindowServices().getMouseDraggingService().end(this);
                  }
                  if(testParamFlag(WindowParam.const_250))
                  {
                     var_16.getWindowServices().getMouseScalingService().end(this);
                  }
                  break;
               case MouseEvent.MOUSE_OUT:
                  if(testStateFlag(WindowState.const_85))
                  {
                     setStateFlag(WindowState.const_85,false);
                  }
                  break;
               case MouseEvent.MOUSE_OVER:
                  if(!testStateFlag(WindowState.const_85))
                  {
                     setStateFlag(WindowState.const_85,true);
                  }
                  break;
               case MouseEvent.MOUSE_WHEEL:
                  return false;
            }
         }
         if(param2 is WindowNotifyEvent)
         {
            switch(param2.type)
            {
               case WindowNotifyEvent.const_189:
                  var_16.invalidate(this,var_8.union(var_58),WindowRedrawFlag.RESIZE);
                  if(param1 == this)
                  {
                     notifyChildren(new WindowNotifyEvent(WindowNotifyEvent.const_484,this,null));
                     if(testParamFlag(WindowParam.const_166,WindowParam.const_149))
                     {
                        updateScaleRelativeToParent();
                     }
                     else if(testParamFlag(WindowParam.const_183,WindowParam.const_147))
                     {
                        updateScaleRelativeToParent();
                     }
                     if(var_9 != null)
                     {
                        _loc8_ = uint(_param);
                        _param &= ~(0 | 0);
                        if(testParamFlag(WindowParam.const_465))
                        {
                           var_9.width += 0 - 0;
                        }
                        if(testParamFlag(WindowParam.WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT))
                        {
                           var_9.height += 0 - 0;
                        }
                        _param = _loc8_;
                        var_9.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_271,var_9,this));
                     }
                  }
                  break;
               case WindowNotifyEvent.const_438:
                  var_16.invalidate(this,var_8.union(var_58),WindowRedrawFlag.const_399);
                  if(param1 == this)
                  {
                     notifyChildren(new WindowNotifyEvent(WindowNotifyEvent.const_827,this,null));
                     if(var_9 != null)
                     {
                        var_9.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_282,var_9,this));
                     }
                  }
                  break;
               case WindowNotifyEvent.const_308:
                  if(param1 == this)
                  {
                     notifyChildren(new WindowNotifyEvent(WindowNotifyEvent.const_754,this,null));
                     if(var_9 != null)
                     {
                        var_9.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_224,var_9,this));
                     }
                  }
                  break;
               case WindowNotifyEvent.const_386:
                  var_16.invalidate(this,var_8,WindowRedrawFlag.const_979);
                  break;
               case WindowNotifyEvent.const_388:
                  _loc6_ = new Array();
                  groupChildrenWithTag(WindowController.INTERNAL_CHILD_TAG,_loc6_);
                  _loc7_ = uint(_loc6_.length);
                  while(--_loc7_ > -1)
                  {
                     WindowController(_loc6_[_loc7_]).style = var_81;
                  }
                  var_16.invalidate(this,var_8,WindowRedrawFlag.const_78);
                  break;
               case WindowNotifyEvent.const_497:
                  if(!(_param & 0))
                  {
                     if(!var_17)
                     {
                        setupGraphicsContext();
                        var_16.invalidate(this,var_8,WindowRedrawFlag.const_399);
                     }
                  }
                  else if(_param & 0)
                  {
                     if(var_17)
                     {
                        var_16.invalidate(this,var_8,WindowRedrawFlag.const_399);
                     }
                  }
                  break;
               case WindowNotifyEvent.const_401:
                  if(testParamFlag(WindowParam.const_166,WindowParam.const_149))
                  {
                     updateScaleRelativeToParent();
                  }
                  else if(testParamFlag(WindowParam.const_183,WindowParam.const_147))
                  {
                     updateScaleRelativeToParent();
                  }
                  var_16.invalidate(this,var_8,WindowRedrawFlag.const_78);
                  break;
               case WindowNotifyEvent.const_224:
                  activate();
                  break;
               case WindowNotifyEvent.const_484:
                  var_9.getRegionProperties(null,var_312);
                  updateScaleRelativeToParent();
                  break;
               case WindowNotifyEvent.const_300:
                  if(testParamFlag(WindowParam.const_68))
                  {
                     expandToAccommodateChild(this,WindowNotifyEvent(param2).related);
                  }
                  break;
               case WindowNotifyEvent.const_282:
                  if(testParamFlag(WindowParam.const_68))
                  {
                     expandToAccommodateChild(this,WindowNotifyEvent(param2).related);
                  }
                  break;
               case WindowNotifyEvent.const_713:
                  break;
               case WindowNotifyEvent.const_271:
                  if(testParamFlag(WindowParam.const_68))
                  {
                     expandToAccommodateChild(this,WindowNotifyEvent(param2).related);
                  }
            }
         }
         return true;
      }
      
      public function get procedure() : Function
      {
         return var_660 != null ? var_660 : (var_9 != null ? var_9.procedure : nullEventProc);
      }
      
      public function getGlobalRectangle(param1:Rectangle) : void
      {
         var _loc2_:Rectangle = var_8;
         if(var_9 != null)
         {
            var_9.getGlobalRectangle(param1);
            param1.x += _loc2_.x;
            param1.y += _loc2_.y;
         }
         else
         {
            param1.x = _loc2_.x;
            param1.y = _loc2_.y;
         }
         param1.width = _loc2_.width;
         param1.height = _loc2_.height;
      }
      
      public function focus() : Boolean
      {
         if(getStateFlag(WindowState.const_79))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_966,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_79,true);
         _loc1_.type = WindowNotifyEvent.const_869;
         update(this,_loc1_);
         return true;
      }
      
      public function maximize() : Boolean
      {
         if(var_35 & 0)
         {
            return false;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_1009,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_70,true);
         _loc1_.type = WindowNotifyEvent.const_969;
         update(this,_loc1_);
         return true;
      }
      
      public function set rectangle(param1:Rectangle) : void
      {
         setRectangle(param1.x,param1.y,param1.width,param1.height);
      }
      
      public function validateGlobalPointIntersection(param1:Point, param2:BitmapData) : Boolean
      {
         var _loc3_:Point = new Point();
         getGlobalPosition(_loc3_);
         _loc3_.x = param1.x - _loc3_.x;
         _loc3_.y = param1.y - _loc3_.y;
         return testLocalPointHitAgainstAlpha(_loc3_,param2,var_554);
      }
      
      public function getGlobalPosition(param1:Point) : void
      {
         if(var_9 != null)
         {
            var_9.getGlobalPosition(param1);
            param1.x += var_8.x;
            param1.y += var_8.y;
         }
         else
         {
            param1.x = var_8.x;
            param1.y = var_8.y;
         }
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(param1 != var_374)
         {
            var_374 = param1;
            if(var_17)
            {
               var_17.visible = param1;
            }
            var_16.invalidate(this,var_8,WindowRedrawFlag.const_78);
         }
      }
      
      public function getStateFlag(param1:uint) : Boolean
      {
         return (var_35 & param1) != 0;
      }
      
      public function resolveVerticalScale() : Number
      {
         return 0 / 0;
      }
      
      public function getParamFlag(param1:uint) : Boolean
      {
         return (_param & param1) != 0;
      }
      
      public function set x(param1:int) : void
      {
         if(param1 != var_8.x)
         {
            setRectangle(param1,var_8.y,var_8.width,var_8.height);
         }
      }
      
      public function set y(param1:int) : void
      {
         if(param1 != var_8.y)
         {
            setRectangle(var_8.x,param1,var_8.width,var_8.height);
         }
      }
      
      public function activate() : Boolean
      {
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_917,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_94,true);
         _loc1_.type = WindowNotifyEvent.const_308;
         update(this,_loc1_);
         return true;
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return !!_disposed ? false : Boolean(_events.hasEventListener(param1));
      }
      
      public function setGlobalPosition(param1:Point) : void
      {
         var _loc2_:Point = new Point();
         if(var_9 != null)
         {
            var_9.getGlobalPosition(_loc2_);
            _loc2_.x += var_8.x;
            _loc2_.y += var_8.y;
         }
         else
         {
            _loc2_.x = var_8.x;
            _loc2_.y = var_8.y;
         }
         x += param1.x - _loc2_.x;
         y += param1.y - _loc2_.y;
      }
      
      public function isCapableOfUsingSharedGraphicContext() : Boolean
      {
         return true;
      }
      
      public function removeChild(param1:IWindow) : IWindow
      {
         var _loc2_:int = _children.indexOf(param1);
         if(_loc2_ < 0)
         {
            return null;
         }
         _children.splice(_loc2_,1);
         var _loc3_:WindowController = WindowController(param1);
         _loc3_.parent = null;
         if(_loc3_.hasGraphicsContext())
         {
            var_17.removeChildContext(_loc3_.getGraphicContext(true));
         }
         update(this,new WindowNotifyEvent(WindowNotifyEvent.const_713,this,param1));
         return param1;
      }
      
      public function disable() : Boolean
      {
         if(getStateFlag(WindowState.const_71))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_1027,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_71,true);
         _loc1_.type = WindowNotifyEvent.const_660;
         update(this,_loc1_);
         return true;
      }
      
      public function getAbsoluteMousePosition(param1:Point) : void
      {
         param1.x = var_16.getDesktopWindow().mouseX;
         param1.y = var_16.getDesktopWindow().mouseY;
      }
      
      public function addChild(param1:IWindow) : IWindow
      {
         var _loc2_:WindowController = WindowController(param1);
         if(_loc2_.parent != null)
         {
            WindowController(_loc2_.parent).removeChild(_loc2_);
         }
         _children.push(_loc2_);
         _loc2_.parent = this;
         if(var_1066 || _loc2_.hasGraphicsContext())
         {
            setupGraphicsContext();
            if(_loc2_.getGraphicContext(true).parent != var_17)
            {
               var_17.addChildContext(_loc2_.getGraphicContext(true));
            }
         }
         update(this,new WindowNotifyEvent(WindowNotifyEvent.const_300,this,param1));
         return param1;
      }
      
      public function fetchDrawBuffer() : IBitmapDrawable
      {
         return !testParamFlag(WindowParam.const_36) ? getGraphicContext(true).fetchDrawBuffer() : (var_9 != null ? var_9.fetchDrawBuffer() : null);
      }
      
      public function getChildIndex(param1:IWindow) : int
      {
         return _children.indexOf(param1);
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function setChildIndex(param1:IWindow, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc3_:int = _children.indexOf(param1);
         if(_loc3_ > -1 && param2 != _loc3_)
         {
            _children.splice(_loc3_,1);
            _children.splice(param2,0,param1);
            _loc4_ = WindowController(param1);
            if(_loc4_.hasGraphicsContext())
            {
               var_17.setChildContextIndex(_loc4_.getGraphicContext(true),getChildIndex(_loc4_));
            }
         }
      }
      
      public function set state(param1:uint) : void
      {
         if(param1 != var_35)
         {
            var_35 = param1;
            update(this,new WindowNotifyEvent(WindowNotifyEvent.const_386,this,null));
         }
      }
      
      public function findParentByName(param1:String) : IWindow
      {
         if(_name == param1)
         {
            return this;
         }
         if(var_9 != null)
         {
            if(var_9.name == param1)
            {
               return var_9;
            }
            return var_9.findParentByName(param1);
         }
         return null;
      }
      
      public function setRectangle(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc7_:* = 0;
         var _loc9_:* = null;
         var _loc10_:* = null;
         param4 = Math.max(var_76.minHeight,param4);
         param4 = Math.min(var_76.maxHeight,param4);
         param3 = Math.max(var_76.minWidth,param3);
         param3 = Math.min(var_76.maxWidth,param3);
         var _loc5_:Boolean = param1 != var_8.x || param2 != var_8.y;
         var _loc6_:Boolean = param3 != var_8.width || param4 != var_8.height;
         if(_loc6_ && !_loc5_)
         {
            _loc7_ = uint(_param & 0);
            if(_loc7_ == WindowParam.const_398)
            {
               param1 -= (param3 - 0) / 2;
               _loc5_ = true;
            }
            else if(_loc7_ == WindowParam.const_504)
            {
               param1 -= param3 - 0;
               _loc5_ = true;
            }
            _loc7_ = uint(_param & 0);
            if(_loc7_ == WindowParam.const_381)
            {
               param2 -= (param4 - 0) / 2;
               _loc5_ = true;
            }
            else if(_loc7_ == WindowParam.const_472)
            {
               param2 -= param4 - 0;
               _loc5_ = true;
            }
         }
         if(testParamFlag(WindowParam.const_88))
         {
            if(var_9 != null)
            {
               _loc9_ = var_9.rectangle;
               param1 = param1 < 0 ? 0 : int(param1);
               param2 = param2 < 0 ? 0 : int(param2);
               if(_loc5_)
               {
                  param1 -= param1 + param3 > _loc9_.width ? param1 + param3 - _loc9_.width : 0;
                  param2 -= param2 + param4 > _loc9_.height ? param2 + param4 - _loc9_.height : 0;
                  _loc5_ = param1 != var_8.x || param2 != var_8.y;
               }
               else
               {
                  param3 -= param1 + param3 > _loc9_.width ? param1 + param3 - _loc9_.width : 0;
                  param4 -= param2 + param4 > _loc9_.height ? param2 + param4 - _loc9_.height : 0;
                  _loc6_ = param3 != var_8.width || param4 != var_8.height;
               }
            }
         }
         if(_loc5_ || _loc6_)
         {
            if(_loc5_)
            {
               _loc10_ = new WindowNotifyEvent(WindowNotifyEvent.const_1005,this,null,true);
               update(this,_loc10_);
               if(_loc10_.isWindowOperationPrevented())
               {
                  _loc5_ = false;
               }
            }
            if(_loc6_)
            {
               _loc10_ = new WindowNotifyEvent(WindowNotifyEvent.const_608,this,null,true);
               update(this,_loc10_);
               if(_loc10_.isWindowOperationPrevented())
               {
                  _loc6_ = false;
               }
            }
            if(_loc5_)
            {
               var_58.x = var_8.x;
               var_58.y = var_8.y;
               var_58.width = var_8.width;
               var_58.height = var_8.height;
               var_8.x = param1;
               var_8.y = param2;
            }
            if(_loc6_)
            {
               var_58.width = var_8.width;
               var_58.height = var_8.height;
               var_8.width = param3;
               var_8.height = param4;
            }
            if(_loc5_)
            {
               update(this,new WindowNotifyEvent(WindowNotifyEvent.const_438,this,null));
            }
            if(_loc6_)
            {
               update(this,new WindowNotifyEvent(WindowNotifyEvent.const_189,this,null));
            }
         }
      }
      
      public function lock() : Boolean
      {
         if(getStateFlag(WindowState.const_70))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_1217,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_70,true);
         _loc1_.type = WindowNotifyEvent.const_1432;
         update(this,_loc1_);
         return true;
      }
      
      protected function testLocalPointHitAgainstAlpha(param1:Point, param2:BitmapData, param3:uint) : Boolean
      {
         var _loc5_:* = null;
         var _loc4_:Boolean = false;
         if(true || true)
         {
            return false;
         }
         if(var_164 && var_554 > 0)
         {
            if(!testParamFlag(WindowParam.const_36))
            {
               if(param1.x <= var_8.width && param1.y <= var_8.height)
               {
                  _loc5_ = getGraphicContext(true).fetchDrawBuffer() as BitmapData;
                  if(_loc5_ != null)
                  {
                     _loc4_ = _loc5_.hitTest(var_1521,param3,param1);
                  }
               }
            }
            else
            {
               _loc4_ = param2 != null ? Boolean(param2.hitTest(var_1521,param3,param1)) : false;
            }
         }
         else if(param1.x >= 0 && param1.x < var_8.width)
         {
            if(param1.y >= 0 && param1.y < var_8.height)
            {
               _loc4_ = true;
            }
         }
         return _loc4_;
      }
      
      public function get properties() : Array
      {
         return new Array();
      }
      
      override public function invalidate(param1:Rectangle = null) : void
      {
         if(param1 == null)
         {
            param1 = var_8;
         }
         var_16.invalidate(this,param1,WindowRedrawFlag.const_78);
      }
      
      public function convertPointFromLocalToGlobalSpace(param1:Point) : void
      {
         var _loc2_:Number = param1.x;
         var _loc3_:Number = param1.y;
         if(var_9 == null)
         {
            param1.x = var_8.x;
            param1.y = var_8.y;
         }
         else
         {
            var_9.getGlobalPosition(param1);
            param1.x += var_8.x;
            param1.y += var_8.y;
         }
         param1.x += _loc2_;
         param1.y += _loc3_;
      }
      
      private function nullEventProc(param1:WindowEvent, param2:IWindow) : void
      {
      }
      
      public function getDrawRegion(param1:Rectangle) : void
      {
         if(!testParamFlag(WindowParam.const_36))
         {
            param1.x = 0;
            param1.y = 0;
            param1.width = var_8.width;
            param1.height = var_8.height;
         }
         else if(var_9 != null)
         {
            var_9.getDrawRegion(param1);
            param1.x += var_8.x;
            param1.y += var_8.y;
            param1.width = var_8.width;
            param1.height = var_8.height;
         }
         else
         {
            param1.x = 0;
            param1.y = 0;
            param1.width = 0;
            param1.height = 0;
         }
      }
      
      public function scale(param1:Number, param2:Number) : void
      {
         setRectangle(var_8.x,var_8.y,var_8.width + param1,var_8.height + param2);
      }
      
      public function getLocalRectangle(param1:Rectangle) : void
      {
         param1.x = var_8.x;
         param1.y = var_8.y;
         param1.width = var_8.width;
         param1.height = var_8.height;
      }
      
      public function unlock() : Boolean
      {
         if(!getStateFlag(WindowState.const_70))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_1309,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_70,false);
         _loc1_.type = WindowNotifyEvent.const_1399;
         update(this,_loc1_);
         return true;
      }
      
      public function set parent(param1:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1 == this)
         {
            throw new Error("Attempted to assign self as parent!");
         }
         if(param1 != null && param1.context != var_16)
         {
            var_16 = WindowContext(param1.context);
            for each(_loc3_ in _children)
            {
               _loc3_.parent = this;
            }
         }
         var _loc2_:IWindow = var_9;
         if(var_9 != param1)
         {
            if(var_9 != null)
            {
               var_9.removeChild(this);
            }
            var_9 = WindowController(param1);
            if(var_9 != null)
            {
               var_312 = var_9.rectangle.clone();
               var_58.x = var_8.x;
               var_58.y = var_8.y;
               var_58.width = var_8.width;
               var_58.height = var_8.height;
               update(this,new WindowNotifyEvent(WindowNotifyEvent.const_401,this,var_9));
            }
            else
            {
               var_312.x = 0;
               var_312.y = 0;
               var_312.width = 0;
               var_312.height = 0;
               update(this,new WindowNotifyEvent(WindowNotifyEvent.const_960,this,_loc2_));
            }
         }
      }
      
      public function setParamFlag(param1:uint, param2:Boolean = true) : void
      {
         var _loc3_:uint = _param;
         var _loc4_:*;
         _param = !!param2 ? (_loc4_ = _param | param1, _param |= param1, uint(_loc4_)) : (_loc4_ = _param & ~param1, _param &= ~param1, uint(_loc4_));
         if(_param != _loc3_)
         {
            update(this,new WindowNotifyEvent(WindowNotifyEvent.const_497,this,null));
         }
      }
      
      public function expandToAccommodateChildren() : void
      {
         var _loc1_:* = null;
         var _loc6_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = getParamFlag(WindowParam.const_68);
         for each(_loc1_ in _children)
         {
            _loc6_ = _loc1_.rectangle;
            if(_loc6_.x < _loc2_)
            {
               _loc4_ -= _loc6_.x - _loc2_;
               _loc2_ = _loc6_.x;
               _loc7_ = true;
            }
            if(_loc6_.right > _loc4_)
            {
               _loc4_ = _loc6_.x + _loc6_.width;
               _loc7_ = true;
            }
            if(_loc6_.y < _loc3_)
            {
               _loc5_ -= _loc6_.y - _loc3_;
               _loc3_ = _loc6_.y;
               _loc7_ = true;
            }
            if(_loc6_.bottom > _loc5_)
            {
               _loc5_ = _loc6_.y + _loc6_.height;
               _loc7_ = true;
            }
         }
         if(_loc7_)
         {
            if(_loc8_)
            {
               setParamFlag(WindowParam.const_68,false);
            }
            setRectangle(var_8.x + _loc2_,var_8.y + _loc3_,_loc4_,_loc5_);
            for each(_loc1_ in _children)
            {
               _loc1_.offset(-_loc2_,-_loc3_);
            }
            if(_loc8_)
            {
               setParamFlag(WindowParam.const_68,true);
            }
         }
      }
      
      public function removeChildAt(param1:int) : IWindow
      {
         return removeChild(getChildAt(param1));
      }
      
      public function clone() : IWindow
      {
         var _loc1_:Class = getDefinitionByName(getQualifiedClassName(this)) as Class;
         var _loc2_:WindowController = new _loc1_(_name,_type,var_81,_param,var_16,var_8,null,var_660,properties,var_656.concat(),_id) as WindowController;
         _loc2_.var_554 = var_554;
         _loc2_.var_164 = var_164;
         _loc2_.var_1420 = var_1420;
         _loc2_.var_312 = var_312.clone();
         _loc2_.var_8 = var_8.clone();
         _loc2_.var_380 = var_380.clone();
         _loc2_.var_58 = var_58.clone();
         _loc2_.var_146 = !!var_146 ? var_146.clone() : null;
         _loc2_.var_147 = !!var_147 ? var_147.clone() : null;
         _loc2_.var_76 = !!var_76 ? var_76.clone(_loc2_) : null;
         _loc2_.var_16 = var_16;
         _loc2_.var_555 = var_555;
         _loc2_.var_1410 = var_1410;
         _loc2_.var_1133 = var_1133;
         _loc2_.var_374 = var_374;
         _loc2_.var_389 = var_389;
         _loc2_._param = _param;
         _loc2_.var_35 = var_35;
         _loc2_._name = _name;
         _loc2_._id = _id;
         _loc2_.caption = var_328;
         _loc2_.background = var_657;
         cloneChildWindows(_loc2_);
         return _loc2_;
      }
      
      public function set style(param1:uint) : void
      {
         if(param1 != var_81)
         {
            var_81 = param1;
            update(this,new WindowNotifyEvent(WindowNotifyEvent.const_388,this,null));
         }
      }
      
      public function setStateFlag(param1:uint, param2:Boolean = true) : void
      {
         var _loc3_:uint = var_35;
         var _loc4_:*;
         var_35 = !!param2 ? (_loc4_ = var_35 | param1, var_35 |= param1, uint(_loc4_)) : (_loc4_ = var_35 & ~param1, var_35 &= ~param1, uint(_loc4_));
         if(var_35 != _loc3_)
         {
            update(this,new WindowNotifyEvent(WindowNotifyEvent.const_386,this,null));
         }
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         if(!_disposed)
         {
            _events.removeEventListener(param1,param2,param3);
         }
      }
      
      public function groupChildrenWithTag(param1:String, param2:Array, param3:Boolean = false) : uint
      {
         var _loc4_:* = null;
         var _loc5_:* = 0;
         for each(_loc4_ in _children)
         {
            if(_loc4_.tags.indexOf(param1) > -1)
            {
               param2.push(_loc4_);
               _loc5_++;
            }
            if(param3)
            {
               _loc5_ += _loc4_.groupChildrenWithTag(param1,param2,param3);
            }
         }
         return _loc5_;
      }
      
      public function enable() : Boolean
      {
         if(!getStateFlag(WindowState.const_71))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_843,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_71,false);
         _loc1_.type = WindowNotifyEvent.const_716;
         update(this,_loc1_);
         return true;
      }
      
      public function set clipping(param1:Boolean) : void
      {
         var_1133 = param1;
         update(this,new WindowNotifyEvent(WindowNotifyEvent.const_497,this,null));
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return !!_disposed ? false : Boolean(_events.willTrigger(param1));
      }
      
      public function hitTestGlobalRectangle(param1:Rectangle) : Boolean
      {
         var _loc2_:Rectangle = new Rectangle();
         getGlobalRectangle(_loc2_);
         return _loc2_.intersects(param1);
      }
      
      public function hitTestLocalPoint(param1:Point) : Boolean
      {
         return var_8.containsPoint(param1);
      }
      
      public function set width(param1:int) : void
      {
         if(param1 != var_8.width)
         {
            setRectangle(var_8.x,var_8.y,param1,var_8.height);
         }
      }
      
      protected function forwardMouseEvent(param1:MouseEvent) : WindowEvent
      {
         var _loc6_:Boolean = false;
         var _loc2_:String = "null";
         var _loc5_:Point = new Point(param1.stageX,param1.stageY);
         convertPointFromGlobalToLocalSpace(_loc5_);
         _loc6_ = _loc5_.x > -1 && _loc5_.y > -1 && _loc5_.x < var_8.width && _loc5_.y < var_8.height;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               _loc2_ = "null";
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "null";
               break;
            case MouseEvent.MOUSE_OUT:
               _loc2_ = "null";
               break;
            case MouseEvent.ROLL_OUT:
               _loc2_ = "null";
               break;
            case MouseEvent.ROLL_OVER:
               _loc2_ = "null";
               break;
            case MouseEvent.CLICK:
               _loc2_ = "null";
               break;
            case MouseEvent.DOUBLE_CLICK:
               _loc2_ = "null";
               break;
            case MouseEvent.MOUSE_DOWN:
               _loc2_ = "null";
               break;
            case MouseEvent.MOUSE_UP:
               _loc2_ = !!_loc6_ ? "null" : WindowMouseEvent.const_419;
               break;
            case MouseEvent.MOUSE_WHEEL:
               _loc2_ = "null";
         }
         var _loc7_:WindowEvent = new WindowMouseEvent(_loc2_,this,null,_loc5_.x,_loc5_.y,param1.stageX,param1.stageY,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown,param1.delta,false,true);
         procedure(_loc7_,this);
         if(!_loc7_.isWindowOperationPrevented())
         {
            dispatchEvent(_loc7_);
         }
         return _loc7_;
      }
      
      public function releaseGraphicsContext() : void
      {
         var_1066 = false;
         if(!var_17)
         {
         }
      }
      
      public function getChildUnderPoint(param1:Point) : IWindow
      {
         var _loc2_:* = null;
         var _loc3_:Boolean = false;
         var _loc4_:* = null;
         var _loc5_:* = 0;
         if(var_374)
         {
            _loc2_ = new Rectangle();
            getMouseRegion(_loc2_);
            _loc3_ = _loc2_.containsPoint(param1);
            _loc5_ = uint(numChildren);
            if(_loc3_)
            {
               while(_loc5_ > 0)
               {
                  _loc4_ = WindowController(_children[_loc5_ - 1]).getChildUnderPoint(param1);
                  if(_loc4_ != null)
                  {
                     return _loc4_;
                  }
                  _loc5_--;
               }
            }
            if(validateGlobalPointIntersection(param1,null))
            {
               return this;
            }
         }
         return null;
      }
      
      public function groupChildrenWithID(param1:uint, param2:Array, param3:Boolean = false) : uint
      {
         var _loc4_:* = null;
         var _loc5_:* = 0;
         for each(_loc4_ in _children)
         {
            if(_loc4_.id == param1)
            {
               param2.push(_loc4_);
               _loc5_++;
            }
            if(param3)
            {
               _loc5_ += _loc4_.groupChildrenWithID(param1,param2,param3);
            }
         }
         return _loc5_;
      }
      
      public function get numChildren() : int
      {
         return _children.length;
      }
      
      public function set procedure(param1:Function) : void
      {
         var_660 = param1;
      }
      
      public function get host() : IWindow
      {
         return var_9 == desktop ? {} : var_9.host;
      }
      
      public function buildFromXML(param1:XML, param2:Map = null) : Boolean
      {
         return var_16.getWindowParser().parseAndConstruct(param1,this,param2) != null;
      }
      
      public function convertPointFromGlobalToLocalSpace(param1:Point) : void
      {
         var _loc2_:Number = param1.x;
         var _loc3_:Number = param1.y;
         if(var_9 == null)
         {
            param1.x = var_8.x;
            param1.y = var_8.y;
         }
         else
         {
            var_9.getGlobalPosition(param1);
            param1.x += var_8.x;
            param1.y += var_8.y;
         }
         param1.x = _loc2_ - param1.x;
         param1.y = _loc3_ - param1.y;
      }
      
      protected function cloneChildWindows(param1:WindowController) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in _children)
         {
            if(_loc2_.tags.indexOf(WindowController.EXCLUDE_CHILD_TAG) == -1)
            {
               param1.addChild(_loc2_.clone());
            }
         }
      }
      
      public function hitTestGlobalPoint(param1:Point) : Boolean
      {
         var _loc2_:Rectangle = new Rectangle();
         getGlobalRectangle(_loc2_);
         return _loc2_.containsPoint(param1);
      }
      
      public function getRelativeMousePosition(param1:Point) : void
      {
         getGlobalPosition(param1);
         param1.x = var_16.getDesktopWindow().mouseX - param1.x;
         param1.y = var_16.getDesktopWindow().mouseY - param1.y;
      }
      
      public function setRegionProperties(param1:Rectangle = null, param2:Rectangle = null, param3:Rectangle = null) : void
      {
         if(param3 != null)
         {
            if(param3.width < 0 || param3.height < 0)
            {
               throw new Error("Invalid rectangle; maximized size can\'t be less than zero!");
            }
            if(var_147 == null)
            {
               var_147 = new Rectangle();
            }
            var_147.x = param3.x;
            var_147.y = param3.y;
            var_147.width = param3.width;
            var_147.height = param3.height;
         }
         if(param2 != null)
         {
            if(param2.width < 0 || param2.height < 0)
            {
               throw new Error("Invalid rectangle; minimized size can\'t be less than zero!");
            }
            if(var_146 == null)
            {
               var_146 = new Rectangle();
            }
            var_146.x = param2.x;
            var_146.y = param2.y;
            var_146.width = param2.width;
            var_146.height = param2.height;
         }
         if(param3.width < param2.width || param3.height < param2.height)
         {
            param3.width = param2.width;
            param3.height = param2.height;
            throw new Error("Maximized rectangle can\'t be smaller than minimized rectangle!");
         }
         if(param1 != null)
         {
            setRectangle(param1.x,param1.y,param1.width,param1.height);
         }
      }
      
      public function groupChildrenUnderPoint(param1:Point, param2:Array) : void
      {
         var _loc3_:* = null;
         if(var_374)
         {
            if(var_8.containsPoint(param1))
            {
               param2.push(this);
               param1.offset(0,0);
               for each(_loc3_ in _children)
               {
                  _loc3_.groupChildrenUnderPoint(param1,param2);
               }
               param1.offset(var_8.x,var_8.y);
            }
            else if(!var_1133)
            {
               param1.offset(0,0);
               for each(_loc3_ in _children)
               {
                  _loc3_.groupChildrenUnderPoint(param1,param2);
               }
               param1.offset(var_8.x,var_8.y);
            }
         }
      }
      
      public function set caption(param1:String) : void
      {
         param1 = !!param1 ? param1 : "";
         if(param1 != caption)
         {
            var_328 = param1;
            var_16.invalidate(this,var_8,WindowRedrawFlag.const_78);
         }
      }
      
      public function unfocus() : Boolean
      {
         if(!getStateFlag(WindowState.const_79))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_863,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_79,false);
         _loc1_.type = WindowNotifyEvent.const_847;
         update(this,_loc1_);
         return true;
      }
      
      public function resolve() : uint
      {
         return 0;
      }
      
      protected function forwardNormalEvent(param1:Event) : WindowEvent
      {
         var _loc2_:String = "null";
         switch(param1.type)
         {
            case Event.CHANGE:
               _loc2_ = "null";
         }
         var _loc4_:WindowEvent = new WindowEvent(_loc2_,this,null,false,true);
         procedure(_loc4_,this);
         if(!_loc4_.isWindowOperationPrevented())
         {
            dispatchEvent(_loc4_);
         }
         return _loc4_;
      }
      
      public function close() : Boolean
      {
         if(!getStateFlag(WindowState.const_89))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_876,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         visible = false;
         _loc1_.type = WindowNotifyEvent.const_1011;
         update(this,_loc1_);
         return true;
      }
      
      public function destroy() : Boolean
      {
         if(var_35 == WindowState.const_483)
         {
            return true;
         }
         var_35 = WindowState.const_483;
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_858,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         _loc1_.type = WindowNotifyEvent.const_968;
         update(this,_loc1_);
         dispose();
         return true;
      }
      
      public function get filters() : Array
      {
         return !!hasGraphicsContext() ? getGraphicContext(true).filters : [];
      }
      
      public function childRectToClippedDrawRegion(param1:Rectangle, param2:Rectangle) : Boolean
      {
         var _loc4_:* = null;
         var _loc3_:Boolean = false;
         if(testParamFlag(WindowParam.const_36))
         {
            param1.offset(var_8.x,var_8.y);
            if(clipping)
            {
               _loc4_ = param1.intersection(var_8);
               if(param1.x < var_8.x)
               {
                  param2.x -= param1.x - 0;
                  param1.x = var_8.x;
                  _loc3_ = true;
               }
               if(param1.y < var_8.y)
               {
                  param2.y -= param1.y - 0;
                  param1.y = var_8.y;
                  _loc3_ = true;
               }
               if(param1.width != _loc4_.width)
               {
                  param1.width = _loc4_.width;
                  _loc3_ = true;
               }
               if(param1.height != _loc4_.height)
               {
                  param1.height = _loc4_.height;
                  _loc3_ = true;
               }
               param2.width = _loc4_.width;
               param2.height = _loc4_.height;
            }
            if(var_9 != null)
            {
               _loc3_ = WindowController(var_9).childRectToClippedDrawRegion(param1,param2) || _loc3_;
            }
         }
         else if(clipping)
         {
            if(param1.x < 0)
            {
               param2.x -= param1.x;
               param1.x = 0;
               _loc3_ = true;
            }
            if(param1.y < 0)
            {
               param2.y -= param1.y;
               param1.y = 0;
               _loc3_ = true;
            }
            if(var_8.width < param1.right)
            {
               param2.right -= param1.right - 0;
               param1.right = param1.width;
               _loc3_ = true;
            }
            if(var_8.height < param1.bottom)
            {
               param2.bottom -= param1.bottom - 0;
               param1.bottom = var_8.height;
               _loc3_ = true;
            }
         }
         return !!_loc3_ ? param2.width > 0 && param2.height > 0 : true;
      }
      
      public function set filters(param1:Array) : void
      {
         if(hasGraphicsContext())
         {
            getGraphicContext(true).filters = param1;
         }
      }
      
      public function getLocalPosition(param1:Point) : void
      {
         param1.x = var_8.x;
         param1.y = var_8.y;
      }
   }
}
