package com.sulake.core.utils
{
   import com.sulake.core.runtime.IDisposable;
   import flash.utils.Dictionary;
   import flash.utils.Proxy;
   import flash.utils.flash_proxy;
   
   public class Map extends Proxy implements IDisposable
   {
       
      
      private var _length:uint;
      
      private var var_242:Array;
      
      private var var_32:Array;
      
      private var var_144:Dictionary;
      
      public function Map()
      {
         super();
         _length = 0;
         var_144 = new Dictionary();
         var_32 = [];
         var_242 = [];
      }
      
      public function remove(param1:*) : *
      {
         var _loc2_:Object = var_144[param1];
         if(_loc2_ == null)
         {
            return null;
         }
         var _loc3_:int = var_32.indexOf(_loc2_);
         if(_loc3_ >= 0)
         {
            var_32.splice(_loc3_,1);
            var_242.splice(_loc3_,1);
            --_length;
         }
         delete var_144[param1];
         return _loc2_;
      }
      
      public function unshift(param1:*, param2:*) : Boolean
      {
         if(false)
         {
            return false;
         }
         var_144[param1] = param2;
         var_32.unshift(param2);
         var_242.unshift(param1);
         ++_length;
         return true;
      }
      
      override flash_proxy function getProperty(param1:*) : *
      {
         if(param1 is QName)
         {
            param1 = QName(param1).localName;
         }
         return var_144[param1];
      }
      
      public function reset() : void
      {
         var _loc1_:* = null;
         for(_loc1_ in var_144)
         {
            delete var_144[_loc1_];
         }
         _length = 0;
         var_32 = [];
         var_242 = [];
      }
      
      override flash_proxy function nextNameIndex(param1:int) : int
      {
         if(param1 < var_242.length)
         {
            return param1 + 1;
         }
         return 0;
      }
      
      override flash_proxy function setProperty(param1:*, param2:*) : void
      {
         if(param1 is QName)
         {
            param1 = QName(param1).localName;
         }
         var_144[param1] = param2;
         var _loc3_:int = var_242.indexOf(param1);
         if(_loc3_ == -1)
         {
            var_32[_length] = param2;
            var_242[_length] = param1;
            ++_length;
         }
         else
         {
            var_32.splice(_loc3_,1,param2);
         }
      }
      
      public function getValues() : Array
      {
         return var_32.slice();
      }
      
      override flash_proxy function nextName(param1:int) : String
      {
         return var_242[param1 - 1];
      }
      
      public function add(param1:*, param2:*) : Boolean
      {
         if(false)
         {
            return false;
         }
         var_144[param1] = param2;
         var_32[_length] = param2;
         var_242[_length] = param1;
         ++_length;
         return true;
      }
      
      override flash_proxy function callProperty(param1:*, ... rest) : *
      {
         var _loc3_:* = null;
         if(param1.localName == "toString")
         {
            return "Map";
         }
         return null;
      }
      
      public function get disposed() : Boolean
      {
         return var_144 == null;
      }
      
      public function get length() : uint
      {
         return _length;
      }
      
      public function getKey(param1:int) : *
      {
         if(param1 < 0 || param1 >= _length)
         {
            return null;
         }
         return var_242[param1];
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(var_144 != null)
         {
            for(_loc1_ in var_144)
            {
               delete var_144[_loc1_];
            }
            var_144 = null;
         }
         _length = 0;
         var_32 = null;
         var_242 = null;
      }
      
      public function getKeys() : Array
      {
         return var_242.slice();
      }
      
      public function getWithIndex(param1:int) : *
      {
         if(param1 < 0 || param1 >= _length)
         {
            return null;
         }
         return var_32[param1];
      }
      
      public function getValue(param1:*) : *
      {
         return var_144[param1];
      }
      
      override flash_proxy function nextValue(param1:int) : *
      {
         return var_32[param1 - 1];
      }
   }
}
