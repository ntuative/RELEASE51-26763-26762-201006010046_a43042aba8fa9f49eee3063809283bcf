package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1303:BigInteger;
      
      private var var_627:BigInteger;
      
      private var var_1545:BigInteger;
      
      private var var_1546:BigInteger;
      
      private var var_2052:BigInteger;
      
      private var var_1819:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1303 = param1;
         var_1545 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_2052.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1546 = new BigInteger();
         var_1546.fromRadix(param1,param2);
         var_2052 = var_1546.modPow(var_627,var_1303);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1819.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + var_1303.toString() + ",generator: " + var_1545.toString() + ",secret: " + param1);
         var_627 = new BigInteger();
         var_627.fromRadix(param1,param2);
         var_1819 = var_1545.modPow(var_627,var_1303);
         return true;
      }
   }
}
