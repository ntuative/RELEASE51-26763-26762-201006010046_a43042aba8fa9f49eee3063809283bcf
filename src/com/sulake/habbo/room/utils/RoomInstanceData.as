package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_811:LegacyWallGeometry = null;
      
      private var var_578:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_577:TileHeightMap = null;
      
      private var var_1776:String = null;
      
      private var _roomId:int = 0;
      
      private var var_576:SelectedRoomObjectData = null;
      
      private var var_812:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_811 = new LegacyWallGeometry();
         var_812 = new RoomCamera();
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_578 != null)
         {
            var_578.dispose();
         }
         var_578 = param1;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_577 != null)
         {
            var_577.dispose();
         }
         var_577 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_1776 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_811;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return var_576;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_812;
      }
      
      public function dispose() : void
      {
         if(var_577 != null)
         {
            var_577.dispose();
            var_577 = null;
         }
         if(var_811 != null)
         {
            var_811.dispose();
            var_811 = null;
         }
         if(var_812 != null)
         {
            var_812.dispose();
            var_812 = null;
         }
         if(var_578 != null)
         {
            var_578.dispose();
            var_578 = null;
         }
         if(var_576 != null)
         {
            var_576.dispose();
            var_576 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_577;
      }
      
      public function get worldType() : String
      {
         return var_1776;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_576 != null)
         {
            var_576.dispose();
         }
         var_576 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_578;
      }
   }
}
