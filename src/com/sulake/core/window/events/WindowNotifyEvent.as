package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1414:String = "WN_CREATED";
      
      public static const const_1027:String = "WN_DISABLE";
      
      public static const const_887:String = "WN_DEACTIVATED";
      
      public static const const_1007:String = "WN_OPENED";
      
      public static const const_1011:String = "WN_CLOSED";
      
      public static const const_858:String = "WN_DESTROY";
      
      public static const const_1482:String = "WN_ARRANGED";
      
      public static const const_484:String = "WN_PARENT_RESIZED";
      
      public static const const_843:String = "WN_ENABLE";
      
      public static const const_1005:String = "WN_RELOCATE";
      
      public static const const_966:String = "WN_FOCUS";
      
      public static const const_827:String = "WN_PARENT_RELOCATED";
      
      public static const const_497:String = "WN_PARAM_UPDATED";
      
      public static const const_754:String = "WN_PARENT_ACTIVATED";
      
      public static const const_189:String = "WN_RESIZED";
      
      public static const const_876:String = "WN_CLOSE";
      
      public static const const_960:String = "WN_PARENT_REMOVED";
      
      public static const const_282:String = "WN_CHILD_RELOCATED";
      
      public static const const_716:String = "WN_ENABLED";
      
      public static const const_271:String = "WN_CHILD_RESIZED";
      
      public static const const_935:String = "WN_MINIMIZED";
      
      public static const const_660:String = "WN_DISABLED";
      
      public static const const_224:String = "WN_CHILD_ACTIVATED";
      
      public static const const_386:String = "WN_STATE_UPDATED";
      
      public static const const_745:String = "WN_UNSELECTED";
      
      public static const const_388:String = "WN_STYLE_UPDATED";
      
      public static const const_1608:String = "WN_UPDATE";
      
      public static const const_401:String = "WN_PARENT_ADDED";
      
      public static const const_608:String = "WN_RESIZE";
      
      public static const const_713:String = "WN_CHILD_REMOVED";
      
      public static const const_1697:String = "";
      
      public static const const_880:String = "WN_RESTORED";
      
      public static const const_338:String = "WN_SELECTED";
      
      public static const const_1030:String = "WN_MINIMIZE";
      
      public static const const_869:String = "WN_FOCUSED";
      
      public static const const_1217:String = "WN_LOCK";
      
      public static const const_300:String = "WN_CHILD_ADDED";
      
      public static const const_847:String = "WN_UNFOCUSED";
      
      public static const const_438:String = "WN_RELOCATED";
      
      public static const const_952:String = "WN_DEACTIVATE";
      
      public static const const_1346:String = "WN_CRETAE";
      
      public static const const_912:String = "WN_RESTORE";
      
      public static const const_308:String = "WN_ACTVATED";
      
      public static const const_1432:String = "WN_LOCKED";
      
      public static const const_481:String = "WN_SELECT";
      
      public static const const_1009:String = "WN_MAXIMIZE";
      
      public static const const_899:String = "WN_OPEN";
      
      public static const const_704:String = "WN_UNSELECT";
      
      public static const const_1495:String = "WN_ARRANGE";
      
      public static const const_1399:String = "WN_UNLOCKED";
      
      public static const const_1549:String = "WN_UPDATED";
      
      public static const const_917:String = "WN_ACTIVATE";
      
      public static const const_1309:String = "WN_UNLOCK";
      
      public static const const_969:String = "WN_MAXIMIZED";
      
      public static const const_968:String = "WN_DESTROYED";
      
      public static const const_863:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1638,cancelable);
      }
   }
}
