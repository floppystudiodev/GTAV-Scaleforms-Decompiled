class com.rockstargames.gtav.minigames.tennis.TENNIS extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var FILE_WIDTH;
   var FOUR_THREE_PADDING;
   var TIMELINE;
   var _playerCard;
   var _scoreboard;
   var getDisplayConfig;
   var isHiDef;
   var isWideScreen;
   var positionToScreenLayout;
   var safeBottom;
   var safeLeft;
   var safeRight;
   var safeTop;
   var screenHeightPixels;
   var screenWidthPixels;
   var swingMeter;
   var _playerCardVisible = false;
   var _mugShotsLoaded = false;
   function TENNIS()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.CONTENT.ref = this;
      this.getDisplayConfig();
      Object.registerClass("Scoreboard",com.rockstargames.gtav.minigames.tennis.Scoreboard);
      this._scoreboard = com.rockstargames.gtav.minigames.tennis.Scoreboard(this.TIMELINE.attachMovie("Scoreboard","_scoreboard",this.TIMELINE.getNextHighestDepth()));
      Object.registerClass("PlayerCard",com.rockstargames.gtav.minigames.tennis.PlayerCard);
      this._playerCard = com.rockstargames.gtav.minigames.tennis.PlayerCard(this.CONTENT.attachMovie("PlayerCard","_playerCard",this.CONTENT.getNextHighestDepth()));
      this._playerCard._visible = this._playerCardVisible;
      this.swingMeter = com.rockstargames.gtav.minigames.components.SwingMeter(this.CONTENT.attachMovie("SwingMeter","swingMeter",this.CONTENT.getNextHighestDepth()));
      this.swingMeter._visible = false;
      this.positionToScreenLayout(this.swingMeter,"CC",true);
      this.DISPLAY_SCOREBOARD(false);
      this.DISPLAY_PLAYER_CARD(false);
      this.initScreenLayout();
   }
   function initScreenLayout()
   {
      this.swingMeter.screenWidth = this.screenWidthPixels;
      this.swingMeter.screenHeight = this.screenHeightPixels;
      this.positionToScreenLayout(this._playerCard,"LT",true);
      var _loc2_ = this.safeRight - this.safeLeft;
      if(_loc2_ <= this._scoreboard._width)
      {
         this._scoreboard._width = _loc2_;
      }
      else
      {
         this._scoreboard._xscale = 100;
      }
      this._scoreboard._x = Math.round((this.FILE_WIDTH - this._scoreboard._width) / 2);
      this._scoreboard._y = 190;
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef, _isAsian)
   {
      this.isWideScreen = _isWideScreen;
      this.isHiDef = _isHiDef;
      com.rockstargames.ui.utils.Debug.log("SET_DISPLAY_CONFIG " + arguments);
      this.safeLeft = Math.round(_screenWidthPixels * _safeLeftPercent);
      this.safeRight = Math.round(_screenWidthPixels * _safeRightPercent);
      this.safeTop = Math.round(_screenHeightPixels * _safeTopPercent);
      this.safeBottom = Math.round(_screenHeightPixels * _safeBottomPercent);
      var _loc6_ = arguments[9];
      var _loc3_ = arguments[10];
      com.rockstargames.ui.utils.Debug.log("isWideScreen " + this.isWideScreen);
      com.rockstargames.ui.utils.Debug.log("FOUR_THREE_PADDING " + this.FOUR_THREE_PADDING);
      com.rockstargames.ui.utils.Debug.log("----------------------- ");
      com.rockstargames.ui.utils.Debug.log("_actualResWidth " + _loc6_);
      com.rockstargames.ui.utils.Debug.log("_actualResHeight " + _loc3_);
      com.rockstargames.ui.utils.Debug.log("----------------------- ");
      com.rockstargames.ui.utils.Debug.log("_screenWidthPixels " + _screenWidthPixels);
      com.rockstargames.ui.utils.Debug.log("_screenHeightPixels " + _screenHeightPixels);
      com.rockstargames.ui.utils.Debug.log("----------------------- ");
      com.rockstargames.ui.utils.Debug.log("_safeTopPercent " + _safeTopPercent);
      com.rockstargames.ui.utils.Debug.log("_safeBottomPercent " + _safeBottomPercent);
      com.rockstargames.ui.utils.Debug.log("_safeLeftPercent " + _safeLeftPercent);
      com.rockstargames.ui.utils.Debug.log("_safeRightPercent " + _safeRightPercent);
      com.rockstargames.ui.utils.Debug.log("----------------------- ");
      com.rockstargames.ui.utils.Debug.log("safeTop " + this.safeTop);
      com.rockstargames.ui.utils.Debug.log("safeBottom " + this.safeBottom);
      com.rockstargames.ui.utils.Debug.log("safeLeft " + this.safeLeft);
      com.rockstargames.ui.utils.Debug.log("safeRight " + this.safeRight);
      this.initScreenLayout();
   }
   function DISPLAY_SCOREBOARD(value)
   {
      this._scoreboard._visible = value;
   }
   function DISPLAY_PLAYER_CARD(value)
   {
      this._playerCardVisible = value;
      this._playerCard._visible = this._playerCardVisible;
   }
   function SET_SCOREBOARD_TITLE(title, column0)
   {
      this._scoreboard.SET_SCOREBOARD_TITLE.apply(this._scoreboard,arguments);
      this.initScreenLayout();
   }
   function SET_SCOREBOARD_SLOT(id, isMP, name, crewTag, isSelected, column0)
   {
      this._scoreboard.SET_SCOREBOARD_SLOT.apply(this._scoreboard,arguments);
      this.initScreenLayout();
   }
   function SET_PLAYERCARD_TITLE(column0)
   {
      this._playerCard.SET_PLAYERCARD_TITLE.apply(this._playerCard,arguments);
      this.initScreenLayout();
   }
   function SET_PLAYERCARD_SLOT(id, isMP, name, crewTag, isSelected, txd, txn, column0)
   {
      this._playerCard.SET_PLAYERCARD_SLOT.apply(this._playerCard,arguments);
      this.initScreenLayout();
   }
   function SET_PLAYERCARD_HEADSET(id, headsetEnum)
   {
      this._playerCard.SET_PLAYERCARD_HEADSET.apply(this._playerCard,arguments);
   }
   function ADD_TXD_REF_RESPONSE(txd, strRef, success)
   {
      this._playerCard.ADD_TXD_REF_RESPONSE(txd,strRef,success);
      this._mugShotsLoaded = true;
      this._playerCard._visible = this._playerCardVisible;
   }
   function SWING_METER_SET_MARKER(hVisible, hPosition, vVisibile, vPosition)
   {
      this.swingMeter.setMarker(hVisible,hPosition,vVisibile,vPosition);
   }
   function SWING_METER_SET_APEX_MARKER(hVisible, hPosition, vVisibile, vPosition)
   {
      this.swingMeter.setApexMarker(hVisible,hPosition,vVisibile,vPosition);
   }
   function SWING_METER_SET_TARGET(span, position)
   {
      this.swingMeter.setTarget(span,position);
   }
   function SWING_METER_SET_TARGET_COLOR(r, g, b, a)
   {
      this.swingMeter.setTargetColor(r,g,b,a);
   }
   function SWING_METER_SET_FILL(span, state, fromTop)
   {
      this.swingMeter.setFill(span,state,fromTop);
   }
   function SWING_METER_POSITION(x, y, center)
   {
      this.swingMeter.setPosition(x,y,center);
   }
   function SWING_METER_SCALE(w, h)
   {
      this.swingMeter.setScale(w,h);
   }
   function SWING_METER_IS_TRANSITIOING()
   {
      return this.swingMeter.isTransitioing();
   }
   function SWING_METER_TRANSITION_IN()
   {
      this.swingMeter.transitionIn();
   }
   function SWING_METER_TRANSITION_OUT(duration)
   {
      this.swingMeter.transitionOut(duration);
   }
}
