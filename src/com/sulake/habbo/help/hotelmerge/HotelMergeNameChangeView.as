package com.sulake.habbo.help.hotelmerge
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import com.sulake.habbo.help.tutorial.NameSuggestionListRenderer;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   
   public class HotelMergeNameChangeView
   {
      
      private static var var_1511:uint = 13232628;
      
      private static var var_1942:uint = 11129827;
       
      
      private var var_1343:String;
      
      private var var_920:Boolean = false;
      
      private var var_628:IWindowContainer;
      
      private var var_860:NameSuggestionListRenderer;
      
      private var _window:IFrameWindow;
      
      private var var_273:IWindowContainer;
      
      private var var_360:String;
      
      private var var_1344:IWindowContainer;
      
      private var var_29:HotelMergeUI;
      
      private var var_33:IWindowContainer;
      
      public function HotelMergeNameChangeView(param1:HotelMergeUI)
      {
         super();
         var_29 = param1;
      }
      
      public function setNameAvailableView() : void
      {
         if(_window == null)
         {
            return;
         }
         nameCheckWaitEnd(true);
         var _loc1_:ITextWindow = _window.findChildByName("info_text") as ITextWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var_29.localization.registerParameter("help.tutorial.name.available","name",var_360);
         _loc1_.text = var_29.localization.getKey("help.tutorial.name.available");
         var _loc2_:ITextFieldWindow = _window.findChildByName("input") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = var_360;
         var _loc3_:IWindowContainer = _window.findChildByName("suggestions") as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.visible = false;
      }
      
      private function showView(param1:IWindowContainer) : void
      {
         var_920 = false;
         if(var_33)
         {
            var_33.visible = false;
         }
         var_33 = param1;
         var_33.visible = true;
         if(_window)
         {
            _window.content.width = var_33.width;
            _window.content.height = var_33.height;
         }
      }
      
      private function getName() : String
      {
         var _loc1_:* = null;
         if(_window)
         {
            _loc1_ = _window.findChildByName("input") as ITextFieldWindow;
            if(_loc1_)
            {
               return _loc1_.text;
            }
         }
         return null;
      }
      
      private function nameOut(param1:WindowMouseEvent) : void
      {
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.color = var_1511;
         }
      }
      
      private function createWindow(param1:String) : IWindow
      {
         var _loc2_:XmlAsset = var_29.assets.getAssetByName(param1) as XmlAsset;
         if(!_loc2_)
         {
            return null;
         }
         return var_29.windowManager.buildFromXML(_loc2_.content as XML);
      }
      
      private function nameSelected(param1:WindowMouseEvent) : void
      {
         nameCheckWaitEnd(true);
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:String = _loc2_.text;
         setNormalView();
         var _loc4_:ITextFieldWindow = _window.findChildByName("input") as ITextFieldWindow;
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.text = _loc3_;
      }
      
      private function nameOver(param1:WindowMouseEvent) : void
      {
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.color = var_1942;
         }
      }
      
      private function showSelectionView() : void
      {
         if(!var_628)
         {
            var_628 = createWindow("hotel_merge_name_selection_xml") as IWindowContainer;
            if(!var_628)
            {
               return;
            }
            _window.content.addChild(var_628);
         }
         _window.caption = var_29.localization.getKey("hotel_merge.name_change.title.select");
         var _loc1_:IButtonWindow = _window.findChildByName("select_name_button") as IButtonWindow;
         if(_loc1_)
         {
            _loc1_.disable();
         }
         setNormalView();
         showView(var_628);
      }
      
      private function showConfirmationView() : void
      {
         if(!var_273)
         {
            var_273 = createWindow("hotel_merge_name_confirmation_xml") as IWindowContainer;
            if(!var_273)
            {
               return;
            }
            _window.content.addChild(var_273);
         }
         _window.caption = var_29.localization.getKey("hotel_merge.name_change.title.confirm");
         var _loc1_:ITextWindow = var_273.findChildByName("final_name") as ITextWindow;
         if(_loc1_)
         {
            _loc1_.text = var_360;
         }
         showView(var_273);
      }
      
      public function get id() : String
      {
         return TutorialUI.const_217;
      }
      
      public function dispose() : void
      {
         disposeWindow();
         if(var_860 != null)
         {
            var_860.dispose();
            var_860 = null;
         }
      }
      
      private function windowEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(!var_920)
         {
            if(param1.type == WindowEvent.const_119)
            {
               if(param2.name == "input")
               {
                  _loc3_ = _window.findChildByName("select_name_button");
                  _loc4_ = param2 as ITextFieldWindow;
                  if(_loc3_ && _loc4_)
                  {
                     if(_loc4_.text.length > 2)
                     {
                        _loc3_.enable();
                     }
                     else
                     {
                        _loc3_.disable();
                     }
                  }
               }
            }
         }
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "change_name_button":
               showSelectionView();
               break;
            case "keep_name_button":
               var_360 = var_29.myName;
               showConfirmationView();
               break;
            case "check_name_button":
               var_29.checkName(getName());
               nameCheckWaitBegin();
               break;
            case "select_name_button":
               _loc5_ = getName();
               if(_loc5_.length < 1)
               {
                  return;
               }
               if(var_360 != _loc5_)
               {
                  var_1343 = _loc5_;
                  var_29.checkName(_loc5_);
                  nameCheckWaitBegin();
               }
               else
               {
                  showConfirmationView();
               }
               break;
            case "cancel_selection_button":
               nameCheckWaitEnd(true);
               showMainView();
               break;
            case "confirm_name_button":
               var_29.changeName(var_360);
               break;
            case "cancel_confirmation_button":
               nameCheckWaitEnd(true);
               showMainView();
               break;
            case "header_button_close":
               disposeWindow();
         }
      }
      
      public function showMainView() : void
      {
         if(!_window)
         {
            _window = createWindow("hotel_merge_name_change_xml") as IFrameWindow;
            _window.center();
            _window.procedure = windowEventHandler;
            var_1344 = _window.content.getChildAt(0) as IWindowContainer;
         }
         var_29.localization.registerParameter("hotel_merge.name_change.current","name",var_29.myName);
         _window.caption = var_29.localization.getKey("hotel_merge.name_change.title.main");
         showView(var_1344);
      }
      
      public function setNameNotAvailableView(param1:int, param2:String, param3:Array) : void
      {
         var _loc8_:* = null;
         nameCheckWaitEnd(false);
         if(var_33 != var_628)
         {
            showSelectionView();
         }
         var_1343 = null;
         var_360 = null;
         if(_window == null)
         {
            return;
         }
         var _loc4_:ITextWindow = _window.findChildByName("info_text") as ITextWindow;
         if(_loc4_ == null)
         {
            return;
         }
         switch(param1)
         {
            case ChangeUserNameResultMessageEvent.var_960:
               var_29.localization.registerParameter("help.tutorial.name.taken","name",param2);
               _loc4_.text = var_29.localization.getKey("help.tutorial.name.taken");
               break;
            case ChangeUserNameResultMessageEvent.var_964:
               var_29.localization.registerParameter("help.tutorial.name.invalid","name",param2);
               _loc4_.text = var_29.localization.getKey("help.tutorial.name.invalid");
               break;
            case ChangeUserNameResultMessageEvent.var_963:
               break;
            case ChangeUserNameResultMessageEvent.var_962:
               _loc4_.text = var_29.localization.getKey("help.tutorial.name.long");
               break;
            case ChangeUserNameResultMessageEvent.var_961:
               _loc4_.text = var_29.localization.getKey("help.tutorial.name.short");
               break;
            case ChangeUserNameResultMessageEvent.var_1129:
               _loc4_.text = var_29.localization.getKey("help.tutorial.name.change_not_allowed");
               break;
            case ChangeUserNameResultMessageEvent.var_1130:
               _loc4_.text = var_29.localization.getKey("help.tutorial.name.merge_hotel_down");
         }
         var _loc5_:IWindowContainer = _window.findChildByName("suggestions") as IWindowContainer;
         if(_loc5_ == null)
         {
            return;
         }
         if(param1 == ChangeUserNameResultMessageEvent.var_1130 || param1 == ChangeUserNameResultMessageEvent.var_1129)
         {
            _loc5_.visible = false;
            return;
         }
         _loc5_.visible = true;
         var_860 = new NameSuggestionListRenderer(var_29);
         var _loc6_:int = var_860.render(param3,_loc5_);
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.numChildren)
         {
            _loc8_ = _loc5_.getChildAt(_loc7_);
            _loc8_.color = var_1511;
            _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,nameSelected);
            _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,nameOver);
            _loc8_.addEventListener(WindowMouseEvent.const_33,nameOut);
            _loc7_++;
         }
      }
      
      public function nameCheckWaitEnd(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if(_window && true)
         {
            if(param1)
            {
               _loc2_ = _window.findChildByName("select_name_button");
               if(_loc2_)
               {
                  _loc2_.enable();
               }
            }
            _loc2_ = _window.findChildByName("check_name_button");
            if(_loc2_)
            {
               _loc2_.enable();
            }
            _loc2_ = _window.findChildByName("input");
            if(_loc2_)
            {
               _loc2_.enable();
            }
         }
         var_920 = false;
      }
      
      public function set checkedName(param1:String) : void
      {
         var_360 = param1;
         if(var_1343 == var_360)
         {
            showConfirmationView();
            return;
         }
         setNameAvailableView();
      }
      
      public function get view() : IWindowContainer
      {
         return _window;
      }
      
      public function setNormalView() : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc1_:ITextWindow = _window.findChildByName("info_text") as ITextWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.text = var_29.localization.getKey("help.tutorial.name.info");
         var _loc2_:IWindowContainer = _window.findChildByName("suggestions") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = false;
      }
      
      private function disposeWindow() : void
      {
         var_1344 = null;
         var_628 = null;
         var_273 = null;
         var_33 = null;
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function nameCheckWaitBegin() : void
      {
         var _loc1_:* = null;
         if(_window && true)
         {
            _loc1_ = _window.findChildByName("select_name_button");
            if(_loc1_)
            {
               _loc1_.disable();
            }
            _loc1_ = _window.findChildByName("check_name_button");
            if(_loc1_)
            {
               _loc1_.disable();
            }
            _loc1_ = _window.findChildByName("input");
            if(_loc1_)
            {
               _loc1_.disable();
            }
            _loc1_ = _window.findChildByName("info_text");
            if(_loc1_)
            {
               _loc1_.caption = var_29.localization.getKey("help.tutorial.name.wait_while_checking");
            }
         }
         var_920 = true;
      }
   }
}
