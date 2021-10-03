package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_559:String = "RWUAM_RESPECT_USER";
      
      public static const const_679:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_751:String = "RWUAM_START_TRADING";
      
      public static const const_719:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_727:String = "RWUAM_WHISPER_USER";
      
      public static const const_632:String = "RWUAM_IGNORE_USER";
      
      public static const const_374:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_637:String = "RWUAM_BAN_USER";
      
      public static const const_601:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_371:String = "RWUAM_KICK_USER";
      
      public static const const_718:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_740:String = " RWUAM_RESPECT_PET";
      
      public static const const_458:String = "RWUAM_KICK_BOT";
      
      public static const const_1173:String = "RWUAM_TRAIN_PET";
      
      public static const const_612:String = "RWUAM_PICKUP_PET";
      
      public static const const_589:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_536:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
