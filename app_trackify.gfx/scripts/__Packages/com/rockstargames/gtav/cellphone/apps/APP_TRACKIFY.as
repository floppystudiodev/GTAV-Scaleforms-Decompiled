class com.rockstargames.gtav.cellphone.apps.APP_TRACKIFY extends MovieClip
{
   var LoadingScreenType;
   var TIMELINE;
   var depthArrow;
   var depthTF;
   var intervalIdSweep;
   var loadingAnim;
   var loadingText;
   var mainScreen;
   var player;
   var rings;
   var sweepMC;
   var target;
   var targetArray;
   var sweepStep = 4;
   var loadingCounter = 1;
   var sweepTime = 1;
   var targetFadeTime = 4;
   var sonarTime = 2;
   var flashTime = 0.5;
   var LOADING_SCREEN_TYPE_STANDARD = 0;
   var LOADING_SCREEN_TYPE_SKIPPED = 1;
   var LOADING_SCREEN_TYPE_HACKING = 2;
   var LOADING_SCREEN_TYPE_HACKING_ACTIVE = 3;
   var firstRun = true;
   var targetVisible = true;
   var targetArrowVisible = true;
   var noTarget = false;
   function APP_TRACKIFY()
   {
      super();
      this.targetArray = [];
   }
   function INITIALISE(mc)
   {
      mc.stop();
      this.TIMELINE = mc;
      this.loadingAnim = this.TIMELINE.loadingAnim;
      this.loadingText = this.loadingAnim.loadingTextMc;
      this.mainScreen = this.TIMELINE.mainScreen;
      this.target = this.mainScreen.target;
      this.player = this.mainScreen.player;
      this.rings = this.mainScreen.rings;
      this.sweepMC = this.mainScreen.sweepMC;
      this.depthArrow = this.mainScreen.depthArrow;
      this.depthTF = this.mainScreen.depthTF;
      this.showDepth(false);
      this.loadingText.text1TF._visible = false;
      this.loadingText.text2TF._visible = false;
      this.loadingText.text3TF._visible = false;
   }
   function setTargetByID(targetID, direction, distance, range, relativeDepth, heightIndicator)
   {
      var _loc2_;
      if(this.targetArray[targetID] == undefined)
      {
         _loc2_ = new com.rockstargames.gtav.cellphone.apps.TrackifyTarget();
         if(targetID == 0)
         {
            _loc2_._mc = this.mainScreen.target;
         }
         else
         {
            _loc2_._mc = this.mainScreen.attachMovie("target","target" + targetID,this.mainScreen.getNextHighestDepth());
         }
         this.targetArray[targetID] = _loc2_;
      }
      else
      {
         _loc2_ = this.targetArray[targetID];
      }
      if(direction >= 0)
      {
         _loc2_._mc._visible = true;
         _loc2_._direction = direction;
         _loc2_._distance = distance;
         _loc2_._range = range;
         this.updateTargetPositionNew(_loc2_);
      }
      else
      {
         _loc2_._mc._visible = false;
      }
      _loc2_._mc.HEIGHT_INDICATOR_UP._visible = false;
      _loc2_._mc.HEIGHT_INDICATOR_DOWN._visible = false;
      switch(heightIndicator)
      {
         case 2:
            _loc2_._mc.HEIGHT_INDICATOR_UP._visible = true;
            _loc2_._mc.HEIGHT_INDICATOR_DOWN._visible = false;
            break;
         case 3:
            _loc2_._mc.HEIGHT_INDICATOR_UP._visible = false;
            _loc2_._mc.HEIGHT_INDICATOR_DOWN._visible = true;
         default:
            return;
      }
   }
   function checkRangeForAllTargets()
   {
      var _loc3_;
      var _loc4_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < this.targetArray.length)
      {
         _loc3_ = this.targetArray[_loc2_];
         if(_loc3_._distance <= _loc3_._range)
         {
            _loc4_ = _loc4_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc4_ > 0)
      {
         if(this.rings._xscale != 250)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.rings,this.sonarTime,{_xscale:250,_yscale:250,onCompleteScope:this,onComplete:this.checkAndRemoveTween,onCompleteArgs:[this.rings]});
         }
      }
      else if(this.rings._xscale != 100)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.rings,this.sonarTime,{_xscale:100,_yscale:100,onCompleteScope:this,onComplete:this.checkAndRemoveTween,onCompleteArgs:[this.rings]});
      }
   }
   function displayDepth(relativeDepth)
   {
      if(relativeDepth < 0)
      {
         this.depthArrow._rotation = 180;
         this.depthArrow._alpha = 100;
      }
      else if(relativeDepth > 0)
      {
         this.depthArrow._rotation = 0;
         this.depthArrow._alpha = 100;
      }
      else if(relativeDepth == 0)
      {
         this.depthArrow._alpha = 0;
      }
      var _loc3_ = com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(Math.abs(relativeDepth),2);
      this.depthTF.text = _loc3_ + "m";
      this.showDepth(true);
   }
   function showDepth(_vis)
   {
      this.depthArrow._visible = _vis;
      this.depthTF._visible = _vis;
   }
   function construct(dataProviderUI)
   {
      if(this.firstRun == true)
      {
         _level0.TIMELINE.SET_HEADER();
         if(this.TIMELINE._currentframe == 1)
         {
            this.loadingText.text1TF.autoSize = "center";
            this.loadingText.text2TF.autoSize = "center";
            this.loadingText.text3TF.autoSize = "center";
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"CELL_TRACKIFY1",this.loadingText.text1TF);
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"CELL_TRACKIFY2",this.loadingText.text2TF);
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"CELL_TRACKIFY2",this.loadingText.text3TF);
         }
      }
      this.populateContent(dataProviderUI);
   }
   function populateContent(dataProviderUI)
   {
      if(dataProviderUI[0][0] == undefined || dataProviderUI[0][0] < 0)
      {
         this.noTarget = true;
      }
      this.LoadingScreenType = Number(dataProviderUI[0][3]);
      this.targetArrowVisible = dataProviderUI[0][4];
      var _loc2_;
      if(this.firstRun == true)
      {
         switch(this.LoadingScreenType)
         {
            case this.LOADING_SCREEN_TYPE_STANDARD:
               this.firstRun = false;
               this.TIMELINE.gotoAndStop(1);
               if(this.noTarget == true)
               {
                  this.set_loading_text("text3TF");
                  this.flashOff();
               }
               else
               {
                  this.set_loading_text("text1TF");
                  this.flashOff();
               }
               break;
            case this.LOADING_SCREEN_TYPE_SKIPPED:
               this.firstRun = false;
               this.TIMELINE.gotoAndStop(1);
               this.setupMainScreenSkipLoading();
               break;
            case this.LOADING_SCREEN_TYPE_HACKING:
               this.showHackingAppState("CELL_HACKACT",false);
               break;
            case this.LOADING_SCREEN_TYPE_HACKING_ACTIVE:
               this.showHackingAppState("CELL_HACKUNL",true);
            default:
               return;
         }
      }
      else
      {
         _loc2_ = 0;
         while(_loc2_ < dataProviderUI.length)
         {
            this.setTargetByID(_loc2_,dataProviderUI[_loc2_][0],dataProviderUI[_loc2_][1],dataProviderUI[_loc2_][2],dataProviderUI[_loc2_][5],dataProviderUI[_loc2_][6]);
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function APP_FUNCTION()
   {
   }
   function setupMainScreen()
   {
      this.checkAndRemoveTween(this.loadingText);
      this.loadingCounter = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.loadingAnim,1,{_alpha:0,delay:1,onCompleteScope:this,onComplete:this.checkAndRemoveTween,onCompleteArgs:[this.loadingAnim]});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.player,1,{_alpha:100,onCompleteScope:this,onComplete:this.checkAndRemoveTween,onCompleteArgs:[this.player]});
      clearInterval(this.intervalIdSweep);
      this.intervalIdSweep = setInterval(this,"animateSweep",this.sweepTime);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.sweepMC.sweep,1,{_alpha:100,onCompleteScope:this,onComplete:this.checkAndRemoveTween,onCompleteArgs:[this.sweepMC.sweep]});
   }
   function setupMainScreenSkipLoading()
   {
      this.loadingAnim._visible = false;
      this.player._alpha = 100;
      clearInterval(this.intervalIdSweep);
      this.intervalIdSweep = setInterval(this,"animateSweep",this.sweepTime);
      this.sweepMC.sweep._alpha = 100;
   }
   function updateTargetPositionNew(newTarget)
   {
      var _loc11_ = -149;
      var _loc9_ = 39;
      var _loc12_ = -84;
      var _loc10_ = 84;
      var _loc17_ = 84 / newTarget._range;
      var _loc14_ = _loc17_ * newTarget._distance;
      var _loc16_ = (newTarget._direction - 90) * 3.141592653589793 / 180;
      var _loc3_ = Math.cos(_loc16_) * _loc14_;
      var _loc2_ = Math.sin(_loc16_) * _loc14_;
      var _loc15_;
      var _loc13_;
      if(_loc3_ > 0)
      {
         _loc15_ = _loc3_ / _loc10_;
      }
      else
      {
         _loc15_ = _loc3_ / _loc12_;
      }
      if(_loc2_ > 0)
      {
         _loc13_ = _loc2_ / _loc9_;
      }
      else
      {
         _loc13_ = _loc2_ / _loc11_;
      }
      var _loc6_ = Math.max(Math.abs(_loc15_),Math.abs(_loc13_));
      var _loc4_ = false;
      if(newTarget._distance > newTarget._range)
      {
         _loc4_ = true;
      }
      var _loc8_ = _loc3_;
      var _loc7_ = _loc2_;
      if(_loc2_ < _loc11_)
      {
         _loc8_ = _loc3_ / _loc6_;
         _loc4_ = true;
         _loc7_ = _loc11_;
      }
      else if(_loc2_ > _loc9_)
      {
         _loc8_ = _loc3_ / _loc6_;
         _loc4_ = true;
         _loc7_ = _loc9_;
      }
      if(_loc3_ < _loc12_)
      {
         _loc8_ = _loc12_;
         _loc7_ = _loc2_ / _loc6_;
         _loc4_ = true;
      }
      else if(_loc3_ > _loc10_)
      {
         _loc8_ = _loc10_;
         _loc7_ = _loc2_ / _loc6_;
         _loc4_ = true;
      }
      if(_loc2_ < _loc11_ || _loc2_ > _loc9_)
      {
         _loc7_ = _loc2_ / _loc6_;
         _loc4_ = true;
      }
      if(_loc3_ < _loc12_ || _loc3_ > _loc10_)
      {
         _loc8_ = _loc3_ / _loc6_;
         _loc4_ = true;
      }
      if(this.targetArrowVisible == false)
      {
         _loc4_ = false;
      }
      newTarget._mc._x = _loc8_ + this.player._x;
      newTarget._mc._y = _loc7_ + this.player._y;
      newTarget._mc.arrow._rotation = newTarget._direction;
      newTarget._mc.arrow._visible = _loc4_;
   }
   function testAllTargets()
   {
      var _loc2_;
      var _loc4_ = 0;
      var _loc3_;
      while(_loc4_ < this.targetArray.length)
      {
         _loc2_ = this.targetArray[_loc4_];
         _loc3_ = this.sweepMC._rotation;
         if(_loc3_ < 0)
         {
            _loc3_ += 360;
         }
         if(_loc3_ > _loc2_._direction - this.sweepStep * 2 && _loc3_ < _loc2_._direction + this.sweepStep * 2)
         {
            if(_loc2_._mc._alpha < 90)
            {
               com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"TRACKIFY_BEEP","PHONE_SOUNDSET_DEFAULT");
            }
            this.checkAndRemoveTween(_loc2_._mc);
            _loc2_._mc._alpha = 100;
            _loc2_._mc._xscale = 100;
            _loc2_._mc._yscale = 100;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_._mc,this.targetFadeTime,{_alpha:0,_xscale:50,_yscale:50,onCompleteScope:this,onComplete:this.checkAndRemoveTween,onCompleteArgs:[_loc2_._mc]});
         }
         _loc4_ = _loc4_ + 1;
      }
   }
   function set_loading_text(textString)
   {
      this.loadingText.text1TF._visible = false;
      this.loadingText.text2TF._visible = false;
      this.loadingText.text3TF._visible = false;
      this.loadingText[textString]._visible = true;
   }
   function flashOn()
   {
      if(this.noTarget == false)
      {
         this.loadingCounter = this.loadingCounter + 1;
      }
      this.checkAndRemoveTween(this.loadingText);
      if(this.loadingCounter < 3)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.loadingText,this.flashTime,{_alpha:100,onCompleteScope:this,onComplete:this.flashOff});
      }
      else
      {
         this.set_loading_text("text2TF");
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.loadingText,this.flashTime,{_alpha:100,onCompleteScope:this,onComplete:this.setupMainScreen});
      }
   }
   function flashOff(mc)
   {
      this.checkAndRemoveTween(this.loadingText);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.loadingText,this.flashTime,{_alpha:40,delay:0.5,onCompleteScope:this,onComplete:this.flashOn});
   }
   function animateSweep()
   {
      var _loc2_ = this.sweepMC._rotation;
      _loc2_ += this.sweepStep;
      if(_loc2_ > 360)
      {
         _loc2_ -= 360;
      }
      this.sweepMC._rotation = _loc2_;
      this.testAllTargets();
   }
   function CLEAN_UP_DATA()
   {
      this.mainScreen._visible = false;
      clearInterval(this.intervalIdSweep);
      this.intervalIdSweep = null;
      this.checkAndRemoveTween(this.loadingText);
      this.checkAndRemoveTween(this.mainScreen);
      this.checkAndRemoveTween(this.rings);
      this.checkAndRemoveTween(this.target);
      this.checkAndRemoveTween(this.sweepMC.sweep);
      var _loc3_;
      var _loc2_ = 0;
      while(_loc2_ < this.targetArray.length)
      {
         _loc3_ = this.targetArray[_loc2_];
         this.checkAndRemoveTween(_loc3_._mc);
         _loc2_ = _loc2_ + 1;
      }
   }
   function CLOSE_APP()
   {
      this.CLEAN_UP_DATA();
   }
   function checkAndRemoveTween(mc)
   {
      if(typeof mc == "movieclip")
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(mc);
      }
   }
   function showHackingAppState(buttonLabel, isActive)
   {
      this.TIMELINE.gotoAndStop("hacking_app");
      var _loc4_ = this.TIMELINE.hackingApp;
      var _loc3_ = _loc4_.button;
      if(isActive)
      {
         _loc3_.gotoAndStop("down");
         _loc4_.warningLines.play();
         _loc4_.lester.play();
      }
      else
      {
         _loc4_.warningLines.stop();
         _loc4_.lester.stop();
      }
      var _loc2_ = _loc4_.button_label;
      _loc2_.autoSize = "left";
      this.checkAndSetText(_loc2_,buttonLabel);
      var _loc5_ = 0.9 * _loc3_._width;
      var _loc6_ = _loc2_._width > _loc5_ ? _loc5_ / _loc2_._width : 1;
      _loc2_._xscale = _loc2_._yscale = 100 * _loc6_;
      _loc2_._x = 0.5 * (_loc3_._width - _loc2_._width) + _loc3_._x;
      _loc2_._y = 0.5 * (_loc3_._height - _loc2_._height) + _loc3_._y + 3;
   }
   function checkAndSetText(TF, textLabel)
   {
      if(TF != undefined)
      {
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(TF,textLabel,com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,true);
      }
   }
}
