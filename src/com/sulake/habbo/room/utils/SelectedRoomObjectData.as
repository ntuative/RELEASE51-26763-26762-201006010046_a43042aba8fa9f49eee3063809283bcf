package com.sulake.habbo.room.utils
{
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class SelectedRoomObjectData implements ISelectedRoomObjectData
   {
       
      
      private var var_72:Vector3d = null;
      
      private var _id:int = 0;
      
      private var var_237:Vector3d = null;
      
      private var var_1682:int = 0;
      
      private var var_1757:String = null;
      
      private var _category:int = 0;
      
      private var var_1758:String = "";
      
      public function SelectedRoomObjectData(param1:int, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:int = 0, param7:String = null)
      {
         super();
         _id = param1;
         _category = param2;
         var_1758 = param3;
         var_72 = new Vector3d();
         var_72.assign(param4);
         var_237 = new Vector3d();
         var_237.assign(param5);
         var_1682 = param6;
         var_1757 = param7;
      }
      
      public function get loc() : Vector3d
      {
         return var_72;
      }
      
      public function get typeId() : int
      {
         return var_1682;
      }
      
      public function get dir() : Vector3d
      {
         return var_237;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get instanceData() : String
      {
         return var_1757;
      }
      
      public function get operation() : String
      {
         return var_1758;
      }
      
      public function dispose() : void
      {
         var_72 = null;
         var_237 = null;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
