package com.sulake.habbo.room.object.visualization.pet
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.utils.getTimer;
   
   public class PetVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
       
      
      private const const_1454:int = 0;
      
      private var var_313:String;
      
      private var var_666:int = 0;
      
      private var _isDisposed:Boolean = false;
      
      private var var_341:ExperienceData;
      
      private var var_433:Boolean;
      
      private const const_1716:int = 1;
      
      private const const_771:int = 3;
      
      private var var_1181:Boolean = false;
      
      private var var_1014:int = 0;
      
      private var var_511:int = 0;
      
      private var var_510:BitmapDataAsset;
      
      private const const_1120:int = 3;
      
      private const const_1717:int = 2;
      
      private var var_734:PetVisualizationData = null;
      
      private var var_251:Map;
      
      private var var_733:Array;
      
      public function PetVisualization()
      {
         super();
         var_733 = new Array();
         var_251 = new Map();
         var_433 = false;
      }
      
      public function imageReady() : void
      {
         var_1181 = true;
         true;
      }
      
      override public function update(param1:IRoomGeometry = null, param2:int = 0) : void
      {
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:Boolean = false;
         var _loc23_:* = null;
         var _loc24_:* = false;
         var _loc25_:int = 0;
         var _loc26_:* = null;
         var _loc27_:* = null;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:* = null;
         var _loc31_:* = null;
         var _loc32_:int = 0;
         var _loc33_:int = 0;
         var _loc34_:int = 0;
         var _loc35_:int = 0;
         var _loc36_:* = null;
         var _loc37_:int = 0;
         var _loc38_:int = 0;
         var _loc39_:int = 0;
         var _loc40_:int = 0;
         var _loc41_:int = 0;
         var _loc42_:* = null;
         var _loc43_:* = null;
         var _loc44_:int = 0;
         var _loc45_:int = 0;
         var _loc46_:int = 0;
         var _loc47_:* = null;
         var _loc48_:int = 0;
         if(var_1181)
         {
            _loc14_ = getSprite(const_1454);
            if(_loc14_)
            {
               _loc14_.asset = null;
            }
            if(var_251)
            {
               for each(_loc15_ in var_251)
               {
               }
               var_251.reset();
            }
            var_1181 = false;
         }
         var _loc3_:IRoomObject = object;
         if(_loc3_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(var_734 == null)
         {
            return;
         }
         var _loc4_:IRoomObjectModel = _loc3_.getModel();
         var _loc5_:String = "avatar" + param1.scale.toString();
         var _loc6_:* = var_251.getValue(_loc5_) as IAvatarImage;
         var _loc7_:String = _loc4_.getString(RoomObjectVariableEnum.const_168);
         var _loc9_:int = _loc4_.getNumber(RoomObjectVariableEnum.const_943);
         var_341.alpha = 0;
         if(_loc9_ > 0)
         {
            _loc16_ = getTimer() - _loc9_;
            if(_loc16_ < AvatarAction.const_885)
            {
               var_341.alpha = int(Math.sin(_loc16_ / 0 * 0) * 255);
               var_341.setExperience(_loc4_.getNumber(RoomObjectVariableEnum.const_888));
               var_511 = const_1120;
            }
         }
         var _loc10_:Boolean = false;
         var _loc11_:String = _loc4_.getString(RoomObjectVariableEnum.const_265);
         switch(_loc11_)
         {
            case AvatarAction.const_844:
            case AvatarAction.const_900:
            case AvatarAction.const_1040:
            case AvatarAction.const_910:
            case AvatarAction.const_926:
            case AvatarAction.const_818:
            case AvatarAction.const_890:
            case AvatarAction.const_477:
            case AvatarAction.const_404:
               _loc10_ = true;
         }
         var _loc12_:Boolean = var_292 != _loc3_.getUpdateID() || var_214 != param1.scale || var_165 != _loc4_.getUpdateID();
         var _loc13_:Boolean = var_433 || var_511 > 0 || _loc10_;
         if(_loc12_ || _loc13_)
         {
            increaseUpdateId();
            _loc17_ = getTimer();
            var_511--;
            if(var_313 != _loc7_)
            {
               for each(var _loc51_ in var_251.getKeys())
               {
                  _loc31_ = _loc51_;
                  _loc51_;
                  var_251.remove(_loc31_);
               }
               var _loc49_:* = null;
               _loc6_ = null;
               _loc49_;
            }
            if(_loc6_ == null)
            {
               _loc6_ = var_734.getAvatar(_loc7_,param1.scale,this);
               if(_loc6_ == null)
               {
                  return;
               }
               var_251.remove(_loc5_);
               var_251.add(_loc5_,_loc6_);
               var_313 = _loc7_;
            }
            _loc18_ = _loc3_.getDirection().x - (param1.direction.x + 135 - 22.5);
            _loc49_ = (_loc18_ % 360 + 360) % 360;
            _loc18_ = (_loc18_ % 360 + 360) % 360;
            _loc49_;
            _loc6_.setDirectionAngle(AvatarSetType.const_41,_loc18_);
            _loc19_ = _loc4_.getNumber(RoomObjectVariableEnum.const_339);
            if(isNaN(_loc19_))
            {
               _loc19_ = _loc18_;
            }
            else
            {
               _loc49_ = _loc19_ - (param1.direction.x + 135 - 22.5);
               _loc19_ -= param1.direction.x + 135 - 22.5;
               _loc49_;
            }
            _loc49_ = (_loc19_ % 360 + 360) % 360;
            _loc19_ = (_loc19_ % 360 + 360) % 360;
            _loc49_;
            _loc6_.setDirectionAngle(AvatarSetType.const_48,_loc19_);
            _loc6_.initActionAppends();
            _loc20_ = _loc4_.getString(RoomObjectVariableEnum.const_265);
            _loc21_ = _loc4_.getString(RoomObjectVariableEnum.const_698);
            _loc6_.appendAction(AvatarAction.const_567,_loc20_,_loc21_);
            _loc22_ = false;
            if(_loc20_ == "lay")
            {
               _loc32_ = int(_loc21_);
               if(_loc32_ < 0)
               {
                  _loc22_ = true;
               }
            }
            _loc23_ = _loc4_.getString(RoomObjectVariableEnum.const_376);
            if(_loc23_ != null && _loc23_ != "")
            {
               _loc33_ = _loc4_.getNumber(RoomObjectVariableEnum.const_397);
               _loc34_ = 3;
               _loc35_ = param2 - _loc33_;
               if(_loc35_ < _loc34_ * 1000)
               {
                  _loc6_.appendAction(AvatarAction.const_321,_loc23_);
               }
            }
            _loc24_ = _loc4_.getNumber(RoomObjectVariableEnum.const_391) > 0;
            if(_loc24_)
            {
               _loc6_.appendAction(AvatarAction.const_540);
            }
            _loc6_.endActionAppends();
            var_666++;
            var_1014++;
            if(var_1014 > 1)
            {
               _loc6_.updateAnimationByFrames(1);
               var_1014 = 0;
            }
            var_433 = _loc6_.isAnimating();
            _loc25_ = _loc6_.getSprites().length + const_771;
            if(_loc25_ != spriteCount)
            {
               createSprites(_loc25_);
            }
            _loc27_ = _loc6_.getCanvasOffsets();
            if(_loc27_ == null || _loc27_.length < 3)
            {
               _loc27_ = new Array(0,0,0);
            }
            _loc28_ = 0;
            if(object.getLocation().z > 0)
            {
               _loc28_ = Math.min(param1.scale / 2.75,0);
            }
            _loc26_ = getSprite(const_1454);
            if(_loc26_ && _loc6_)
            {
               _loc26_.asset = _loc6_.getImage(AvatarSetType.const_41,false);
               _loc49_ = -1 * param1.scale / 2 + _loc27_[0];
               _loc26_.offsetX = -1 * param1.scale / 2 + _loc27_[0];
               _loc49_;
               _loc49_ = -_loc26_.asset.height + param1.scale / 4 + _loc27_[1] + _loc28_;
               _loc26_.offsetY = -_loc26_.asset.height + param1.scale / 4 + _loc27_[1] + _loc28_;
               _loc49_;
            }
            _loc29_ = const_771;
            for each(_loc51_ in _loc6_.getSprites())
            {
               _loc30_ = _loc51_;
               _loc51_;
               _loc26_ = getSprite(_loc29_);
               if(_loc26_ != null)
               {
                  _loc36_ = _loc6_.getLayerData(_loc30_);
                  _loc37_ = 0;
                  _loc38_ = _loc30_.getDirectionOffsetX(_loc6_.getDirection());
                  _loc39_ = _loc30_.getDirectionOffsetY(_loc6_.getDirection());
                  _loc40_ = _loc30_.getDirectionOffsetZ(_loc6_.getDirection());
                  _loc41_ = 0;
                  if(_loc30_.hasDirections)
                  {
                     _loc41_ = _loc6_.getDirection();
                  }
                  if(_loc36_ != null)
                  {
                     _loc37_ = _loc36_.animationFrame;
                     _loc51_ = _loc38_ + _loc36_.dx;
                     _loc38_ += _loc36_.dx;
                     _loc51_;
                     _loc51_ = _loc39_ + _loc36_.dy;
                     _loc39_ += _loc36_.dy;
                     _loc51_;
                     _loc51_ = _loc41_ + _loc36_.directionOffset;
                     _loc41_ += _loc36_.directionOffset;
                     _loc51_;
                  }
                  if(param1.scale < 48)
                  {
                     _loc51_ = _loc38_ / 2;
                     _loc38_ /= 2;
                     _loc51_;
                     _loc51_ = _loc39_ / 2;
                     _loc39_ /= 2;
                     _loc51_;
                  }
                  if(_loc41_ < 0)
                  {
                     _loc51_ = _loc41_ + 8;
                     _loc41_ += 8;
                     _loc51_;
                  }
                  if(_loc41_ > 7)
                  {
                     _loc51_ = _loc41_ - 8;
                     _loc41_ -= 8;
                     _loc51_;
                  }
                  _loc42_ = _loc6_.getScale() + "_" + _loc30_.member + "_" + _loc41_ + "_" + _loc37_;
                  _loc43_ = _loc6_.getAsset(_loc42_);
                  if(_loc43_ != null)
                  {
                     _loc51_ = _loc43_.content as BitmapData;
                     _loc26_.asset = _loc43_.content as BitmapData;
                     _loc51_;
                     _loc51_ = -1 * _loc43_.offset.x - param1.scale / 2 + _loc38_;
                     _loc26_.offsetX = -1 * _loc43_.offset.x - param1.scale / 2 + _loc38_;
                     _loc51_;
                     _loc51_ = -1 * _loc43_.offset.y + _loc39_;
                     _loc26_.offsetY = -1 * _loc43_.offset.y + _loc39_;
                     _loc51_;
                     _loc51_ = -0.01 - 0.1 * _loc29_ * _loc40_;
                     _loc26_.relativeDepth = -0.01 - 0.1 * _loc29_ * _loc40_;
                     _loc51_;
                     if(_loc30_.ink == 33)
                     {
                        _loc26_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc26_.blendMode = BlendMode.NORMAL;
                     }
                     _loc29_++;
                  }
               }
            }
            _loc49_ = null;
            var_510 = null;
            _loc49_;
            if(_loc20_ == "mv" || _loc20_ == "std")
            {
               _loc49_ = _loc6_.getSprites().length + const_771;
               _loc25_ = _loc6_.getSprites().length + const_771;
               _loc49_;
               if(_loc25_ != spriteCount)
               {
                  createSprites(_loc25_);
               }
               _loc26_ = getSprite(const_1716);
               _loc44_ = 0;
               _loc45_ = 0;
               switch(param1.scale)
               {
                  case 32:
                     var_510 = _loc6_.getAsset("sh_std_sd_1_0_0");
                     _loc44_ = -8;
                     _loc45_ = -3;
                     break;
                  case 64:
                     var_510 = _loc6_.getAsset("h_std_sd_1_0_0");
                     _loc44_ = -17;
                     _loc45_ = -7;
               }
               if(var_510)
               {
                  _loc49_ = var_510.content as BitmapData;
                  _loc26_.asset = var_510.content as BitmapData;
                  _loc49_;
                  _loc26_.offsetX = _loc44_;
                  _loc26_.offsetY = _loc45_;
                  _loc26_.alpha = 50;
                  _loc26_.relativeDepth = 1;
               }
            }
            _loc26_ = getSprite(const_1717);
            if(false)
            {
               _loc26_.asset = var_341.image;
               _loc26_.offsetX = -20;
               _loc26_.offsetY = -80;
               _loc26_.alpha = var_341.alpha;
               _loc26_.visible = true;
            }
            else
            {
               _loc26_.visible = false;
            }
            var_292 = _loc3_.getUpdateID();
            var_165 = _loc4_.getUpdateID();
            var_214 = param1.scale;
            var_733.push(getTimer() - _loc17_);
            if(false)
            {
               _loc46_ = 0;
               _loc47_ = "[";
               for each(_loc51_ in var_733)
               {
                  _loc48_ = _loc51_;
                  _loc51_;
                  _loc51_ = _loc46_ + _loc48_;
                  _loc46_ += _loc48_;
                  _loc51_;
                  _loc51_ = _loc47_ + ("," + _loc48_);
                  _loc47_ += "," + _loc48_;
                  _loc51_;
               }
               _loc49_ = _loc47_ + "]";
               _loc47_ += "]";
               _loc49_;
               var_733 = new Array();
            }
         }
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         var_734 = param1 as PetVisualizationData;
         createSprites(const_771);
         var_341 = new ExperienceData(var_734);
         return true;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.dispose();
         if(var_251 != null)
         {
            _loc1_ = var_251.getKeys();
            for each(_loc2_ in _loc1_)
            {
               _loc3_ = var_251.getValue(_loc2_) as IAvatarImage;
            }
         }
         var_251.dispose();
         if(var_341)
         {
            var_341.dispose();
         }
         var_341 = null;
         var_734 = null;
         _isDisposed = true;
      }
   }
}
