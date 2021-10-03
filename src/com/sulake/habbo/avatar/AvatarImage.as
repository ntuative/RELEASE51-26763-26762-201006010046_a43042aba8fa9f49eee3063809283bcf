package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.avatar.actions.ActionDefinition;
   import com.sulake.habbo.avatar.actions.ActiveActionData;
   import com.sulake.habbo.avatar.actions.IActiveActionData;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.animation.Animation;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.IAvatarDataContainer;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.cache.AvatarImageBodyPartCache;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarDirectionAngle;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.enum.AvatarType;
   import com.sulake.habbo.avatar.pets.IPetData;
   import com.sulake.habbo.avatar.structure.AvatarCanvas;
   import com.sulake.habbo.avatar.structure.IFigureData;
   import com.sulake.habbo.avatar.structure.figure.FigurePart;
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class AvatarImage implements IAvatarImage, IDisposable
   {
      
      private static const CHANNELS_UNIQUE:String = "CHANNELS_UNIQUE";
      
      private static const CHANNELS_EQUAL:String = "CHANNELS_EQUAL";
      
      private static const CHANNELS_SATURATED:String = "CHANNELS_SATURATED";
      
      private static const CHANNELS_BLUE:String = "CHANNELS_BLUE";
      
      private static const CHANNELS_RED:String = "CHANNELS_RED";
      
      private static const CHANNELS_GREEN:String = "CHANNELS_GREEN";
      
      private static const const_1131:int = 2;
      
      private static const const_1133:String = AvatarSetType.const_41;
      
      private static const const_1132:String = "Default";
       
      
      private var var_1321:int = 0;
      
      private var var_313:AvatarFigureContainer;
      
      private var var_1319:Array;
      
      protected var _isDisposed:Boolean;
      
      private var var_178:Array;
      
      private var var_909:Boolean = false;
      
      private var var_2071:String;
      
      protected var var_148:String;
      
      private var var_2417:int;
      
      private var _image:BitmapData;
      
      private var var_1318:int;
      
      private var var_140:AvatarImageCache;
      
      private var var_434:Boolean;
      
      private var var_433:Boolean;
      
      private var _assets:AssetAliasCollection;
      
      private var var_521:IAvatarDataContainer;
      
      private var var_494:int = 0;
      
      private var var_2416:int;
      
      private var var_1320:int = 0;
      
      private var var_1092:int;
      
      private var var_239:Array;
      
      protected var var_82:int;
      
      private var var_907:String;
      
      private var var_626:Array;
      
      private var var_775:String;
      
      private var var_908:IActiveActionData;
      
      protected var var_247:IActiveActionData;
      
      protected var var_52:AvatarStructure;
      
      public function AvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:String, param4:String, param5:String, param6:String = null)
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:int = 0;
         var_239 = [];
         var_626 = new Array();
         super();
         var_434 = true;
         var_52 = param1;
         _assets = param2;
         var_148 = param4;
         var_775 = param5;
         if(var_148 == null)
         {
            var_148 = AvatarScaleType.const_56;
         }
         if(param3 == null || param3 == "")
         {
            if(param5 == "user")
            {
               param3 = "hr-893-45.hd-180-2.ch-210-66.lg-270-82.sh-300-91.wa-2007-.ri-1-";
               Logger.log("Using default avatar figure");
            }
            else
            {
               param3 = "phd-1-5.pbd-1-5.ptl-1-5";
               Logger.log("Using default pet figure");
            }
         }
         var_313 = new AvatarFigureContainer(param3);
         if(param6)
         {
            _loc7_ = var_52.getMandatorySetTypeIds();
            if(_loc7_)
            {
               _loc8_ = var_52.figureData;
               for each(_loc9_ in _loc7_)
               {
                  if(!var_313.hasPartType(_loc9_))
                  {
                     _loc10_ = var_52.getDefaultPartSet(_loc9_,param6);
                     if(_loc10_)
                     {
                        var_313.updatePart(_loc9_,_loc10_.id,[0]);
                     }
                  }
                  else
                  {
                     _loc11_ = _loc8_.getSetType(_loc9_);
                     _loc12_ = _loc11_.getPartSet(var_313.getPartSetId(_loc9_));
                     if(!_loc12_)
                     {
                        _loc13_ = var_52.getDefaultPartSet(_loc9_,param6);
                        var_313.updatePart(_loc9_,_loc13_.id,[0]);
                     }
                  }
               }
            }
         }
         if(param5 == AvatarType.PET)
         {
            _loc14_ = var_313.getPartSetId("pbd");
            solvePetAvatarTypeAndBreed(_loc14_);
            var_1321 = var_1092;
         }
         var_140 = new AvatarImageCache(var_52,this,_assets,var_148);
         setDirection(const_1133,const_1131);
         var_239 = new Array();
         var_908 = new ActiveActionData(AvatarAction.const_891);
         var_908.definition = var_52.getActionDefinition(const_1132);
         resetActions();
      }
      
      private function logThis(param1:String) : void
      {
      }
      
      public function getCanvasOffsets() : Array
      {
         return var_626;
      }
      
      public function getSprites() : Array
      {
         return var_178;
      }
      
      public function dispose() : void
      {
         if(!_isDisposed)
         {
            var_52 = null;
            _assets = null;
            var_140 = null;
            var_247 = null;
            var_313 = null;
            var_521 = null;
            var_239 = null;
            if(_image)
            {
               _image.dispose();
            }
            _image = null;
            var_626 = null;
            _isDisposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function setDirection(param1:String, param2:int) : void
      {
         var _loc3_:* = null;
         param2 += var_1320;
         if(param2 < AvatarDirectionAngle.const_1402)
         {
            param2 = AvatarDirectionAngle.const_672 + (param2 + 1);
         }
         if(param2 > AvatarDirectionAngle.const_672)
         {
            param2 -= NaN;
         }
         if(var_775 == AvatarType.PET && param1 == AvatarSetType.const_48)
         {
            if((var_82 == 6 || var_82 == 0) && param2 == 7)
            {
               param2 = var_82;
            }
            _loc3_ = var_52.renderManager.petDataManager.getPetData(var_1321);
            if(_loc3_ != null)
            {
               if(_loc3_.disableHeadTurn)
               {
                  param2 = var_82;
               }
            }
         }
         if(var_52.isMainAvatarSet(param1))
         {
            var_82 = param2;
         }
         getCache().setDirection(param1,param2);
         var_434 = true;
      }
      
      public function getAsset(param1:String) : BitmapDataAsset
      {
         return _assets.getAssetByName(param1) as BitmapDataAsset;
      }
      
      public function get avatarSpriteData() : IAvatarDataContainer
      {
         return var_521;
      }
      
      public function initActionAppends() : void
      {
         var_239 = new Array();
         var_909 = false;
         var_907 = "";
      }
      
      public function isAnimating() : Boolean
      {
         return var_433;
      }
      
      public function endActionAppends() : void
      {
         sortActions();
         resetActions();
         setActionsToParts();
      }
      
      private function setActionsToParts() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in var_1319)
         {
            if(!(!_loc1_ || !_loc1_.definition))
            {
               if(_loc1_.definition.isAnimation && _loc1_.actionParameter == "")
               {
                  _loc1_.actionParameter = "1";
               }
               setActionToParts(_loc1_);
               if(_loc1_.definition.isAnimation)
               {
                  var_433 = true;
                  _loc2_ = var_52.getAnimation(_loc1_.definition.state + "." + _loc1_.actionParameter);
                  if(_loc2_ != null)
                  {
                     var_178 = var_178.concat(_loc2_.spriteData);
                     if(_loc2_.hasDirectionData())
                     {
                        var_1320 = _loc2_.directionData.offset;
                     }
                     if(_loc2_.hasAvatarData())
                     {
                        var_521 = _loc2_.avatarData;
                     }
                  }
               }
               if(_loc1_.actionType == AvatarAction.const_653)
               {
                  var_433 = true;
               }
               if(_loc1_.actionType == AvatarAction.const_404)
               {
                  var_433 = true;
               }
               if(_loc1_.actionType == AvatarAction.const_477)
               {
                  var_433 = true;
               }
            }
         }
      }
      
      public function getSubType() : int
      {
         return var_1321;
      }
      
      private function sortActions() : void
      {
         var_909 = true;
         if(var_2071 == var_907)
         {
            return;
         }
         var_2071 = var_907;
         var_1319 = var_52.sortActions(var_239);
         if(var_1319 == null)
         {
            var_626 = new Array(0,0,0);
         }
         else
         {
            var_626 = var_52.getCanvasOffsets(var_1319,var_148,var_82);
         }
      }
      
      private function addActionData(param1:String, param2:String = "") : void
      {
         var _loc3_:* = null;
         if(var_239 == null)
         {
            var_239 = new Array();
         }
         var _loc4_:int = 0;
         while(_loc4_ < var_239.length)
         {
            _loc3_ = var_239[_loc4_];
            if(_loc3_.actionType == param1 && _loc3_.actionParameter == param2)
            {
               return;
            }
            _loc4_++;
         }
         var_239.push(new ActiveActionData(param1,param2));
      }
      
      public function getPartColor(param1:String) : IPartColor
      {
         return var_52.getPartColor(var_313,param1);
      }
      
      public function getCroppedImage(param1:String) : BitmapData
      {
         var _loc6_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc19_:* = null;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:* = null;
         if(var_247 == null)
         {
            return null;
         }
         var _loc2_:AvatarImageCache = getCache();
         var _loc3_:AvatarCanvas = var_52.getCanvas(var_148,var_247.definition.geometryType);
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc4_:BitmapData = new BitmapData(_loc3_.width,_loc3_.height,true,16777215);
         var _loc5_:Array = var_52.getBodyParts(param1,var_247.definition,var_82);
         var _loc7_:int = _loc5_.length - 1;
         while(_loc7_ >= 0)
         {
            _loc9_ = _loc5_[_loc7_];
            _loc10_ = _loc2_.getImageContainer(_loc9_,var_494);
            if(_loc10_ != null)
            {
               _loc11_ = _loc10_.image;
               if(_loc11_ == null)
               {
                  _loc4_.dispose();
                  return null;
               }
               _loc12_ = _loc10_.regPoint.clone();
               if(var_775 == AvatarType.PET)
               {
                  _loc14_ = getCache().getBodyPartCache(_loc9_);
                  _loc15_ = _loc14_.getAction();
                  _loc16_ = _loc15_.definition.assetPartDefinition;
                  _loc17_ = var_52.getParts(_loc9_,var_313,_loc15_,"pet",_loc14_.getDirection(),[]);
                  _loc18_ = 32;
                  if(var_148 == AvatarScaleType.SMALL)
                  {
                     _loc18_ = 6;
                  }
                  if(_loc17_.length > 0)
                  {
                     _loc19_ = _loc17_[0];
                     _loc20_ = _loc19_.getFrameIndex(var_494);
                     _loc21_ = var_82;
                     _loc22_ = 1;
                     switch(var_82)
                     {
                        case 4:
                           _loc21_ = 2;
                           _loc22_ = -1;
                           break;
                        case 5:
                           _loc21_ = 1;
                           _loc22_ = -1;
                           break;
                        case 6:
                           _loc21_ = 0;
                           _loc22_ = -1;
                     }
                     _loc23_ = var_52.getPartActionOffset(getSubType(),var_148,_loc9_,_loc16_,_loc20_,_loc21_);
                     if(_loc23_ != null)
                     {
                        _loc12_.x += _loc23_.x * _loc22_;
                        _loc12_.y += _loc23_.y;
                        if(var_82 == 7 && _loc14_.getDirection() == 6)
                        {
                           _loc12_.offset(-1 * _loc18_,0);
                        }
                        else if(var_82 == 4 && _loc14_.getDirection() == 3)
                        {
                           _loc12_.offset(_loc18_,0);
                        }
                        else if(var_82 == 3 && _loc14_.getDirection() == 4)
                        {
                           _loc12_.offset(-1 * _loc18_,0);
                        }
                        else if(var_82 == 6 && _loc14_.getDirection() == 7)
                        {
                           _loc12_.offset(_loc18_,0);
                        }
                     }
                  }
               }
               _loc4_.copyPixels(_loc11_,_loc11_.rect,_loc12_,null,null,true);
               _loc13_ = new Rectangle(_loc12_.x,_loc12_.y,_loc11_.width,_loc11_.height);
               if(_loc6_ == null)
               {
                  _loc6_ = _loc13_;
               }
               else
               {
                  _loc6_ = _loc6_.union(_loc13_);
               }
            }
            _loc7_--;
         }
         if(_loc6_ == null)
         {
            _loc6_ = new Rectangle(0,0,10,10);
         }
         var _loc8_:BitmapData = new BitmapData(_loc6_.width,_loc6_.height,true,16777215);
         _loc8_.copyPixels(_loc4_,_loc6_,new Point(0,0),null,null,true);
         _loc4_.dispose();
         return _loc8_;
      }
      
      public function getScale() : String
      {
         return var_148;
      }
      
      public function setDirectionAngle(param1:String, param2:int) : void
      {
         var _loc3_:int = 0;
         _loc3_ = param2 / 45;
         setDirection(param1,_loc3_);
      }
      
      public function getImage(param1:String, param2:Boolean) : BitmapData
      {
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = false;
         var _loc17_:int = 0;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:* = null;
         var _loc23_:* = null;
         if(!var_434)
         {
            return _image;
         }
         if(var_247 == null)
         {
            return null;
         }
         if(!var_909)
         {
            endActionAppends();
         }
         var _loc3_:AvatarImageCache = getCache();
         var _loc4_:AvatarCanvas = var_52.getCanvas(var_148,var_247.definition.geometryType);
         if(_image == null || _loc4_ != null && (_image.width != _loc4_.width || _image.height != _loc4_.height))
         {
            _loc4_ = var_52.getCanvas(var_148,var_247.definition.geometryType);
            if(_loc4_ == null)
            {
               return null;
            }
            _image = new BitmapData(_loc4_.width,_loc4_.height,true,16777215);
         }
         var _loc5_:Array = var_52.getBodyParts(param1,var_247.definition,var_82);
         _image.lock();
         _image.fillRect(_image.rect,16777215);
         var _loc6_:Point = _loc4_.offset;
         if(_loc6_ == null)
         {
            _loc6_ = new Point(0,0);
         }
         var _loc7_:int = _loc5_.length - 1;
         while(_loc7_ >= 0)
         {
            _loc8_ = _loc5_[_loc7_];
            _loc9_ = _loc3_.getImageContainer(_loc8_,var_494);
            if(_loc9_ && _loc9_.image && _loc9_.regPoint)
            {
               _loc10_ = _loc9_.image;
               _loc11_ = _loc9_.regPoint.clone();
               if(var_775 == AvatarType.PET)
               {
                  _loc12_ = getCache().getBodyPartCache(_loc8_);
                  _loc13_ = _loc12_.getAction();
                  _loc14_ = _loc13_.definition.assetPartDefinition;
                  _loc15_ = var_52.getParts(_loc8_,var_313,_loc13_,"pet",_loc12_.getDirection(),[]);
                  _loc16_ = var_1321 < 3;
                  _loc17_ = !!_loc16_ ? 32 : 67;
                  if(var_148 == AvatarScaleType.SMALL)
                  {
                     _loc17_ = !!_loc16_ ? 6 : 31;
                  }
                  if(_loc15_.length > 0)
                  {
                     _loc18_ = _loc15_[0];
                     _loc19_ = _loc18_.getFrameIndex(var_494);
                     _loc20_ = var_82;
                     _loc21_ = 1;
                     switch(var_82)
                     {
                        case 4:
                           _loc20_ = 2;
                           _loc21_ = -1;
                           break;
                        case 5:
                           _loc20_ = 1;
                           _loc21_ = -1;
                           break;
                        case 6:
                           _loc20_ = 0;
                           _loc21_ = -1;
                     }
                     _loc22_ = var_52.getPartActionOffset(getSubType(),var_148,_loc8_,_loc14_,_loc19_,_loc20_);
                     if(_loc22_ != null)
                     {
                        _loc11_.x += _loc22_.x * _loc21_;
                        _loc11_.y += _loc22_.y;
                        if(var_82 == 7 && _loc12_.getDirection() == 6)
                        {
                           _loc11_.offset(-1 * _loc17_,0);
                        }
                        else if(var_82 == 4 && _loc12_.getDirection() == 3)
                        {
                           _loc11_.offset(_loc17_,0);
                        }
                        else if(var_82 == 3 && _loc12_.getDirection() == 4)
                        {
                           _loc11_.offset(-1 * _loc17_,0);
                        }
                        else if(var_82 == 6 && _loc12_.getDirection() == 7)
                        {
                           _loc11_.offset(_loc17_,0);
                        }
                     }
                  }
               }
               _image.copyPixels(_loc10_,_loc10_.rect,_loc11_.add(_loc6_),null,null,true);
            }
            _loc7_--;
         }
         _image.unlock();
         var_434 = false;
         if(var_521 != null)
         {
            if(false)
            {
               _loc23_ = convertToGrayscale(_image);
               if(_image)
               {
                  _image.dispose();
               }
               _image = _loc23_;
               _image.paletteMap(_image,_image.rect,new Point(0,0),var_521.reds,[],[]);
            }
            else
            {
               _image.copyChannel(_image,_image.rect,new Point(0,0),2,8);
            }
         }
         if(_image && param2)
         {
            return _image.clone();
         }
         return _image;
      }
      
      public function get petBreed() : int
      {
         return var_1318;
      }
      
      private function resetActions() : Boolean
      {
         var_433 = false;
         var_178 = [];
         var_521 = null;
         var_1320 = 0;
         var_52.removeDynamicItems();
         var_247 = var_908;
         var_247.definition = var_908.definition;
         setActionToParts(var_908);
         getCache().resetBodyPartCache(var_908);
         return true;
      }
      
      private function solvePetAvatarTypeAndBreed(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var_1092 = 0;
         var_1318 = 0;
         var _loc2_:ISetType = var_52.figureData.getSetType("pbd");
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.getPartSet(param1);
            if(_loc3_ != null)
            {
               for each(_loc4_ in _loc3_.parts)
               {
                  if(_loc4_.type == "pbd")
                  {
                     var_1092 = _loc4_.id;
                     var_1318 = _loc4_.breed;
                     break;
                  }
               }
            }
         }
      }
      
      public function updateAnimationByFrames(param1:int = 1) : void
      {
         var_494 += param1;
         var_434 = true;
      }
      
      private function errorThis(param1:String) : void
      {
         Logger.log("[AvatarImageError] " + param1);
      }
      
      private function getCache() : AvatarImageCache
      {
         if(var_140 == null)
         {
            var_140 = new AvatarImageCache(var_52,this,_assets,var_148);
         }
         return var_140;
      }
      
      private function setActionToParts(param1:IActiveActionData) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.definition.assetPartDefinition == "")
         {
            return;
         }
         if(param1.definition.isMain)
         {
            var_247 = param1;
            getCache().setGeometryType(param1.definition.geometryType);
         }
         getCache().setAction(param1);
         var_434 = true;
      }
      
      private function convertToGrayscale(param1:BitmapData, param2:String = "CHANNELS_EQUAL") : BitmapData
      {
         var _loc3_:* = 0.33;
         var _loc4_:* = 0.33;
         var _loc5_:* = 0.33;
         switch(param2)
         {
            case "CHANNELS_UNIQUE":
               _loc3_ = 0.3;
               _loc4_ = 0.59;
               _loc5_ = 0.11;
               break;
            case "CHANNELS_RED":
               _loc3_ = 1;
               _loc4_ = 0;
               _loc5_ = 0;
               break;
            case "CHANNELS_GREEN":
               _loc3_ = 0;
               _loc4_ = 1;
               _loc5_ = 0;
               break;
            case "CHANNELS_BLUE":
               _loc3_ = 0;
               _loc4_ = 0;
               _loc5_ = 1;
               break;
            case "CHANNELS_DESATURATED":
               _loc3_ = 0.3086;
               _loc4_ = 0.6094;
               _loc5_ = 0.082;
         }
         var _loc7_:Array = [_loc3_,_loc4_,_loc5_,0,0,_loc3_,_loc4_,_loc5_,0,0,_loc3_,_loc4_,_loc5_,0,0,0,0,0,1,0];
         var _loc8_:ColorMatrixFilter = new ColorMatrixFilter(_loc7_);
         var _loc9_:BitmapData = new BitmapData(param1.width,param1.height,param1.transparent,4294967295);
         _loc9_.copyPixels(param1,param1.rect,new Point(0,0),null,null,false);
         _loc9_.applyFilter(_loc9_,_loc9_.rect,new Point(0,0),_loc8_);
         return _loc9_;
      }
      
      public function getFigure() : AvatarFigureContainer
      {
         return var_313;
      }
      
      public function getDirection() : int
      {
         return var_82;
      }
      
      public function getLayerData(param1:ISpriteDataContainer) : IAnimationLayerData
      {
         return var_52.getBodyPartData(param1.animation.id,var_494,param1.id);
      }
      
      public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var_909 = false;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         var_907 = var_907 + param1 + _loc3_;
         switch(param1)
         {
            case AvatarAction.const_567:
               switch(_loc3_)
               {
                  case "wav":
                     addActionData("wave");
                     break;
                  case AvatarAction.const_1299:
                     if(var_775 == AvatarType.const_87)
                     {
                        if(var_82 == 0)
                        {
                           setDirection(AvatarSetType.const_41,4);
                        }
                        else
                        {
                           setDirection(AvatarSetType.const_41,2);
                        }
                     }
                  case AvatarAction.const_962:
                  case AvatarAction.const_653:
                  case AvatarAction.const_844:
                  case AvatarAction.const_1308:
                  case AvatarAction.const_891:
                  case AvatarAction.const_900:
                  case AvatarAction.const_1040:
                  case AvatarAction.const_1235:
                  case AvatarAction.const_1171:
                  case AvatarAction.const_1254:
                  case AvatarAction.const_910:
                  case AvatarAction.const_926:
                  case AvatarAction.const_1333:
                  case AvatarAction.const_1226:
                  case AvatarAction.const_818:
                  case AvatarAction.const_890:
                     addActionData(_loc3_);
                     break;
                  default:
                     errorThis("appendAction() >> UNKNOWN POSTURE TYPE: " + _loc3_);
               }
               break;
            case AvatarAction.const_321:
               switch(_loc3_)
               {
                  case AvatarAction.const_920:
                  case AvatarAction.const_893:
                  case AvatarAction.const_689:
                  case AvatarAction.const_921:
                  case AvatarAction.const_538:
                  case AvatarAction.const_1010:
                  case AvatarAction.const_883:
                  case AvatarAction.const_1047:
                  case AvatarAction.const_967:
                  case AvatarAction.const_1018:
                     addActionData(_loc3_);
                     break;
                  default:
                     errorThis("appendAction() >> UNKNOWN GESTURE TYPE: " + _loc3_);
               }
               break;
            case AvatarAction.const_477:
            case AvatarAction.const_404:
            case AvatarAction.const_1028:
            case AvatarAction.const_709:
            case AvatarAction.const_540:
            case AvatarAction.const_1037:
               addActionData(param1,_loc3_);
               break;
            case AvatarAction.const_927:
            case AvatarAction.const_990:
               _loc4_ = var_52.getActionDefinitionWithState(param1);
               if(_loc4_ != null)
               {
                  logThis("appendAction:" + [_loc3_,"->",_loc4_.getParameterValue(_loc3_)]);
                  _loc3_ = _loc4_.getParameterValue(_loc3_);
               }
               addActionData(param1,_loc3_);
               break;
            default:
               errorThis("appendAction() >> UNKNOWN ACTION TYPE: " + param1);
         }
         return true;
      }
      
      public function get petType() : int
      {
         return var_1092;
      }
   }
}
