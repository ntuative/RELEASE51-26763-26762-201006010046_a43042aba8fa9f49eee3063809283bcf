package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.structure.AvatarCanvas;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class TemporaryAvatarImage extends AvatarImage
   {
       
      
      private var _assets:IAssetLibrary;
      
      private var var_540:Map;
      
      private var _image:BitmapData;
      
      public function TemporaryAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:String, param4:String, param5:String, param6:IAssetLibrary, param7:String = null)
      {
         super(param1,param2,param3,param4,param5,param7);
         _assets = param6;
         var_540 = new Map();
         var _loc8_:AvatarCanvas = var_52.getCanvas(var_148,var_247.definition.geometryType);
         if(_loc8_)
         {
            _image = new BitmapData(_loc8_.width,_loc8_.height,true,16777215);
         }
      }
      
      override public function getImage(param1:String, param2:Boolean) : BitmapData
      {
         if(_isDisposed)
         {
            return null;
         }
         var _loc3_:BitmapData = getPlaceHolderImage(var_82,var_148);
         if(!_loc3_ || !_image)
         {
            return null;
         }
         _image.fillRect(_image.rect,16777215);
         _image.copyPixels(_loc3_,_loc3_.rect,new Point((0 - _loc3_.width) / 2,0 - _loc3_.height),null,null,true);
         if(param2)
         {
            return _image.clone();
         }
         return _image;
      }
      
      override public function getCroppedImage(param1:String) : BitmapData
      {
         if(_isDisposed)
         {
            return null;
         }
         var _loc2_:BitmapData = getPlaceHolderImage(var_82,var_148);
         if(!_loc2_)
         {
            return null;
         }
         return _loc2_.clone();
      }
      
      private function getPlaceHolderImage(param1:int, param2:String) : BitmapData
      {
         var _loc5_:* = null;
         var _loc3_:String = "pet_placeholder_";
         if(param2 == AvatarScaleType.SMALL)
         {
            var _loc6_:* = _loc3_ + "s";
            _loc3_ += "s";
            _loc6_;
         }
         _loc6_ = _loc3_ + param1.toString();
         _loc3_ += param1.toString();
         _loc6_;
         _loc6_ = _loc3_ + "_png";
         _loc3_ += "_png";
         _loc6_;
         var _loc4_:BitmapData = var_540.getValue(_loc3_);
         if(!_loc4_)
         {
            _loc5_ = _assets.getAssetByName(_loc3_) as BitmapDataAsset;
            _loc6_ = _loc5_.content as BitmapData;
            _loc4_ = _loc5_.content as BitmapData;
            _loc6_;
            var_540.add(_loc3_,_loc4_.clone());
            _loc4_ = var_540.getValue(_loc3_);
         }
         return _loc4_;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(var_540)
         {
            for each(_loc1_ in var_540)
            {
            }
            var_540.dispose();
            var _loc2_:* = null;
            var_540 = null;
            _loc2_;
         }
         if(_image)
         {
            _loc2_ = null;
            _image = null;
            _loc2_;
         }
         _loc2_ = null;
         _assets = null;
         _loc2_;
         super.dispose();
      }
   }
}
