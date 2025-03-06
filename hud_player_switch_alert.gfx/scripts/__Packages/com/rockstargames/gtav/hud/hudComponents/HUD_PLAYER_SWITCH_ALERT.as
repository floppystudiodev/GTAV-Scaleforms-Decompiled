class com.rockstargames.gtav.hud.hudComponents.HUD_PLAYER_SWITCH_ALERT extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var CHAR_LIST;
   var slicesOfPie;
   var CONTENT;
   var BOUNDING_BOX;
   var TIMELINE;
   var I_LOVE_BLINKING_THIS_MANY_TIMES = 2;
   var BLINKS = 0;
   var count = 0;
   function HUD_PLAYER_SWITCH_ALERT()
   {
      super();
   }
   function INITIALISE(mc)
   {
      this.count = 0;
      this.CHAR_LIST = [];
      super.INITIALISE(mc);
      this.slicesOfPie = ["topSlice","rightSlice","bottomSlice","leftSlice"];
   }
   function CLEANUP_PLAYER_SWITCH_ALERT()
   {
      this.DESTROY();
      if(this.CONTENT != undefined)
      {
         this.CONTENT.removeMovieClip();
      }
      if(this.BOUNDING_BOX != undefined)
      {
         this.BOUNDING_BOX.removeMovieClip();
      }
      this.INITIALISE(this.TIMELINE);
   }
   function ADD_PLAYER_TO_SWITCH(params)
   {
      var _loc6_ = params[0];
      var _loc5_ = params[1];
      var _loc4_ = params[2];
      var _loc7_ = params[3];
      var _loc3_ = params[4];
      this.CHAR_LIST.push([_loc6_,_loc5_,_loc4_,_loc7_,_loc3_]);
   }
   function SET_PLAYER_SWITCH_WITH_HINT_AND_CHARACTER(params)
   {
      var _loc3_ = params[0];
      var _loc6_ = params[1];
      var _loc5_ = params[2];
      var _loc7_ = params[3];
      var _loc4_ = params[4];
      this.ADD_PLAYER_TO_SWITCH(params);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.topSlice,255,255,255,30);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.rightSlice,255,255,255,30);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.bottomSlice,255,255,255,30);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.leftSlice,255,255,255,30);
      if(this.CONTENT[this.slicesOfPie[_loc3_]] != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT[this.slicesOfPie[_loc3_]],_loc5_,_loc7_,_loc4_);
      }
      this.CONTENT.characters.gotoAndStop(_loc6_ + 2);
      this.CONTENT.characters._alpha = 0;
      this.FLASH_ON();
   }
   function START_PLAYER_SWITCH_LOOP()
   {
      this.FLASH_OFF();
   }
   function SET_PLAYER_SWITCH_VISIBLE_STATE(params)
   {
      var _loc2_ = params[0];
      this.CONTENT._visible = _loc2_;
      this.DESTROY();
   }
   function FLASH_ON()
   {
      var _loc2_ = this.CHAR_LIST[this.count][1] + 2;
      this.CONTENT.characters.gotoAndStop(_loc2_);
      if(typeof this.CONTENT == "movieclip")
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.characters,1.5,{_alpha:100,delay:0.5,onComplete:this.FLASH_OFF,onCompleteScope:this});
      }
      if(this.CHAR_LIST.length > 1)
      {
         if(this.CHAR_LIST.length < this.count)
         {
            this.count = 0;
         }
         else
         {
            this.count = this.count + 1;
         }
      }
   }
   function FLASH_OFF()
   {
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.topSlice,255,255,255,30);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.rightSlice,255,255,255,30);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.bottomSlice,255,255,255,30);
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.leftSlice,255,255,255,30);
      var _loc2_ = this.CHAR_LIST[this.count][0];
      if(this.CONTENT[this.slicesOfPie[_loc2_]] != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT[this.slicesOfPie[_loc2_]],this.CHAR_LIST[this.count][2],this.CHAR_LIST[this.count][3],this.CHAR_LIST[this.count][4]);
      }
      if(typeof this.CONTENT.characters == "movieclip")
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.characters,1.5,{_alpha:0,delay:0.5,onComplete:this.FLASH_ON,onCompleteScope:this});
      }
   }
   function BLINK_ON()
   {
      this.BLINKS = this.BLINKS + 1;
      if(this.BLINKS > this.I_LOVE_BLINKING_THIS_MANY_TIMES)
      {
         this.BLINKS = 0;
         if(typeof this.CONTENT == "movieclip")
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,0.1,{_alpha:100,delay:0.2,onComplete:this.STAY_ON,onCompleteScope:this});
         }
      }
      else if(typeof this.CONTENT == "movieclip")
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,0.1,{_alpha:100,delay:0.2,onComplete:this.BLINK_OFF,onCompleteScope:this});
      }
   }
   function STAY_ON()
   {
      if(typeof this.CONTENT == "movieclip")
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,0.1,{_alpha:100,delay:3,onComplete:this.BLINK_OFF,onCompleteScope:this});
      }
   }
   function BLINK_OFF()
   {
      if(typeof this.CONTENT == "movieclip")
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,0.1,{_alpha:0,delay:0.2,onComplete:this.BLINK_ON,onCompleteScope:this});
      }
   }
   function DESTROY()
   {
      if(typeof this.CONTENT == "movieclip")
      {
         if(typeof this.CONTENT.characters == "movieclip")
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.characters);
         }
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      }
   }
   function debug()
   {
   }
}
