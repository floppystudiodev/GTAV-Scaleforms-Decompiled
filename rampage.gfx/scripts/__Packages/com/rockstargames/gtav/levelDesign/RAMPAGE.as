class com.rockstargames.gtav.levelDesign.RAMPAGE extends com.rockstargames.ui.core.BaseScriptUI
{
   var CONTENT;
   var fadeTime = 1;
   function RAMPAGE()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
   }
   function SHOW_RAMPAGE()
   {
      this.CONTENT.gotoAndStop(1);
      this.CONTENT._visible = true;
   }
   function HIDE_RAMPAGE()
   {
      this.CONTENT.gotoAndStop(1);
      this.CONTENT._visible = false;
   }
   function SHOW_RAMPAGE_INTRO(duration, rampage, description)
   {
      var _loc2_ = duration / 4;
      this.CONTENT.gotoAndStop("INTRO");
      var _loc5_ = this.CONTENT.INTRO.logoMC;
      var _loc4_ = this.CONTENT.INTRO.titleMC;
      var _loc3_ = this.CONTENT.INTRO.descriptionMC;
      _loc5_._alpha = 0;
      _loc4_._alpha = 0;
      _loc3_._alpha = 0;
      _loc5_._xscale = 300;
      _loc5_._yscale = 300;
      _loc5_._rotation = -5;
      _loc4_._xscale = 300;
      _loc4_._yscale = 300;
      _loc4_._rotation = -5;
      _loc3_._xscale = 300;
      _loc3_._yscale = 300;
      _loc3_._rotation = -5;
      _loc3_.descriptionTF.text = description;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc5_,_loc2_,{_alpha:100,_xscale:80,_yscale:80,_rotation:5,onCompleteScope:this,onComplete:this.bounceBack,onCompleteArgs:[_loc2_,_loc5_]});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc4_,_loc2_,{_alpha:100,_xscale:80,_yscale:80,_rotation:5,delay:_loc2_,onCompleteScope:this,onComplete:this.bounceBack,onCompleteArgs:[_loc2_,_loc4_]});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3_,_loc2_,{_alpha:100,_xscale:80,_yscale:80,_rotation:5,delay:_loc2_ + _loc2_,onCompleteScope:this,onComplete:this.bounceBack,onCompleteArgs:[_loc2_,_loc3_]});
   }
   function SHOW_RAMPAGE_COUNTDOWN(duration, description)
   {
   }
   function SHOW_RAMPAGE_OUTRO()
   {
      var _loc6_ = arguments;
      var _loc18_ = _loc6_[0];
      var _loc16_ = _loc6_[1];
      var _loc11_;
      if(_loc16_)
      {
         _loc11_ = (_loc6_.length - 5) / 2;
      }
      else
      {
         _loc11_ = (_loc6_.length - 2) / 2;
      }
      var _loc13_ = _loc18_ / 4;
      var _loc17_ = [13395456,10066329,16776960];
      this.CONTENT.gotoAndStop("OUTRO");
      var _loc12_ = this.CONTENT.OUTRO.logoMC;
      var _loc10_ = this.CONTENT.OUTRO.passFailMC;
      if(this.CONTENT.OUTRO.statsMC != undefined)
      {
         this.CONTENT.OUTRO.statsMC.removeMovieClip();
      }
      var _loc4_ = this.CONTENT.OUTRO.createEmptyMovieClip("statsMC",this.CONTENT.OUTRO.getNextHighestDepth());
      _loc4_._x = 0;
      _loc4_._y = 62;
      _loc12_._alpha = 0;
      _loc10_._alpha = 0;
      _loc4_._alpha = 0;
      _loc12_._xscale = 500;
      _loc12_._yscale = 500;
      _loc12_._rotation = -5;
      _loc10_._xscale = 300;
      _loc10_._yscale = 300;
      _loc10_._rotation = -5;
      _loc4_._xscale = 300;
      _loc4_._yscale = 300;
      _loc4_._rotation = -5;
      var _loc3_ = 2;
      var _loc9_ = 11;
      var _loc7_ = 0;
      var _loc5_;
      var _loc8_;
      while(_loc7_ < _loc11_)
      {
         _loc8_ = "outroStatMC" + (_loc3_ - 1);
         _loc5_ = _loc4_.attachMovie("outroStatMC",_loc8_,_loc4_.getNextHighestDepth(),{_x:0,_y:_loc9_});
         _loc5_.s1TF.text = _loc6_[_loc3_];
         _loc5_.s2TF.text = _loc6_[_loc3_ + 1];
         _loc3_ += 2;
         _loc9_ += 21;
         _loc7_ = _loc7_ + 1;
      }
      var _loc20_;
      var _loc19_;
      var _loc15_;
      var _loc14_;
      if(_loc16_)
      {
         _loc20_ = _loc6_[_loc6_.length - 3];
         _loc19_ = _loc6_[_loc6_.length - 2];
         _loc15_ = _loc6_[_loc6_.length - 1];
         _loc14_ = _loc4_.attachMovie("outroFooterMC","outroFooterMC",_loc4_.getNextHighestDepth(),{_x:0,_y:_loc9_});
         _loc14_.ratingTF.text = _loc20_;
         _loc14_.medalTF.text = _loc19_;
         _loc14_.medalTF.textColor = _loc17_[_loc15_ - 1];
         _loc14_.medalMC.gotoAndStop(_loc15_);
         _loc10_.gotoAndStop("PASSED");
      }
      else
      {
         _loc10_.gotoAndStop("FAILED");
      }
      _loc12_._alpha = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc12_,_loc13_,{_xscale:120,_yscale:120,_rotation:0,onCompleteScope:this,onComplete:this.setAlpha,onCompleteArgs:[_loc10_]});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc10_,_loc13_,{_xscale:100,_yscale:100,_rotation:0,delay:_loc13_,onCompleteScope:this,onComplete:this.setAlpha,onCompleteArgs:[_loc4_]});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc4_,_loc13_,{_xscale:100,_yscale:100,_rotation:0,delay:_loc13_ + _loc13_});
   }
   function setAlpha(_mc)
   {
      _mc._alpha = 100;
   }
   function swapAlpha(_mc1, _mc2)
   {
      _mc1._alpha = 0;
      _mc2._alpha = 100;
   }
   function bounceBack(duration, _mc)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_mc,duration,{_xscale:100,_yscale:100,_rotation:0});
   }
}
