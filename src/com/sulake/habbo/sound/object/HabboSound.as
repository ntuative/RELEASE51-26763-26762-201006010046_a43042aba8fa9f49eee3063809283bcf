package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_1010:SoundChannel = null;
      
      private var var_806:Boolean;
      
      private var var_1011:Sound = null;
      
      private var var_753:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_1011 = param1;
         var_1011.addEventListener(Event.COMPLETE,onComplete);
         var_753 = 1;
         var_806 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_806;
      }
      
      public function stop() : Boolean
      {
         var_1010.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_806 = false;
         var_1010 = var_1011.play(0);
         this.volume = var_753;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_753;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_1010.position;
      }
      
      public function get length() : Number
      {
         return var_1011.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_753 = param1;
         if(var_1010 != null)
         {
            var_1010.soundTransform = new SoundTransform(var_753);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_806 = true;
      }
   }
}
