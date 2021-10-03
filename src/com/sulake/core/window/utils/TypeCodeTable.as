package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_627;
         param1["bitmap"] = const_749;
         param1["border"] = const_584;
         param1["border_notify"] = const_1229;
         param1["button"] = const_500;
         param1["button_thick"] = const_594;
         param1["button_icon"] = const_1351;
         param1["button_group_left"] = const_666;
         param1["button_group_center"] = const_635;
         param1["button_group_right"] = const_737;
         param1["canvas"] = const_630;
         param1["checkbox"] = const_735;
         param1["closebutton"] = const_1046;
         param1["container"] = const_357;
         param1["container_button"] = const_545;
         param1["display_object_wrapper"] = const_565;
         param1["dropmenu"] = const_444;
         param1["dropmenu_item"] = const_475;
         param1["frame"] = const_312;
         param1["frame_notify"] = const_1304;
         param1["header"] = const_746;
         param1["icon"] = const_949;
         param1["itemgrid"] = const_884;
         param1["itemgrid_horizontal"] = const_459;
         param1["itemgrid_vertical"] = const_554;
         param1["itemlist"] = const_997;
         param1["itemlist_horizontal"] = const_334;
         param1["itemlist_vertical"] = const_341;
         param1["maximizebox"] = const_1249;
         param1["menu"] = WINDOW_TYPE_MENU;
         param1["menu_item"] = const_1392;
         param1["submenu"] = const_980;
         param1["minimizebox"] = const_1307;
         param1["notify"] = const_1353;
         param1["null"] = const_728;
         param1["password"] = const_656;
         param1["radiobutton"] = const_602;
         param1["region"] = const_377;
         param1["restorebox"] = const_1397;
         param1["scaler"] = const_681;
         param1["scaler_horizontal"] = const_1429;
         param1["scaler_vertical"] = const_1357;
         param1["scrollbar_horizontal"] = const_410;
         param1["scrollbar_vertical"] = const_687;
         param1["scrollbar_slider_button_up"] = const_901;
         param1["scrollbar_slider_button_down"] = const_945;
         param1["scrollbar_slider_button_left"] = const_859;
         param1["scrollbar_slider_button_right"] = const_894;
         param1["scrollbar_slider_bar_horizontal"] = const_909;
         param1["scrollbar_slider_bar_vertical"] = const_986;
         param1["scrollbar_slider_track_horizontal"] = const_995;
         param1["scrollbar_slider_track_vertical"] = const_938;
         param1["scrollable_itemlist"] = const_1290;
         param1["scrollable_itemlist_vertical"] = const_461;
         param1["scrollable_itemlist_horizontal"] = const_860;
         param1["selector"] = const_623;
         param1["selector_list"] = const_556;
         param1["submenu"] = const_980;
         param1["tab_button"] = const_731;
         param1["tab_container_button"] = const_924;
         param1["tab_context"] = WINDOW_TYPE_TAB_CONTEXT;
         param1["tab_content"] = const_872;
         param1["tab_selector"] = const_696;
         param1["text"] = const_523;
         param1["input"] = const_525;
         param1["toolbar"] = const_1270;
         param1["tooltip"] = const_328;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
