class com.rockstargames.gtav.levelDesign.securoserv.LoginScreen extends com.rockstargames.gtav.levelDesign.securoserv.Screen
{
   var _userName;
   var accessDeniedQuitButton;
   var app;
   var cursor;
   var loginButton;
   var screensaver;
   var view;
   static var LOG_IN = 1001;
   static var QUIT = 1002;
   function LoginScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"loginScreen");
      this.init();
   }
   function init()
   {
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.headingLabel,"SECUROSERV_LOGIN_PROMPT");
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.usernameLabel,"SECUROSERV_USERNAME");
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.passwordLabel,"SECUROSERV_PASSWORD");
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.versionLabel,"SECUROSERV_VERSION");
      this.setLetterSpacing(this.view.headingLabel);
      this.setLetterSpacing(this.view.usernameLabel);
      this.setLetterSpacing(this.view.passwordLabel);
      this.setLetterSpacing(this.view.loginButton.label);
      this.loginButton = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(com.rockstargames.gtav.levelDesign.securoserv.LoginScreen.LOG_IN,this.view.loginButton,"SECUROSERV_LOGIN");
      this.view.loginButton._x = 782 - this.view.loginButton._width;
      this.loginButton.updateBounds();
      this.loginButton.disable();
      this.accessDeniedQuitButton = new com.rockstargames.gtav.levelDesign.securoserv.StretchButton(com.rockstargames.gtav.levelDesign.securoserv.LoginScreen.QUIT,this.view.accessDeniedOverlay.quitButton,"SECUROSERV_QUIT");
      this.view.accessDeniedOverlay.quitButton._x = 0.5 * (this.view.accessDeniedOverlay._width - this.view.accessDeniedOverlay.quitButton._width);
      this.accessDeniedQuitButton.updateBounds();
      this.app.SET_MOUSE_INPUT(0.605,0.65);
      com.rockstargames.gtav.levelDesign.securoserv.Screensaver.clearState();
      this.screensaver = new com.rockstargames.gtav.levelDesign.securoserv.Screensaver(this.view.screensaver);
      this.view.accessDeniedOverlay._visible = false;
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
      if(inputID == com.rockstargames.gtav.levelDesign.SECUROSERV.ACCEPT || inputID == com.rockstargames.gtav.levelDesign.SECUROSERV.LEFT_MOUSE)
      {
         switch(this.app.GET_CURRENT_SELECTION())
         {
            case this.loginButton.id:
               com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Login");
               if(this.app.gamerHasAccess)
               {
                  this.showNextScreen();
               }
               else
               {
                  this.showAccessDenied();
               }
               break;
            case this.accessDeniedQuitButton.id:
               this.app.quit();
            default:
               return;
         }
      }
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.screensaver.saveState();
      this.screensaver.dispose();
      super.dispose();
   }
   function set userName(_userName)
   {
      com.rockstargames.gtav.levelDesign.SECUROSERV.truncate(this.view.usernameEntry,_userName,"left",2);
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
         com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Keyboard_Key");
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
      com.rockstargames.gtav.levelDesign.SECUROSERV.playSound("Keyboard_Key_Enter");
      this.loginButton.enable();
      this.cursor.setTargetRects([this.loginButton]);
   }
   function showNextScreen()
   {
      this.app.showScreen(this.app.BRANCH_SCREEN);
   }
   function showAccessDenied()
   {
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.accessDeniedOverlay.title,"SECUROSERV_ACCESS_DENIED_TITLE");
      com.rockstargames.gtav.levelDesign.SECUROSERV.setLocalisedText(this.view.accessDeniedOverlay.message,"SECUROSERV_ACCESS_DENIED_MESSAGE");
      this.cursor.setTargetRects([this.accessDeniedQuitButton]);
      this.view.accessDeniedOverlay._visible = true;
   }
}
