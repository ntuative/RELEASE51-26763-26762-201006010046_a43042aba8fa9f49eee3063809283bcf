package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_534:int = 6;
      
      public static const const_242:int = 5;
      
      public static const const_730:int = 2;
      
      public static const const_332:int = 9;
      
      public static const const_335:int = 4;
      
      public static const const_267:int = 2;
      
      public static const const_657:int = 4;
      
      public static const const_230:int = 8;
      
      public static const const_560:int = 7;
      
      public static const const_252:int = 3;
      
      public static const const_351:int = 1;
      
      public static const const_207:int = 5;
      
      public static const const_488:int = 12;
      
      public static const const_333:int = 1;
      
      public static const const_669:int = 11;
      
      public static const const_555:int = 3;
      
      public static const const_1629:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_399:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_399 = new Array();
         var_399.push(new Tab(_navigator,const_351,const_488,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_383));
         var_399.push(new Tab(_navigator,const_267,const_333,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_383));
         var_399.push(new Tab(_navigator,const_335,const_669,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_948));
         var_399.push(new Tab(_navigator,const_252,const_242,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_383));
         var_399.push(new Tab(_navigator,const_207,const_230,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_610));
         setSelectedTab(const_351);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_399)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_399)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_399)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_335;
      }
      
      public function get tabs() : Array
      {
         return var_399;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
