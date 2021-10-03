package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetCreditBalanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_599:String = "me_menu_settings_view";
      
      public static const const_591:String = "me_menu_effects_view";
      
      public static const const_107:String = "me_menu_top_view";
      
      public static const const_1339:String = "me_menu_rooms_view";
      
      public static const const_830:String = "me_menu_dance_moves_view";
      
      public static const const_284:String = "me_menu_my_clothes_view";
       
      
      private var var_2191:Boolean = false;
      
      private var var_433:Boolean = false;
      
      private var var_1592:int = 0;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var var_1593:int = 0;
      
      private var var_2192:int = 0;
      
      private var var_2194:Boolean = false;
      
      private var var_286:Boolean = false;
      
      private var var_2193:int = 0;
      
      private var var_1934:Number = 0;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_635:Boolean = false;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1367:int = 0;
      
      private var var_2195:Boolean = false;
      
      private var var_1110:Point;
      
      private var var_33:IMeMenuView;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         _config = param5;
         var_1110 = new Point(0,0);
         _eventDispatcher = param4;
         if(param5 != null && false)
         {
            var_2195 = param5.getKey("client.news.embed.enabled","com.sulake.habbo.communication.messages.outgoing.avatar") == "true";
         }
         changeView(const_107);
         hide();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_642,onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_561,onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_636,onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_603,onToolbarClicked);
         param1.addEventListener(RoomWidgetFrameUpdateEvent.const_296,onUpdate);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_521,onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_643,onHideAvatarEditor);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_214,onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_227,onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_640,onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_240,onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_305,onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_109,onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_503,onTutorialEvent);
         param1.addEventListener(RoomWidgetCreditBalanceUpdateEvent.const_162,onCreditBalance);
         super.registerUpdateEvents(param1);
      }
      
      private function onHideAvatarEditor(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_33 != null && var_33.window.name == const_284)
         {
            changeView(const_107);
         }
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(!var_433)
         {
            return;
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return _mainContainer;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return var_635;
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!var_286)
         {
            return;
         }
         if(var_33.window.name == const_599)
         {
            (var_33 as MeMenuSettingsView).updateSettings(param1);
         }
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return var_1367 > 0;
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onCreditBalance(param1:RoomWidgetCreditBalanceUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_1593 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",var_1593.toString());
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(var_286 && var_33.window.name == const_284))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_707);
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_642,onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_561,onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_636,onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_603,onToolbarClicked);
         param1.removeEventListener(RoomWidgetFrameUpdateEvent.const_296,onUpdate);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_214,onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_227,onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_640,onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_521,onHideAvatarEditor);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_643,onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_240,onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_305,onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_503,onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_109,onTutorialEvent);
         param1.removeEventListener(RoomWidgetCreditBalanceUpdateEvent.const_162,onCreditBalance);
      }
      
      override public function dispose() : void
      {
         hide();
         _eventDispatcher = null;
         if(var_33 != null)
         {
            var_33.dispose();
            var_33 = null;
         }
         super.dispose();
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return var_2191;
      }
      
      public function get creditBalance() : int
      {
         return var_1593;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         var_1934 = new Date().valueOf();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_503:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + var_286 + " view: " + var_33.window.name);
               if(var_286 != true || var_33.window.name != const_107)
               {
                  return;
               }
               (var_33 as MeMenuMainView).setIconAssets("clothes_icon",const_107,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_109:
               hide();
         }
      }
      
      public function get isDancing() : Boolean
      {
         return var_2194;
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - var_1934 > 5000;
      }
      
      public function get habboClubPeriods() : int
      {
         return var_2192;
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               var_635 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               var_635 = false;
               break;
            default:
               trace("MeMenuWidget: unknown avatar action event: " + param1.actionType);
         }
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = param1.daysLeft != var_1367;
         var_1367 = param1.daysLeft;
         var_2192 = param1.periodsLeft;
         var_2193 = param1.pastPeriods;
         var_2191 = param1.allowClubDances;
         _loc2_ = Boolean(_loc2_ || param1.clubLevel != var_1592);
         var_1592 = param1.clubLevel;
         if(_loc2_)
         {
            if(var_33 != null)
            {
               changeView(var_33.window.name);
            }
         }
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         var_2194 = param1;
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(var_33 != null && var_33.window.name != const_284)
         {
            hide();
         }
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(_mainContainer == null)
         {
            _mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1316,HabboWindowStyle.const_1035,HabboWindowParam.const_40,new Rectangle(0,0,170,260)) as IWindowContainer;
            _mainContainer.tags.push("room_widget_me_menu");
         }
         return _mainContainer;
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         var_635 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               var_635 = true;
            }
         }
         if(var_33 != null && var_33.window.name == const_591)
         {
            (var_33 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      public function get habboClubPastPeriods() : int
      {
         return var_2193;
      }
      
      public function get habboClubDays() : int
      {
         return var_1367;
      }
      
      public function updateSize() : void
      {
         if(var_33 != null)
         {
            var_1110.x = var_33.window.width + 10;
            var_1110.y = var_33.window.height;
            var_33.window.x = 5;
            var_33.window.y = 0;
            _mainContainer.width = var_1110.x;
            _mainContainer.height = var_1110.y;
         }
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               var_286 = !var_286;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               var_286 = false;
               break;
            default:
               return;
         }
         if(var_286)
         {
            show();
         }
         else
         {
            hide();
         }
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_743);
         _loc2_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(var_33 != null)
         {
            _mainContainer.removeChild(var_33.window);
            var_33.dispose();
            var_33 = null;
         }
         var_286 = false;
         _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_33 != null && var_33.window.name == const_284)
         {
            changeView(const_107);
         }
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return var_2195;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case const_107:
               _loc2_ = new MeMenuMainView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_591:
               _loc2_ = new MeMenuEffectsView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_830:
               _loc2_ = new MeMenuDanceView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_284:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1339:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_599:
               _loc2_ = new MeMenuSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(var_33 != null)
            {
               _mainContainer.removeChild(var_33.window);
               var_33.dispose();
               var_33 = null;
            }
            var_33 = _loc2_;
            var_33.init(this,param1);
         }
         updateSize();
      }
      
      public function get habboClubLevel() : int
      {
         return var_1592;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return _config;
      }
      
      private function show() : void
      {
         if(!_mainContainer || true)
         {
            return;
         }
         changeView(const_107);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_750);
         _loc1_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         var_286 = true;
      }
   }
}
