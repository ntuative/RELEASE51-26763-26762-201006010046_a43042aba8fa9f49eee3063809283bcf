package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_400:uint;
      
      private var var_1001:IUnknown;
      
      private var var_1166:String;
      
      private var var_1002:IID;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_1002 = param1;
         var_1166 = getQualifiedClassName(var_1002);
         var_1001 = param2;
         var_400 = 0;
      }
      
      public function get iid() : IID
      {
         return var_1002;
      }
      
      public function get disposed() : Boolean
      {
         return var_1001 == null;
      }
      
      public function get references() : uint
      {
         return var_400;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_400) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1001;
      }
      
      public function get iis() : String
      {
         return var_1166;
      }
      
      public function reserve() : uint
      {
         return ++var_400;
      }
      
      public function dispose() : void
      {
         var_1002 = null;
         var_1166 = null;
         var_1001 = null;
         var_400 = 0;
      }
   }
}
