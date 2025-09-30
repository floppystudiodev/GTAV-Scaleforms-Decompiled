class com.rockstargames.gtav.levelDesign.covertOps.LoginScreen extends com.rockstargames.gtav.levelDesign.covertOps.Screen
{
   var _userName;
   var app;
   var cursor;
   var loginButton;
   var view;
   static var LOG_IN = 100;
   function LoginScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"loginScreen");
      this.init();
   }
   function init()
   {
      com.rockstargames.gtav.levelDesign.COVERT_OPS.setLocalisedText(this.view.headingLabel,"COVOPS_LOGIN_PROMPT");
      com.rockstargames.gtav.levelDesign.COVERT_OPS.setLocalisedText(this.view.usernameLabel,"COVOPS_USERNAME");
      com.rockstargames.gtav.levelDesign.COVERT_OPS.setLocalisedText(this.view.passwordLabel,"COVOPS_PASSWORD");
      this.setLetterSpacing(this.view.headingLabel);
      this.setLetterSpacing(this.view.usernameLabel);
      this.setLetterSpacing(this.view.passwordLabel);
      this.setLetterSpacing(this.view.loginButton.label);
      this.loginButton = new com.rockstargames.gtav.levelDesign.covertOps.StretchButton(com.rockstargames.gtav.levelDesign.covertOps.LoginScreen.LOG_IN,this.view.loginButton,"COVOPS_LOGIN");
      this.view.loginButton._x = 782 - this.view.loginButton._width;
      this.loginButton.updateBounds();
      this.loginButton.disable();
      this.app.SET_MOUSE_INPUT(0.605,0.57);
      this.view.passwordAnimation._visible = false;
      this.view._visible = true;
      this._userName = this.app.gamerTag;
   }
   function setLetterSpacing(tf)
   {
      var _loc1_ = tf.getTextFormat();
      _loc1_.letterSpacing = 2;
      tf.setTextFormat(_loc1_);
   }
   function get isReady()
   {
      return true;
   }
   function handleButtonInput(inputID)
   {
      var _loc0_;
      if(inputID == com.rockstargames.gtav.levelDesign.COVERT_OPS.ACCEPT || inputID == com.rockstargames.gtav.levelDesign.COVERT_OPS.LEFT_MOUSE)
      {
         if((_loc0_ = this.app.GET_CURRENT_SELECTION()) === this.loginButton.id)
         {
            com.rockstargames.gtav.levelDesign.COVERT_OPS.playSound("Log_In");
            this.showNextScreen();
         }
      }
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      super.dispose();
   }
   function set userName(_userName)
   {
      com.rockstargames.gtav.levelDesign.COVERT_OPS.truncate(this.view.usernameEntry,_userName,"left",2);
      this._userName = this.view.usernameEntry.text;
      this.view.usernameEntry.text = "";
      this.updateUserName();
   }
   function updateUserName()
   {
      var _loc2_ = this.view.usernameEntry.text.length + 1;
      this.view.usernameEntry.text = this._userName.substring(0,_loc2_);
      this.setLetterSpacing(this.view.usernameEntry);
      this.view.caret._x = this.view.usernameEntry._x + this.view.usernameEntry.textWidth + 4;
      var _loc3_;
      if(_loc2_ < this._userName.length)
      {
         com.rockstargames.gtav.levelDesign.COVERT_OPS.playSound("Type_Key");
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,0.05,{onComplete:this.updateUserName,onCompleteScope:this});
      }
      else
      {
         this.view.caret._visible = false;
         this.view.passwordAnimation._visible = true;
         this.view.passwordAnimation.play();
         _loc3_ = this.view.passwordAnimation._totalFrames / 30;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,_loc3_,{onComplete:this.activateLoginButton,onCompleteScope:this});
      }
   }
   function activateLoginButton()
   {
      com.rockstargames.gtav.levelDesign.COVERT_OPS.playSound("Type_Enter");
      this.loginButton.enable();
      this.cursor.setTargetRects([this.loginButton]);
   }
   function showNextScreen()
   {
      this.app.showScreen(this.app.MAIN_SCREEN);
   }
}
