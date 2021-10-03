package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_1756:UserRegistry;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_128:TutorialUI;
      
      private var var_685:IHabboLocalizationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_61:HelpUI;
      
      private var var_684:IHabboConfigurationManager;
      
      private var var_189:IHabboToolbar;
      
      private var var_573:HotelMergeUI;
      
      private var var_320:IHabboCommunicationManager;
      
      private var var_809:FaqIndex;
      
      private var var_1755:String = "";
      
      private var var_1036:IncomingMessages;
      
      private var var_1180:CallForHelpData;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1180 = new CallForHelpData();
         var_1756 = new UserRegistry();
         super(param1,param2,param3);
         _assetLibrary = param3;
         var_809 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return var_189;
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(var_61 != null)
         {
            var_61.tellUI(param1,param2);
         }
      }
      
      private function toggleHelpUI() : void
      {
         if(var_61 == null)
         {
            if(!createHelpUI())
            {
               return;
            }
         }
         var_61.toggleUI();
      }
      
      public function removeTutorialUI() : void
      {
         if(var_128 != null)
         {
            var_128.dispose();
            var_128 = null;
         }
      }
      
      public function get ownUserName() : String
      {
         return var_1755;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      override public function dispose() : void
      {
         if(var_61 != null)
         {
            var_61.dispose();
            var_61 = null;
         }
         if(var_128 != null)
         {
            var_128.dispose();
            var_128 = null;
         }
         if(var_573)
         {
            var_573.dispose();
            var_573 = null;
         }
         if(var_809 != null)
         {
            var_809.dispose();
            var_809 = null;
         }
         var_1036 = null;
         if(var_189)
         {
            var_189.release(new IIDHabboToolbar());
            var_189 = null;
         }
         if(var_685)
         {
            var_685.release(new IIDHabboLocalizationManager());
            var_685 = null;
         }
         if(var_320)
         {
            var_320.release(new IIDHabboCommunicationManager());
            var_320 = null;
         }
         if(var_684)
         {
            var_684.release(new IIDHabboConfigurationManager());
            var_684 = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         super.dispose();
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return var_685;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_103:
               if(var_61 != null)
               {
                  var_61.setRoomSessionStatus(true);
               }
               if(var_128 != null)
               {
                  var_128.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_105:
               if(var_61 != null)
               {
                  var_61.setRoomSessionStatus(false);
               }
               if(var_128 != null)
               {
                  var_128.setRoomSessionStatus(false);
               }
               userRegistry.unregisterRoom();
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(var_61 != null)
         {
            var_61.updateCallForGuideBotUI(true);
         }
      }
      
      public function get userRegistry() : UserRegistry
      {
         return var_1756;
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(var_61 != null)
         {
            var_61.showCallForHelpResult(param1);
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!var_573)
         {
            var_573 = new HotelMergeUI(this);
         }
         var_573.startNameChange();
      }
      
      private function createTutorialUI() : Boolean
      {
         if(var_128 == null && _assetLibrary != null && _windowManager != null)
         {
            var_128 = new TutorialUI(this);
         }
         return var_128 != null;
      }
      
      private function createHelpUI() : Boolean
      {
         if(var_61 == null && _assetLibrary != null && _windowManager != null)
         {
            var_61 = new HelpUI(this,_assetLibrary,_windowManager,var_685,var_189);
         }
         return var_61 != null;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return var_1180;
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         var_1180.reportedUserId = param1;
         var_1180.reportedUserName = param2;
         var_61.showUI(HabboHelpViewEnum.const_297);
      }
      
      public function set ownUserName(param1:String) : void
      {
         var_1755 = param1;
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(var_189 != null)
         {
            var_189.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_118,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_685 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            removeTutorialUI();
            return;
         }
         if(var_128 == null)
         {
            if(!createTutorialUI())
            {
               return;
            }
         }
         var_128.update(param1,param2,param3);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_320 = IHabboCommunicationManager(param2);
         var_1036 = new IncomingMessages(this,var_320);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
      }
      
      public function showUI(param1:String = null) : void
      {
         if(var_61 != null)
         {
            var_61.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(var_61 != null)
         {
            var_61.hideUI();
         }
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(var_320 != null && param1 != null)
         {
            var_320.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return var_809;
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(var_61 != null)
         {
            var_61.updateCallForGuideBotUI(false);
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_189 = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_684 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return var_128;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_93)
         {
            setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_60)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               toggleHelpUI();
               return;
            }
         }
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return var_573;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_103,onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_105,onRoomSessionEvent);
         var_189.events.addEventListener(HabboToolbarEvent.const_93,onHabboToolbarEvent);
         var_189.events.addEventListener(HabboToolbarEvent.const_60,onHabboToolbarEvent);
         createHelpUI();
         setHabboToolbarIcon();
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(var_61 != null)
         {
            var_61.showCallForHelpReply(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(var_684 == null)
         {
            return param1;
         }
         return var_684.getKey(param1,param2,param3);
      }
   }
}
