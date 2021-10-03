package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1617:int = 5;
      
      public static const const_1577:int = 113;
      
      public static const const_1538:int = 29;
      
      public static const const_1680:int = 0;
      
      public static const const_1555:int = 102;
      
      public static const const_1658:int = 25;
      
      public static const const_1691:int = 20;
      
      public static const const_1601:int = 116;
      
      public static const const_1552:int = 114;
      
      public static const const_1503:int = 101;
      
      public static const const_1709:int = 108;
      
      public static const const_1562:int = 112;
      
      public static const const_1502:int = 100;
      
      public static const const_1622:int = 24;
      
      public static const const_1278:int = 10;
      
      public static const const_1551:int = 111;
      
      public static const const_1540:int = 23;
      
      public static const const_1616:int = 26;
      
      public static const const_1364:int = 2;
      
      public static const const_1665:int = 22;
      
      public static const const_1591:int = 17;
      
      public static const const_1553:int = 18;
      
      public static const const_1592:int = 3;
      
      public static const const_1528:int = 109;
      
      public static const const_1434:int = 1;
      
      public static const const_1566:int = 103;
      
      public static const const_1643:int = 11;
      
      public static const const_1532:int = 28;
      
      public static const const_1567:int = 104;
      
      public static const const_1652:int = 13;
      
      public static const const_1583:int = 107;
      
      public static const const_1600:int = 27;
      
      public static const const_1581:int = 118;
      
      public static const const_1645:int = 115;
      
      public static const const_1628:int = 16;
      
      public static const const_1666:int = 19;
      
      public static const const_1679:int = 4;
      
      public static const const_1514:int = 105;
      
      public static const const_1580:int = 117;
      
      public static const const_1511:int = 119;
      
      public static const const_1659:int = 106;
      
      public static const const_1650:int = 12;
      
      public static const const_1558:int = 110;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_7 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(reason)
         {
            case const_1434:
            case const_1278:
               return "banned";
            case const_1364:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
