package com.sulake.habbo.ui
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IHabboAvatarEditorDataSaver;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.events.AvatarEditorClosedEvent;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.inventory.events.HabboInventoryEffectsEvent;
   import com.sulake.habbo.inventory.events.HabboInventoryHabboClubEvent;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.session.IUserData;
   import com.sulake.habbo.session.events.HabboSessionFigureUpdatedEvent;
   import com.sulake.habbo.session.events.SessionCreditBalanceEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetCreditBalanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetAvatarEditorMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetClothingChangeMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetDanceMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetGetEffectsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetGetSettingsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetNavigateToRoomMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetOpenCatalogMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetOpenInventoryMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectEffectMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSetToolbarIconMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetShowOwnRoomsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetStopEffectMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetStoreSettingsMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetWaveMessage;
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class MeMenuWidgetHandler implements IRoomWidgetHandler, IHabboAvatarEditorDataSaver
   {
       
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var _isDisposed:Boolean = false;
      
      private var _catalog:IHabboCatalog;
      
      private var var_11:IHabboInventory;
      
      private var var_189:IHabboToolbar;
      
      public function MeMenuWidgetHandler()
      {
         super();
         Logger.log("[MeMenuWidgetHandler]");
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_416;
      }
      
      public function saveFigure(param1:String, param2:String) : void
      {
         if(_container == null)
         {
            return;
         }
         _container.roomSession.sendUpdateFigureData(param1,param2);
      }
      
      private function setMeMenuToolbarIcon(param1:Boolean) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc2_:* = null;
         if(false)
         {
            _loc4_ = _container.sessionDataManager.figure;
            _loc5_ = _container.sessionDataManager.gender;
            _loc6_ = _container.avatarRenderManager.createAvatarImage(_loc4_,AvatarScaleType.const_56,_loc5_);
            if(_loc6_ != null)
            {
               _loc6_.setDirection(AvatarSetType.const_48,3);
               _loc2_ = _loc6_.getCroppedImage(AvatarSetType.const_48);
            }
         }
         var _loc3_:Component = _container.roomWidgetFactory as Component;
         if(_loc3_ != null)
         {
            if(_loc2_ == null)
            {
               _loc8_ = _loc3_.assets.getAssetByName("memenu_toolbar_icon") as BitmapDataAsset;
               _loc7_ = _loc8_.content as BitmapData;
            }
            else
            {
               _loc7_ = _loc2_;
            }
            Logger.log("MeMenuWidgetHandler: set toolbar icon: " + var_189 + " " + _loc7_);
            if(var_189 != null && _loc7_ != null)
            {
               _loc9_ = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_923,HabboToolbarIconEnum.MEMENU);
               _loc9_.bitmapData = _loc7_;
               var_189.events.dispatchEvent(_loc9_);
            }
         }
      }
      
      private function onCreditBalance(param1:SessionCreditBalanceEvent) : void
      {
         if(param1 == null || _container == null || true)
         {
            return;
         }
         _container.events.dispatchEvent(new RoomWidgetCreditBalanceUpdateEvent(param1.credits));
      }
      
      private function onFigureUpdate(param1:HabboSessionFigureUpdatedEvent) : void
      {
         if(_container == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         var _loc2_:* = param1.userId == _container.sessionDataManager.userId;
         if(_loc2_)
         {
            setMeMenuToolbarIcon(false);
         }
         if(_container != null && false)
         {
         }
      }
      
      public function update() : void
      {
         if(_container)
         {
            _container.events.dispatchEvent(new RoomWidgetFrameUpdateEvent());
         }
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         if(_container != null)
         {
            if(false)
            {
               _container.sessionDataManager.events.removeEventListener(HabboSessionFigureUpdatedEvent.const_703,onFigureUpdate);
            }
            if(false)
            {
               _container.avatarEditor.events.removeEventListener(AvatarEditorClosedEvent.AVATAREDITOR_CLOSED,onAvatarEditorClosed);
            }
            if(false)
            {
               _container.habboHelp.events.removeEventListener(HabboHelpTutorialEvent.const_479,onHelpTutorialEvent);
               _container.habboHelp.events.removeEventListener(HabboHelpTutorialEvent.const_109,onHelpTutorialEvent);
            }
            _container = null;
         }
         _container = param1;
         if(_container != null && false)
         {
            _container.sessionDataManager.events.addEventListener(HabboSessionFigureUpdatedEvent.const_703,onFigureUpdate);
            _container.sessionDataManager.events.addEventListener(SessionCreditBalanceEvent.const_162,onCreditBalance);
         }
         var_11 = _container.inventory;
         if(var_11 != null)
         {
            (var_11 as Component).events.addEventListener(HabboInventoryEffectsEvent.const_874,onAvatarEffectsChanged);
            (var_11 as Component).events.addEventListener(HabboInventoryHabboClubEvent.const_984,onHabboClubSubscriptionChanged);
         }
         var_189 = _container.toolbar;
         if(var_189)
         {
            var_189.events.addEventListener(HabboToolbarEvent.const_93,onHabboToolbarEvent);
            var_189.events.addEventListener(HabboToolbarEvent.const_60,onHabboToolbarEvent);
            setMeMenuToolbarIcon(false);
         }
         if(false)
         {
            _container.avatarEditor.events.addEventListener(AvatarEditorClosedEvent.AVATAREDITOR_CLOSED,onAvatarEditorClosed);
         }
         if(false)
         {
            _container.habboHelp.events.addEventListener(HabboHelpTutorialEvent.const_479,onHelpTutorialEvent);
            _container.habboHelp.events.addEventListener(HabboHelpTutorialEvent.const_109,onHelpTutorialEvent);
         }
         _catalog = _container.catalog;
      }
      
      private function onHelpTutorialEvent(param1:HabboHelpTutorialEvent) : void
      {
         if(_container == null)
         {
            return;
         }
         switch(param1.type)
         {
            case HabboHelpTutorialEvent.const_109:
               _container.events.dispatchEvent(new RoomWidgetTutorialEvent(RoomWidgetTutorialEvent.const_109));
               break;
            case HabboHelpTutorialEvent.const_479:
               _container.events.dispatchEvent(new RoomWidgetTutorialEvent(RoomWidgetTutorialEvent.const_503));
         }
      }
      
      public function getProcessedEvents() : Array
      {
         return [];
      }
      
      private function onAvatarEffectsChanged(param1:Event = null) : void
      {
         var _loc2_:* = null;
         if(_container == null)
         {
            return;
         }
         Logger.log("[MeMenuWidgetHandler] Received Avatar Effects Have Changed Event...\t");
         if(var_11 != null)
         {
            _loc2_ = var_11.getAvatarEffects();
            _container.events.dispatchEvent(new RoomWidgetUpdateEffectsUpdateEvent(_loc2_));
         }
      }
      
      private function onHabboClubSubscriptionChanged(param1:Event = null) : void
      {
         var _loc2_:Boolean = false;
         if(var_11 != null)
         {
            _loc2_ = false;
            if(_container != null && false)
            {
               _loc2_ = _container.sessionDataManager.hasUserRight("fuse_use_club_dance");
            }
            _container.events.dispatchEvent(new RoomWidgetHabboClubUpdateEvent(var_11.clubDays,var_11.clubPeriods,var_11.clubPastPeriods,_loc2_,var_11.clubLevel));
         }
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function getWidgetMessages() : Array
      {
         var _loc1_:* = [];
         _loc1_.push(RoomWidgetWaveMessage.const_543);
         _loc1_.push(RoomWidgetDanceMessage.const_652);
         _loc1_.push(RoomWidgetGetEffectsMessage.const_734);
         _loc1_.push(RoomWidgetSelectEffectMessage.const_668);
         _loc1_.push(RoomWidgetSelectEffectMessage.const_708);
         _loc1_.push(RoomWidgetSelectEffectMessage.const_753);
         _loc1_.push(RoomWidgetOpenInventoryMessage.const_566);
         _loc1_.push(RoomWidgetOpenCatalogMessage.const_613);
         _loc1_.push(RoomWidgetStopEffectMessage.const_651);
         _loc1_.push(RoomWidgetNavigateToRoomMessage.const_1208);
         _loc1_.push(RoomWidgetNavigateToRoomMessage.const_934);
         _loc1_.push(RoomWidgetToolbarMessage.const_750);
         _loc1_.push(RoomWidgetToolbarMessage.const_743);
         _loc1_.push(RoomWidgetAvatarEditorMessage.const_319);
         _loc1_.push(RoomWidgetAvatarEditorMessage.const_1358);
         _loc1_.push(RoomWidgetSelectOutfitMessage.const_1039);
         _loc1_.push(RoomWidgetShowOwnRoomsMessage.const_759);
         _loc1_.push(RoomWidgetRequestWidgetMessage.const_707);
         _loc1_.push(RoomWidgetGetSettingsMessage.const_702);
         _loc1_.push(RoomWidgetStoreSettingsMessage.const_1363);
         _loc1_.push(RoomWidgetStoreSettingsMessage.const_756);
         _loc1_.push(RoomWidgetStoreSettingsMessage.const_531);
         _loc1_.push(RoomWidgetAvatarEditorMessage.const_605);
         _loc1_.push(RoomWidgetClothingChangeMessage.const_306);
         return _loc1_;
      }
      
      public function processEvent(param1:Event) : void
      {
      }
      
      public function dispose() : void
      {
         _isDisposed = true;
         _container = null;
         var_11 = null;
         var_189 = null;
         _catalog = null;
      }
      
      private function onAvatarEditorClosed(param1:Event = null) : void
      {
         if(_container == null)
         {
            return;
         }
         Logger.log("[MeMenuWidgetHandler] Received Avatar Editor Closed Event...");
         _container.events.dispatchEvent(new RoomWidgetAvatarEditorUpdateEvent(RoomWidgetAvatarEditorUpdateEvent.const_521));
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:Boolean = false;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:int = 0;
         if(!param1)
         {
            return null;
         }
         switch(param1.type)
         {
            case RoomWidgetRequestWidgetMessage.const_707:
               if(_container != null && false && _container.toolbar.events != null)
               {
                  _loc7_ = new HabboToolbarEvent(HabboToolbarEvent.const_60);
                  _loc7_.iconId = HabboToolbarIconEnum.MEMENU;
                  _container.toolbar.events.dispatchEvent(_loc7_);
               }
               break;
            case RoomWidgetWaveMessage.const_543:
               if(_container != null && false)
               {
                  _container.roomSession.sendWaveMessage();
               }
               break;
            case RoomWidgetDanceMessage.const_652:
               if(_container != null && false)
               {
                  _loc8_ = param1 as RoomWidgetDanceMessage;
                  if(_loc8_ != null)
                  {
                     _container.roomSession.sendDanceMessage(_loc8_.style);
                  }
               }
               break;
            case RoomWidgetGetEffectsMessage.const_734:
               if(var_11 != null)
               {
                  _loc9_ = var_11.getAvatarEffects();
                  _container.events.dispatchEvent(new RoomWidgetUpdateEffectsUpdateEvent(_loc9_));
               }
               break;
            case RoomWidgetSelectEffectMessage.const_668:
               if(var_11 != null)
               {
                  _loc10_ = param1 as RoomWidgetSelectEffectMessage;
                  var_11.setEffectSelected(_loc10_.effectType);
               }
               break;
            case RoomWidgetSelectEffectMessage.const_708:
               if(var_11 != null)
               {
                  _loc11_ = param1 as RoomWidgetSelectEffectMessage;
                  var_11.setEffectDeselected(_loc11_.effectType);
               }
               break;
            case RoomWidgetOpenCatalogMessage.const_613:
               _loc2_ = param1 as RoomWidgetOpenCatalogMessage;
               if(_catalog != null && _loc2_.pageKey == RoomWidgetOpenCatalogMessage.const_873)
               {
                  _catalog.openCatalogPage(CatalogPageName.const_245,true);
               }
               break;
            case RoomWidgetOpenInventoryMessage.const_566:
               _loc3_ = param1 as RoomWidgetOpenInventoryMessage;
               if(var_11 != null)
               {
                  Logger.log("MeMenuWidgetHandler open inventory: " + _loc3_.inventoryType);
                  switch(_loc3_.inventoryType)
                  {
                     case RoomWidgetOpenInventoryMessage.const_906:
                        _catalog.openCatalogPage(CatalogPageName.const_1255,true);
                        break;
                     case RoomWidgetOpenInventoryMessage.const_875:
                        var_11.toggleInventoryPage(InventoryCategory.const_281);
                        break;
                     case RoomWidgetOpenInventoryMessage.const_1220:
                        var_11.toggleInventoryPage(InventoryCategory.const_80);
                        break;
                     case RoomWidgetOpenInventoryMessage.const_1388:
                        break;
                     default:
                        Logger.log("MeMenuWidgetHandler: unknown inventory type: " + _loc3_.inventoryType);
                  }
               }
               break;
            case RoomWidgetSelectEffectMessage.const_753:
            case RoomWidgetStopEffectMessage.const_651:
               Logger.log("STOP ALL EFFECTS");
               if(var_11 != null)
               {
                  var_11.deselectAllEffects();
               }
               break;
            case RoomWidgetSetToolbarIconMessage.const_925:
               _loc4_ = param1 as RoomWidgetSetToolbarIconMessage;
               switch(_loc4_.widgetType)
               {
                  case RoomWidgetSetToolbarIconMessage.const_1230:
                     break;
                  default:
                     Logger.log("MeMenuWidgetHandler: unknown icon widget type: " + _loc4_.widgetType);
               }
               break;
            case RoomWidgetNavigateToRoomMessage.const_934:
               Logger.log("MeMenuWidgetHandler: GO HOME");
               if(_container != null)
               {
                  _container.navigator.goToHomeRoom();
               }
               break;
            case RoomWidgetShowOwnRoomsMessage.const_759:
               if(_container != null)
               {
                  _container.navigator.showOwnRooms();
               }
               break;
            case RoomWidgetToolbarMessage.const_750:
               _loc5_ = param1 as RoomWidgetToolbarMessage;
               if(!_loc5_ || !_container || true)
               {
                  return null;
               }
               if(var_189)
               {
                  var_189.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_52,HabboToolbarIconEnum.MEMENU,_loc5_.window));
                  if(var_11 != null)
                  {
                     _loc12_ = false;
                     if(_container != null && false)
                     {
                        _loc12_ = _container.sessionDataManager.hasUserRight("fuse_use_club_dance");
                     }
                     _container.events.dispatchEvent(new RoomWidgetHabboClubUpdateEvent(var_11.clubDays,var_11.clubPeriods,var_11.clubPastPeriods,_loc12_,var_11.clubLevel));
                  }
                  if(_catalog != null && _catalog.getPurse() != null)
                  {
                     _container.events.dispatchEvent(new RoomWidgetCreditBalanceUpdateEvent(_catalog.getPurse().credits));
                  }
               }
               if(true || !_container.roomSession.userDataManager)
               {
                  return null;
               }
               if(false)
               {
                  _loc13_ = _container.sessionDataManager != null ? int(_container.sessionDataManager.userId) : -1;
                  _loc14_ = _container.roomSession.userDataManager.getUserData(_loc13_);
                  if(!_loc14_)
                  {
                     return null;
                  }
                  _loc15_ = 0;
                  _loc16_ = 0;
                  _container.roomEngine.selectAvatar(_loc15_,_loc16_,_loc14_.id,true);
               }
               break;
            case RoomWidgetToolbarMessage.const_743:
               _loc6_ = param1 as RoomWidgetToolbarMessage;
               if(!_loc6_)
               {
                  return null;
               }
               if(var_189 && false)
               {
                  var_189.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_457,HabboToolbarIconEnum.MEMENU,_loc6_.window));
               }
               break;
            case RoomWidgetAvatarEditorMessage.const_319:
               Logger.log("MeMenuWidgetHandler: Open avatar editor...");
               if(_container)
               {
                  _loc17_ = param1 as RoomWidgetAvatarEditorMessage;
                  _loc18_ = _loc17_.context;
                  _container.avatarEditor.openEditor(_loc18_,this);
                  _loc19_ = _container.sessionDataManager.figure;
                  _loc20_ = _container.sessionDataManager.gender;
                  _loc21_ = 0;
                  if(_container.sessionDataManager.hasUserRight("fuse_use_club_outfits"))
                  {
                     _loc21_ = 0;
                  }
                  if(_container.sessionDataManager.hasUserRight("fuse_use_vip_outfits"))
                  {
                     _loc21_ = 0;
                  }
                  _container.avatarEditor.loadAvatarInEditor(_loc19_,_loc20_,_loc21_);
                  if(false && _container.habboHelp.events)
                  {
                     _container.habboHelp.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.const_464));
                  }
               }
               break;
            case RoomWidgetGetSettingsMessage.const_702:
               _container.events.dispatchEvent(new RoomWidgetSettingsUpdateEvent(RoomWidgetSettingsUpdateEvent.const_305,_container.soundManager.volume));
               break;
            case RoomWidgetStoreSettingsMessage.const_756:
               _container.soundManager.volume = (param1 as RoomWidgetStoreSettingsMessage).volume;
               _container.events.dispatchEvent(new RoomWidgetSettingsUpdateEvent(RoomWidgetSettingsUpdateEvent.const_305,_container.soundManager.volume));
               break;
            case RoomWidgetStoreSettingsMessage.const_531:
               _container.soundManager.previewVolume = (param1 as RoomWidgetStoreSettingsMessage).volume;
               _container.events.dispatchEvent(new RoomWidgetSettingsUpdateEvent(RoomWidgetSettingsUpdateEvent.const_305,_container.soundManager.volume));
               break;
            case RoomWidgetAvatarEditorMessage.const_605:
               if(false && _container.habboHelp.events)
               {
                  _container.habboHelp.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.const_384));
               }
               break;
            case RoomWidgetClothingChangeMessage.const_306:
               _container.events.dispatchEvent(new RoomWidgetAvatarEditorUpdateEvent(RoomWidgetAvatarEditorUpdateEvent.const_643));
               break;
            default:
               Logger.log("Unhandled message in MeMenuWidgetHandler: " + param1.type);
         }
         return null;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_93)
         {
            setMeMenuToolbarIcon(false);
         }
         if(_container == null)
         {
            return;
         }
         if(param1.type == HabboToolbarEvent.const_60)
         {
            switch(param1.iconId)
            {
               case HabboToolbarIconEnum.MEMENU:
                  _container.events.dispatchEvent(new RoomWidgetToolbarClickedUpdateEvent(RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU));
                  break;
               case HabboToolbarIconEnum.ROOMINFO:
                  _container.events.dispatchEvent(new RoomWidgetToolbarClickedUpdateEvent(RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO));
            }
         }
      }
   }
}
