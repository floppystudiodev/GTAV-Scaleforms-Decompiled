class com.rockstargames.gtav.hud.hudComponents.HUD_MULTIPLAYER_CHAT extends com.rockstargames.ui.hud.HUD_COMPONENT
{
   var TextEntryTF;
   var CONTENT;
   var MessageBoxTF;
   var ScopeTF;
   var _enumID;
   var _HUD;
   var forceShow = false;
   var hasFocus = false;
   function HUD_MULTIPLAYER_CHAT()
   {
      super();
      this.ON_SCREEN_DURATION = 2500;
      this.TextEntryTF.html = true;
      this.CONTENT._alpha = 255;
      this.TextEntryTF.text = "Test";
   }
   function INITIALISE(mc)
   {
   }
   function READY(id)
   {
      super.READY(id);
      this.CONTENT._alpha = 255;
   }
   function PAGE_UP()
   {
      this.MessageBoxTF.scroll--;
   }
   function PAGE_DOWN()
   {
      this.MessageBoxTF.scroll = this.MessageBoxTF.scroll + 1;
   }
   function ADD_TEXT(text)
   {
      if(text == "ENTER")
      {
         this.SET_TYPING_DONE();
      }
      else
      {
         this.TextEntryTF.text += text;
      }
   }
   function SET_FOCUS(focus, TypeMode)
   {
      if(TypeMode == 0)
      {
         this.ScopeTF.text = "";
      }
      else if(TypeMode == 1)
      {
         this.ScopeTF.text = "TEAM";
      }
      else if(TypeMode == 2)
      {
         this.ScopeTF.text = "ALL";
      }
      else if(TypeMode == 3)
      {
         this.ScopeTF.text = "CLAN";
      }
      this.hasFocus = focus;
   }
   function SET_TYPING_DONE()
   {
      this.MessageBoxTF.text += this.TextEntryTF.text;
      this.TextEntryTF.text = "";
   }
   function SET_STREET_NAME(newName)
   {
      var _loc2_ = this.CONTENT.nameText;
      _loc2_.text = newName;
      var _loc3_ = _loc2_.getTextFormat();
      _loc3_.rightMargin = 2;
      _loc2_.setTextFormat(_loc3_);
      this.SHOW();
   }
   function FORCE_SHOW(_forceShow)
   {
      this.forceShow = _forceShow == "true";
   }
   function SHOW()
   {
      if(this.forceShow)
      {
         this.CONTENT._alpha = 100;
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:100,onComplete:this.STAY_ON_SCREEN,onCompleteScope:this});
      }
   }
   function STAY_ON_SCREEN()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,this.ON_SCREEN_DURATION / 1000,{onComplete:this.HIDE,onCompleteScope:this});
   }
   function HIDE()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,this.FADE_DURATION / 1000,{_alpha:0,onComplete:this.REMOVE,onCompleteScope:this});
   }
   function REMOVE()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      this._HUD.REMOVE_HUD_ITEM(this._enumID);
   }
}
