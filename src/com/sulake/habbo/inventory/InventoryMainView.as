package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class InventoryMainView
   {
       
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_667:String;
      
      private var var_2326:IWindowContainer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_14:IFrameWindow;
      
      private var var_668:String;
      
      private var var_792:Boolean = true;
      
      private var var_1144:IWindowContainer;
      
      private var var_29:HabboInventory;
      
      private var var_189:IHabboToolbar;
      
      public function InventoryMainView(param1:HabboInventory, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super();
         var_29 = param1;
         _assetLibrary = param3;
         _windowManager = param2;
         var _loc4_:IAsset = _assetLibrary.getAssetByName("inventory_xml");
         var _loc5_:XmlAsset = XmlAsset(_loc4_);
         var _loc6_:ICoreWindowManager = ICoreWindowManager(_windowManager);
         var_14 = _loc6_.buildFromXML(XML(_loc5_.content)) as IFrameWindow;
         if(var_14 != null)
         {
            var_14.visible = false;
            var_14.procedure = windowEventProc;
            method_9(0);
            setPixelBalance(0);
            setClubStatus(0,0);
         }
      }
      
      public function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type == WindowEvent.const_64)
         {
            _loc3_ = ITabContextWindow(param2).selector.getSelected().name;
            if(_loc3_ != var_668)
            {
               var_29.toggleInventoryPage(_loc3_);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(param2.name == "header_button_close")
            {
               hideInventory();
            }
         }
      }
      
      public function hideInventory() : void
      {
         var_29.closingInventoryView();
         var _loc1_:IWindow = getWindow();
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.visible = false;
      }
      
      private function setViewToCategory(param1:String) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1 == "")
         {
            return;
         }
         var_29.checkCategoryInitilization(param1);
         var _loc2_:ITabContextWindow = var_14.findChildByName("contentArea") as ITabContextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.container.removeChild(var_1144);
         _loc2_.invalidate();
         var _loc3_:IWindowContainer = var_29.getCategoryWindowContainer(param1);
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.visible = true;
         _loc2_.container.addChild(_loc3_);
         var_1144 = _loc3_;
         var_668 = param1;
         _loc2_.selector.setSelected(_loc2_.selector.getSelectableByName(param1));
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_93)
         {
         }
         if(param1.iconId != HabboToolbarIconEnum.INVENTORY)
         {
            return;
         }
         if(param1.type == HabboToolbarEvent.const_60)
         {
            if(var_668 == InventoryCategory.const_152)
            {
               toggleCategoryView(InventoryCategory.const_152);
            }
            else if(var_668 == InventoryCategory.const_80)
            {
               toggleCategoryView(InventoryCategory.const_80);
            }
            else if(var_29 != null)
            {
               var_29.toggleInventoryPage(InventoryCategory.const_80);
            }
         }
      }
      
      public function toggleSubCategoryView(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:IWindow = getWindow();
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.visible)
         {
            if(var_667 == param1)
            {
               if(param2)
               {
                  _loc3_.visible = false;
               }
            }
            else
            {
               setSubViewToCategory(param1);
            }
         }
         else
         {
            _loc3_.visible = true;
            if(param1 != var_667)
            {
               setSubViewToCategory(param1);
            }
            if(var_189 != null && var_792)
            {
               var_189.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_52,HabboToolbarIconEnum.INVENTORY,_loc3_ as IWindowContainer));
            }
         }
      }
      
      public function setClubStatus(param1:int, param2:int) : void
      {
         _windowManager.registerLocalizationParameter("inventory.purse.clubdays","months",String(param1));
         _windowManager.registerLocalizationParameter("inventory.purse.clubdays","days",String(param2));
      }
      
      public function updateSubCategoryView() : void
      {
         if(var_667 == null)
         {
            return;
         }
         setSubViewToCategory(var_667);
      }
      
      public function dispose() : void
      {
         var_29 = null;
         var_14 = null;
         var_1144 = null;
         var_189 = null;
         _windowManager = null;
      }
      
      public function method_9(param1:int) : void
      {
         _windowManager.registerLocalizationParameter("inventory.purse.creditbalance","balance",String(param1));
      }
      
      public function getWindow() : IFrameWindow
      {
         return var_14;
      }
      
      public function setHabboToolbarIcon() : void
      {
         if(var_189 != null)
         {
            var_189.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_118,HabboToolbarIconEnum.INVENTORY));
         }
      }
      
      private function setSubViewToCategory(param1:String) : void
      {
         if(param1 == null || param1 == "")
         {
            return;
         }
         var_29.checkCategoryInitilization(param1);
         var _loc2_:IWindowContainer = var_14.findChildByName("subContentArea") as IWindowContainer;
         while(_loc2_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
         }
         var _loc3_:IWindowContainer = var_29.getCategorySubWindowContainer(param1);
         if(_loc3_ != null)
         {
            _loc2_.visible = true;
            _loc3_.visible = true;
            _loc2_.height = _loc3_.height;
            _loc2_.addChild(_loc3_);
         }
         else
         {
            _loc2_.visible = false;
            _loc2_.height = 0;
         }
         var_14.resizeToFitContent();
         var_2326 = _loc3_;
         var_667 = param1;
         if(var_189 != null)
         {
            var_189.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_712,HabboToolbarIconEnum.INVENTORY,var_14 as IWindowContainer));
         }
      }
      
      public function showInventory() : void
      {
         var _loc1_:IWindow = getWindow();
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.visible = true;
         if(var_189 != null && var_792)
         {
            var_189.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_52,HabboToolbarIconEnum.INVENTORY,_loc1_ as IWindowContainer));
            var_792 = false;
         }
         var_29.inventoryViewOpened(var_667);
      }
      
      public function get isVisible() : Boolean
      {
         return !!var_14 ? false : false;
      }
      
      public function getCategoryViewId() : String
      {
         return var_668;
      }
      
      public function getSubCategoryViewId() : String
      {
         return var_667;
      }
      
      public function setToolbar(param1:IHabboToolbar) : void
      {
         var_189 = param1;
         var_189.events.addEventListener(HabboToolbarEvent.const_93,onHabboToolbarEvent);
         var_189.events.addEventListener(HabboToolbarEvent.const_60,onHabboToolbarEvent);
      }
      
      public function toggleCategoryView(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:IWindow = getWindow();
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.visible)
         {
            if(var_668 == param1)
            {
               if(param2)
               {
                  _loc3_.visible = false;
               }
            }
            else
            {
               setViewToCategory(param1);
            }
         }
         else
         {
            _loc3_.visible = true;
            _loc3_.activate();
            if(param1 != var_668 || !var_29.isInventoryCategoryInit(param1))
            {
               setViewToCategory(param1);
            }
            if(var_189 != null && var_792)
            {
               var_189.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_52,HabboToolbarIconEnum.INVENTORY,_loc3_ as IWindowContainer));
               var_792 = false;
            }
            var_29.inventoryViewOpened(param1);
         }
      }
      
      public function setPixelBalance(param1:int) : void
      {
         _windowManager.registerLocalizationParameter("inventory.purse.pixelbalance","balance",String(param1));
      }
   }
}
