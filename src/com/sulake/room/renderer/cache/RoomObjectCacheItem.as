package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_595:RoomObjectLocationCacheItem = null;
      
      private var var_178:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         var_595 = new RoomObjectLocationCacheItem(param1);
         var_178 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return var_595;
      }
      
      public function dispose() : void
      {
         if(var_595 != null)
         {
            var_595.dispose();
            var_595 = null;
         }
         if(var_178 != null)
         {
            var_178.dispose();
            var_178 = null;
         }
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return var_178;
      }
   }
}
