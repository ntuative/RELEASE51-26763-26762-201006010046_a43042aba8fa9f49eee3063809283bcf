package com.sulake.habbo.room.object.logic.room
{
   import com.sulake.habbo.room.events.RoomObjectTileMouseEvent;
   import com.sulake.habbo.room.events.RoomObjectWallMouseEvent;
   import com.sulake.habbo.room.messages.RoomObjectRoomColorUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomMaskUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectRoomUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.RoomPlaneBitmapMaskData;
   import com.sulake.habbo.room.object.RoomPlaneBitmapMaskParser;
   import com.sulake.habbo.room.object.RoomPlaneData;
   import com.sulake.habbo.room.object.RoomPlaneParser;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.object.logic.ObjectLogicBase;
   import com.sulake.room.utils.ColorConverter;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.getTimer;
   
   public class RoomLogic extends ObjectLogicBase
   {
       
      
      private var var_1480:int = 1500;
      
      private var var_1479:int = 255;
      
      private var var_1481:int = 255;
      
      private var var_1224:uint = 16777215;
      
      private var var_1042:uint = 16777215;
      
      protected var var_78:RoomPlaneParser = null;
      
      private var var_842:int = 0;
      
      private var var_1151:int = 255;
      
      private var _color:uint = 16777215;
      
      private var var_392:RoomPlaneBitmapMaskParser = null;
      
      public function RoomLogic()
      {
         super();
         var_78 = new RoomPlaneParser();
         var_392 = new RoomPlaneBitmapMaskParser();
      }
      
      override public function update(param1:int) : void
      {
         super.update(param1);
         updateBackgroundColor(param1);
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc6_:* = null;
         var _loc7_:Boolean = false;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         if(param1 == null || object == null)
         {
            return;
         }
         var _loc2_:IRoomObjectModelController = object.getModel() as IRoomObjectModelController;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:RoomObjectRoomUpdateMessage = param1 as RoomObjectRoomUpdateMessage;
         if(_loc3_ != null)
         {
            switch(_loc3_.type)
            {
               case RoomObjectRoomUpdateMessage.const_658:
                  _loc2_.setString(RoomObjectVariableEnum.const_701,_loc3_.value);
                  break;
               case RoomObjectRoomUpdateMessage.const_725:
                  _loc2_.setString(RoomObjectVariableEnum.const_550,_loc3_.value);
                  break;
               case RoomObjectRoomUpdateMessage.const_692:
                  _loc2_.setString(RoomObjectVariableEnum.const_618,_loc3_.value);
            }
            return;
         }
         var _loc4_:RoomObjectRoomMaskUpdateMessage = param1 as RoomObjectRoomMaskUpdateMessage;
         if(_loc4_ != null)
         {
            _loc6_ = null;
            _loc7_ = false;
            switch(_loc4_.type)
            {
               case RoomObjectRoomMaskUpdateMessage.const_442:
                  _loc8_ = "null";
                  if(_loc4_.maskCategory == RoomObjectRoomMaskUpdateMessage.const_229)
                  {
                     _loc8_ = "null";
                  }
                  var_392.addMask(_loc4_.maskId,_loc4_.maskType,_loc4_.maskLocation,_loc8_);
                  _loc7_ = true;
                  break;
               case RoomObjectRoomMaskUpdateMessage.const_527:
                  _loc7_ = var_392.removeMask(_loc4_.maskId);
            }
            if(_loc7_)
            {
               _loc9_ = var_392.getXML();
               _loc10_ = _loc9_.toXMLString();
               _loc2_.setString(RoomObjectVariableEnum.const_849,_loc10_);
            }
            return;
         }
         var _loc5_:RoomObjectRoomColorUpdateMessage = param1 as RoomObjectRoomColorUpdateMessage;
         if(_loc5_ != null)
         {
            _loc11_ = _loc5_.color;
            _loc12_ = _loc5_.light;
            _loc2_.setNumber(RoomObjectVariableEnum.const_1008,int(_loc5_.bgOnly));
            var_1224 = _color;
            var_1479 = var_1151;
            var_1042 = _loc11_;
            var_1481 = _loc12_;
            var_842 = getTimer();
            var_1480 = 1500;
         }
      }
      
      override public function initialize(param1:XML) : void
      {
         if(param1 == null || object == null)
         {
            return;
         }
         if(!var_78.initializeFromXML(param1))
         {
            return;
         }
         var _loc2_:IRoomObjectModelController = object.getModel() as IRoomObjectModelController;
         if(_loc2_ != null)
         {
            _loc2_.setString(RoomObjectVariableEnum.const_965,param1.toString(),true);
            _loc2_.setNumber(RoomObjectVariableEnum.const_674,16777215);
         }
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc26_:* = null;
         var _loc27_:* = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         if(param2 == null)
         {
            return;
         }
         var _loc3_:RoomSpriteMouseEvent = param1;
         if(_loc3_ == null)
         {
            return;
         }
         if(object == null || param1 == null)
         {
            return;
         }
         var _loc4_:IRoomObjectModelController = object.getModel() as IRoomObjectModelController;
         if(_loc4_ == null)
         {
            return;
         }
         var _loc5_:int = 0;
         var _loc6_:String = _loc3_.spriteTag;
         if(_loc6_.indexOf("@") >= 0)
         {
            _loc5_ = parseInt(_loc6_.substr(_loc6_.indexOf("@") + 1));
         }
         if(_loc5_ < 1 || _loc5_ > var_78.planeCount)
         {
            if(param1.type == MouseEvent.ROLL_OUT)
            {
               _loc4_.setNumber(RoomObjectVariableEnum.const_113,0);
            }
            return;
         }
         _loc5_--;
         var _loc7_:* = null;
         var _loc8_:IVector3d = var_78.getPlaneLocation(_loc5_);
         var _loc9_:IVector3d = var_78.getPlaneLeftSide(_loc5_);
         var _loc10_:IVector3d = var_78.getPlaneRightSide(_loc5_);
         var _loc11_:IVector3d = var_78.getPlaneNormalDirection(_loc5_);
         var _loc12_:IVector3d = var_78.getPlaneNormal(_loc5_);
         var _loc13_:int = var_78.getPlaneType(_loc5_);
         if(_loc8_ == null || _loc9_ == null || _loc10_ == null || _loc11_ == null)
         {
            return;
         }
         var _loc14_:Number = _loc9_.length;
         var _loc15_:Number = _loc10_.length;
         if(_loc14_ == 0 || _loc15_ == 0)
         {
            return;
         }
         var _loc16_:Number = _loc3_.screenX;
         var _loc17_:Number = _loc3_.screenY;
         var _loc18_:Point = new Point(_loc16_,_loc17_);
         _loc7_ = param2.getPlanePosition(_loc18_,_loc8_,_loc9_,_loc10_);
         if(_loc7_ == null)
         {
            _loc4_.setNumber(RoomObjectVariableEnum.const_113,0);
            return;
         }
         var _loc19_:Vector3d = Vector3d.sum(_loc8_,Vector3d.sum(Vector3d.product(_loc9_,_loc7_.x / _loc14_),Vector3d.product(_loc10_,_loc7_.y / _loc15_)));
         var _loc20_:Number = _loc19_.x;
         var _loc21_:Number = _loc19_.y;
         var _loc22_:Number = _loc19_.z;
         if(_loc7_.x >= 0 && _loc7_.x < _loc14_ && _loc7_.y >= 0 && _loc7_.y < _loc15_)
         {
            _loc4_.setNumber(RoomObjectVariableEnum.const_1192,_loc20_);
            _loc4_.setNumber(RoomObjectVariableEnum.const_1337,_loc21_);
            _loc4_.setNumber(RoomObjectVariableEnum.const_1219,_loc22_);
            _loc4_.setNumber(RoomObjectVariableEnum.const_113,_loc5_ + 1);
            var _loc23_:String = "";
            var _loc24_:int = 0;
            var _loc25_:* = null;
            switch(param1.type)
            {
               case MouseEvent.MOUSE_MOVE:
               case MouseEvent.ROLL_OVER:
               case MouseEvent.CLICK:
                  _loc26_ = "";
                  if(param1.type == MouseEvent.MOUSE_MOVE || param1.type == MouseEvent.ROLL_OVER)
                  {
                     _loc26_ = "null";
                  }
                  else if(param1.type == MouseEvent.CLICK)
                  {
                     _loc26_ = "null";
                  }
                  _loc24_ = object.getId();
                  _loc23_ = object.getType();
                  if(eventDispatcher != null)
                  {
                     if(_loc13_ == RoomPlaneData.const_146)
                     {
                        _loc25_ = new RoomObjectTileMouseEvent(_loc26_,_loc24_,_loc23_,_loc20_,_loc21_,_loc22_);
                     }
                     else if(_loc13_ == RoomPlaneData.const_157 || _loc13_ == RoomPlaneData.const_278)
                     {
                        _loc27_ = 90;
                        if(_loc11_ != null)
                        {
                           _loc27_ = Number(_loc11_.x + 90);
                           if(_loc27_ > 360)
                           {
                              _loc27_ -= 360;
                           }
                        }
                        _loc28_ = _loc9_.length * _loc7_.x / _loc14_;
                        _loc29_ = _loc10_.length * _loc7_.y / _loc15_;
                        _loc25_ = new RoomObjectWallMouseEvent(_loc26_,_loc24_,_loc23_,_loc8_,_loc9_,_loc10_,_loc28_,_loc29_,_loc27_);
                     }
                     if(_loc25_ != null)
                     {
                        eventDispatcher.dispatchEvent(_loc25_);
                     }
                  }
            }
            return;
         }
         _loc4_.setNumber(RoomObjectVariableEnum.const_113,0);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(var_78 != null)
         {
            var_78.dispose();
            var_78 = null;
         }
         if(var_392 != null)
         {
            var_392.dispose();
            var_392 = null;
         }
      }
      
      private function updateBackgroundColor(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc10_:* = 0;
         var _loc11_:* = 0;
         var _loc12_:* = 0;
         var _loc13_:Number = NaN;
         if(object == null)
         {
            return;
         }
         if(var_842)
         {
            _loc2_ = param1;
            _loc3_ = _color;
            _loc4_ = var_1151;
            if(_loc2_ - var_842 >= var_1480)
            {
               _loc3_ = var_1042;
               _loc4_ = var_1481;
               var_842 = 0;
            }
            else
            {
               _loc7_ = var_1224 >> 16 & 255;
               _loc8_ = var_1224 >> 8 & 255;
               _loc9_ = var_1224 & 255;
               _loc10_ = var_1042 >> 16 & 255;
               _loc11_ = var_1042 >> 8 & 255;
               _loc12_ = var_1042 & 255;
               _loc13_ = (_loc2_ - var_842) / var_1480;
               _loc7_ += (_loc10_ - _loc7_) * _loc13_;
               _loc8_ += (_loc11_ - _loc8_) * _loc13_;
               _loc9_ += (_loc12_ - _loc9_) * _loc13_;
               _loc3_ = (_loc7_ << 16) + (_loc8_ << 8) + _loc9_;
               _loc4_ = var_1479 + (var_1481 - var_1479) * _loc13_;
               _color = _loc3_;
               var_1151 = _loc4_;
            }
            _loc5_ = ColorConverter.rgbToHSL(_loc3_);
            _loc5_ = (_loc5_ & 16776960) + _loc4_;
            _loc3_ = ColorConverter.hslToRGB(_loc5_);
            _loc6_ = object.getModel() as IRoomObjectModelController;
            if(_loc6_ == null)
            {
               return;
            }
            _loc6_.setNumber(RoomObjectVariableEnum.const_674,_loc3_);
         }
      }
   }
}
