package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.enum.MouseCursorType;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.utils.Dictionary;
   
   public class MouseCursorControl extends Sprite implements IMouseCursor, IDisposable
   {
       
      
      private var _disposed:Boolean = false;
      
      private var _type:uint;
      
      private var var_1611:Dictionary;
      
      private var var_374:Boolean;
      
      private var var_1610:DisplayObject;
      
      private var var_205:Stage;
      
      public function MouseCursorControl(param1:DisplayObject)
      {
         super();
         _type = MouseCursorType.const_43;
         var_205 = param1.stage;
         var_374 = true;
         var_1611 = new Dictionary();
         var_205.addChild(this);
         var_205.addEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
         var_205.addEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
         var_205.addEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
         var_205.addEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
      }
      
      override public function get visible() : Boolean
      {
         return var_374;
      }
      
      private function onStageMouseLeave(param1:Event) : void
      {
         if(_type != MouseCursorType.const_43)
         {
            Mouse.hide();
            var_374 = false;
         }
      }
      
      public function defineCustomCursorType(param1:uint, param2:DisplayObject) : void
      {
         var_1611[param1] = param2;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            var_205.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
            var_205.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
            var_205.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
            var_205.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      override public function set visible(param1:Boolean) : void
      {
         var_374 = param1;
         if(var_374)
         {
            Mouse.show();
         }
         else
         {
            Mouse.hide();
         }
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         x = param1.stageX - 2;
         y = param1.stageY;
         if(_type == MouseCursorType.const_43)
         {
            var_374 = false;
            Mouse.show();
         }
         else
         {
            var_374 = true;
            Mouse.hide();
         }
      }
      
      public function get type() : uint
      {
         return _type;
      }
      
      public function set type(param1:uint) : void
      {
         _type = param1;
         var_1610 = var_1611[_type];
         if(numChildren > 0)
         {
            removeChildAt(0);
         }
         if(var_1610)
         {
            addChild(var_1610);
            Mouse.hide();
         }
         else
         {
            Mouse.show();
         }
      }
   }
}
