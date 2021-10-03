package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_266:String = "WE_CHILD_RESIZED";
      
      public static const const_1377:String = "WE_CLOSE";
      
      public static const const_1214:String = "WE_DESTROY";
      
      public static const const_119:String = "WE_CHANGE";
      
      public static const const_1348:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1550:String = "WE_PARENT_RESIZE";
      
      public static const const_96:String = "WE_UPDATE";
      
      public static const const_1411:String = "WE_MAXIMIZE";
      
      public static const const_474:String = "WE_DESTROYED";
      
      public static const const_957:String = "WE_UNSELECT";
      
      public static const const_1407:String = "WE_MAXIMIZED";
      
      public static const const_1636:String = "WE_UNLOCKED";
      
      public static const const_440:String = "WE_CHILD_REMOVED";
      
      public static const const_190:String = "WE_OK";
      
      public static const const_47:String = "WE_RESIZED";
      
      public static const const_1384:String = "WE_ACTIVATE";
      
      public static const const_253:String = "WE_ENABLED";
      
      public static const const_437:String = "WE_CHILD_RELOCATED";
      
      public static const const_1266:String = "WE_CREATE";
      
      public static const const_586:String = "WE_SELECT";
      
      public static const const_174:String = "";
      
      public static const const_1688:String = "WE_LOCKED";
      
      public static const const_1541:String = "WE_PARENT_RELOCATE";
      
      public static const const_1492:String = "WE_CHILD_REMOVE";
      
      public static const const_1584:String = "WE_CHILD_RELOCATE";
      
      public static const const_1500:String = "WE_LOCK";
      
      public static const const_231:String = "WE_FOCUSED";
      
      public static const const_596:String = "WE_UNSELECTED";
      
      public static const const_850:String = "WE_DEACTIVATED";
      
      public static const const_1228:String = "WE_MINIMIZED";
      
      public static const const_1536:String = "WE_ARRANGED";
      
      public static const const_1534:String = "WE_UNLOCK";
      
      public static const const_1512:String = "WE_ATTACH";
      
      public static const const_1296:String = "WE_OPEN";
      
      public static const const_1204:String = "WE_RESTORE";
      
      public static const const_1625:String = "WE_PARENT_RELOCATED";
      
      public static const const_1264:String = "WE_RELOCATE";
      
      public static const const_1644:String = "WE_CHILD_RESIZE";
      
      public static const const_1598:String = "WE_ARRANGE";
      
      public static const const_1223:String = "WE_OPENED";
      
      public static const const_1404:String = "WE_CLOSED";
      
      public static const const_1711:String = "WE_DETACHED";
      
      public static const const_1491:String = "WE_UPDATED";
      
      public static const const_1352:String = "WE_UNFOCUSED";
      
      public static const const_473:String = "WE_RELOCATED";
      
      public static const const_1281:String = "WE_DEACTIVATE";
      
      public static const const_235:String = "WE_DISABLED";
      
      public static const const_631:String = "WE_CANCEL";
      
      public static const const_563:String = "WE_ENABLE";
      
      public static const const_1321:String = "WE_ACTIVATED";
      
      public static const const_1247:String = "WE_FOCUS";
      
      public static const const_1623:String = "WE_DETACH";
      
      public static const const_1341:String = "WE_RESTORED";
      
      public static const const_1310:String = "WE_UNFOCUS";
      
      public static const const_64:String = "WE_SELECTED";
      
      public static const const_1201:String = "WE_PARENT_RESIZED";
      
      public static const const_1189:String = "WE_CREATED";
      
      public static const const_1595:String = "WE_ATTACHED";
      
      public static const const_1301:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1638:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1418:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1638 = param3;
         var_1418 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1418;
      }
      
      public function get related() : IWindow
      {
         return var_1638;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1418 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
