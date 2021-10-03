package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_143;
         param1["bound_to_parent_rect"] = const_88;
         param1["child_window"] = const_836;
         param1["embedded_controller"] = const_330;
         param1["resize_to_accommodate_children"] = const_68;
         param1["input_event_processor"] = const_50;
         param1["internal_event_handling"] = const_684;
         param1["mouse_dragging_target"] = const_210;
         param1["mouse_dragging_trigger"] = const_307;
         param1["mouse_scaling_target"] = const_250;
         param1["mouse_scaling_trigger"] = const_486;
         param1["horizontal_mouse_scaling_trigger"] = const_216;
         param1["vertical_mouse_scaling_trigger"] = const_246;
         param1["observe_parent_input_events"] = const_1029;
         param1["optimize_region_to_layout_size"] = const_450;
         param1["parent_window"] = const_904;
         param1["relative_horizontal_scale_center"] = const_166;
         param1["relative_horizontal_scale_fixed"] = const_114;
         param1["relative_horizontal_scale_move"] = const_320;
         param1["relative_horizontal_scale_strech"] = const_280;
         param1["relative_scale_center"] = const_976;
         param1["relative_scale_fixed"] = const_650;
         param1["relative_scale_move"] = const_856;
         param1["relative_scale_strech"] = const_1036;
         param1["relative_vertical_scale_center"] = const_183;
         param1["relative_vertical_scale_fixed"] = const_125;
         param1["relative_vertical_scale_move"] = const_329;
         param1["relative_vertical_scale_strech"] = const_259;
         param1["on_resize_align_left"] = const_619;
         param1["on_resize_align_right"] = const_504;
         param1["on_resize_align_center"] = const_398;
         param1["on_resize_align_top"] = const_633;
         param1["on_resize_align_bottom"] = const_472;
         param1["on_resize_align_middle"] = const_381;
         param1["on_accommodate_align_left"] = const_932;
         param1["on_accommodate_align_right"] = const_446;
         param1["on_accommodate_align_center"] = const_693;
         param1["on_accommodate_align_top"] = const_866;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_629;
         param1["route_input_events_to_parent"] = const_396;
         param1["use_parent_graphic_context"] = const_36;
         param1["draggable_with_mouse"] = const_974;
         param1["scalable_with_mouse"] = const_956;
         param1["reflect_horizontal_resize_to_parent"] = const_465;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_268;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
