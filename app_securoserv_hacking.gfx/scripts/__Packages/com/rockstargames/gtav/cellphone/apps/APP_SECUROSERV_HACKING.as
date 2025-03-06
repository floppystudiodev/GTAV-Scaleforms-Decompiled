class com.rockstargames.gtav.cellphone.apps.APP_SECUROSERV_HACKING extends MovieClip
{
   var view;
   var state;
   static var STATE_NO_SIGNAL = 0;
   static var STATE_HACKING = 1;
   static var STATE_COMPLETE = 2;
   static var STATE_PROGRESS = 3;
   static var STATE_WEAK_SIGNAL = 4;
   function APP_SECUROSERV_HACKING()
   {
      super();
   }
   function INITIALISE(mc)
   {
      this.view = mc.CONTENT;
      this.state = -1;
      this.initNoSignal();
   }
   function APP_FUNCTION()
   {
   }
   function CLOSE_APP()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.completeAnimation);
   }
   function CLEAN_UP_DATA()
   {
      this.CLOSE_APP();
   }
   function construct()
   {
      _level0.TIMELINE.SET_HEADER();
      this.populateContent();
   }
   function populateContent()
   {
      var _loc2_ = _level0.TIMELINE.securoServHackingViewProvider[0][0];
      switch(_loc2_)
      {
         case com.rockstargames.gtav.cellphone.apps.APP_SECUROSERV_HACKING.STATE_NO_SIGNAL:
            this.initNoSignal();
            break;
         case com.rockstargames.gtav.cellphone.apps.APP_SECUROSERV_HACKING.STATE_HACKING:
            this.initHacking(_level0.TIMELINE.securoServHackingViewProvider[0][1]);
            break;
         case com.rockstargames.gtav.cellphone.apps.APP_SECUROSERV_HACKING.STATE_COMPLETE:
            this.initComplete();
            break;
         case com.rockstargames.gtav.cellphone.apps.APP_SECUROSERV_HACKING.STATE_PROGRESS:
            this.initProgress();
            break;
         case com.rockstargames.gtav.cellphone.apps.APP_SECUROSERV_HACKING.STATE_WEAK_SIGNAL:
            this.initWeakSignal();
      }
   }
   function initNoSignal()
   {
      if(this.state != com.rockstargames.gtav.cellphone.apps.APP_SECUROSERV_HACKING.STATE_NO_SIGNAL)
      {
         this.state = com.rockstargames.gtav.cellphone.apps.APP_SECUROSERV_HACKING.STATE_NO_SIGNAL;
         this.view.gotoAndStop("noSignal");
         this.view.label.textAutoSize = "shrink";
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"CELL_SECURO_NOSIGNAL",this.view.label);
      }
   }
   function initWeakSignal()
   {
      if(this.state != com.rockstargames.gtav.cellphone.apps.APP_SECUROSERV_HACKING.STATE_WEAK_SIGNAL)
      {
         this.state = com.rockstargames.gtav.cellphone.apps.APP_SECUROSERV_HACKING.STATE_WEAK_SIGNAL;
         this.view.gotoAndStop("weakSignal");
         var _loc3_ = _level0.TIMELINE.securoServHackingViewProvider[0][2];
         if(_loc3_ != undefined)
         {
            this.initMessage(_loc3_,true);
         }
         else
         {
            this.initMessage("CELL_SECURO_WEAK",false);
         }
         var _loc2_ = this.view.completeAnimation.label.getTextFormat();
         _loc2_.color = 16777215;
         this.view.completeAnimation.label.setTextFormat(_loc2_);
         var _loc4_ = new flash.geom.ColorTransform();
         _loc4_.rgb = 12527916;
         this.view.completeAnimation.bg.transform.colorTransform = _loc4_;
      }
   }
   function initHacking(percentage)
   {
      if(this.state != com.rockstargames.gtav.cellphone.apps.APP_SECUROSERV_HACKING.STATE_HACKING)
      {
         this.state = com.rockstargames.gtav.cellphone.apps.APP_SECUROSERV_HACKING.STATE_HACKING;
         this.view.gotoAndStop("hacking");
      }
      percentage = Math.floor(Math.max(0,Math.min(100,percentage)));
      this.view.percentage.text = percentage + "%";
      this.view.triangle.gotoAndStop(percentage);
      this.view.triangle._visible = percentage > 0;
   }
   function initComplete()
   {
      if(this.state != com.rockstargames.gtav.cellphone.apps.APP_SECUROSERV_HACKING.STATE_COMPLETE)
      {
         this.state = com.rockstargames.gtav.cellphone.apps.APP_SECUROSERV_HACKING.STATE_COMPLETE;
         this.view.gotoAndStop("complete");
         var _loc2_ = _level0.TIMELINE.securoServHackingViewProvider[0][3];
         if(_loc2_ != undefined)
         {
            this.initMessage(_loc2_,true);
         }
         else
         {
            this.initMessage("CELL_SECURO_COMPLETE",false);
         }
      }
   }
   function initProgress()
   {
      if(this.state != com.rockstargames.gtav.cellphone.apps.APP_SECUROSERV_HACKING.STATE_PROGRESS)
      {
         this.state = com.rockstargames.gtav.cellphone.apps.APP_SECUROSERV_HACKING.STATE_PROGRESS;
         this.view.gotoAndStop("progress");
         var _loc2_ = _level0.TIMELINE.securoServHackingViewProvider[0][2];
         if(_loc2_ != undefined)
         {
            this.initMessage(_loc2_,true);
         }
         else
         {
            this.initMessage("CELL_SECURO_PROGRESS",false);
         }
      }
   }
   function initMessage(label, isLiteral)
   {
      this.view.completeAnimation.label.textAutoSize = "shrink";
      if(isLiteral)
      {
         this.view.completeAnimation.label.text = label;
      }
      else
      {
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,this.view.completeAnimation.label);
      }
      this.view.completeAnimation.bg._width = this.view.completeAnimation.label.textWidth + 20;
      this.view.completeAnimation.bg._x = 0.5 * (this.view.completeAnimation.label._width - this.view.completeAnimation.bg._width);
      var _loc2_ = this.view.completeAnimation.label.getTextFormat();
      _loc2_.color = 0;
      this.view.completeAnimation.label.setTextFormat(_loc2_);
      this.view.completeAnimation.bg.transform.colorTransform = new flash.geom.ColorTransform();
      this.flashMessage();
   }
   function flashMessage()
   {
      if(this.view.completeAnimation)
      {
         this.view.completeAnimation._visible = !this.view.completeAnimation._visible;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.completeAnimation,0.6,{onCompleteScope:this,onComplete:this.flashMessage});
      }
   }
}
