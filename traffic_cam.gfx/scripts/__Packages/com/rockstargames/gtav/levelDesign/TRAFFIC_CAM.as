class com.rockstargames.gtav.levelDesign.TRAFFIC_CAM extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var DispConf;
   var TIMELINE;
   var getDisplayConfig;
   var positionToScreenLayout;
   var ref;
   var safeBottom;
   var safeLeft;
   var safeRight;
   var safeTop;
   function TRAFFIC_CAM()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.TIMELINE.DocumentClass = this;
      this.DispConf = new com.rockstargames.ui.utils.DisplayConfig();
      this.DispConf = this.getDisplayConfig(true);
   }
   function debug()
   {
      var _loc2_ = 0.15;
      this.SET_DISPLAY_CONFIG(1280,720,0.5,0.95,0.5,0.95,true,false);
      this.SET_CAM_DATE(1,12,13);
      this.SET_LAT_LONG(1,2,3,4);
      this.CONTENT.ref = this;
      this.CONTENT.onEnterFrame = function()
      {
         this.ref.update();
      };
   }
   function update()
   {
      if(Key.isDown(32))
      {
         this.PLAY_CAM_MOVIE();
      }
      if(Key.isDown(38))
      {
         this.safeTop += 5;
         this.safeLeft += 5;
         this.safeBottom -= 5;
         this.safeRight -= 5;
      }
      if(Key.isDown(40))
      {
         this.safeTop -= 5;
         this.safeLeft -= 5;
         this.safeBottom += 5;
         this.safeRight += 5;
      }
   }
   function initScreenLayout()
   {
      var _loc4_ = this.CONTENT.camMC.topDetailsMC;
      this.positionToScreenLayout(_loc4_,"xCT",true);
      var _loc6_ = this.CONTENT.camMC.topMarginMC;
      _loc6_._height = _loc4_._y + _loc4_._height + 4;
      var _loc3_ = this.CONTENT.camMC.botMarginMC;
      _loc3_._x = this.DispConf.screenWidth - _loc3_._width;
      _loc3_._height = this.DispConf.screenHeight - this.DispConf.screenHeight * this.DispConf.safeBottom + 50;
      _loc3_._y = this.DispConf.screenHeight * this.DispConf.safeBottom - 50;
      var _loc2_ = this.CONTENT.camMC.dateTF;
      _loc2_._x = this.DispConf.safeRight * this.DispConf.screenWidth - (_loc2_._width + 25);
      _loc2_._y = this.safeBottom - _loc2_._height;
      var _loc5_ = this.CONTENT.camMC.latlongTF;
      _loc5_._x = _loc2_._x;
      _loc5_._y = _loc2_._y + 24;
   }
   function PLAY_CAM_MOVIE()
   {
      this.CONTENT.camMC.play();
   }
   function SET_LAT_LONG(lat1, lat2, lon1, lon2)
   {
      var _loc2_ = "Lat : N " + lat1 + " " + lat2;
      var _loc3_ = " Lon : W " + lon1 + " " + lon2;
      this.CONTENT.camMC.latlongTF.text = _loc2_ + _loc3_;
   }
   function SET_CAM_DATE(day, hrs, min)
   {
      var _loc3_ = ["SUN","MON","TUE","WED","THURS","FRI","SAT"];
      var _loc6_ = hrs <= 9 ? "0" + hrs : String(hrs);
      var _loc4_ = min <= 9 ? "0" + min : String(min);
      var _loc7_ = _loc3_[day] + " " + _loc6_ + ":" + _loc4_;
      this.CONTENT.camMC.dateTF.text = _loc7_;
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isCircleAccept)
   {
      this.DispConf.isCircleAccept = _isCircleAccept;
      this.DispConf.isWideScreen = _isWideScreen;
      this.DispConf.safeBottom = _safeBottomPercent;
      this.DispConf.safeLeft = _safeLeftPercent;
      this.DispConf.safeRight = _safeRightPercent;
      this.DispConf.safeTop = _safeTopPercent;
      this.DispConf.screenHeight = _screenHeightPixels;
      this.DispConf.screenWidth = _screenWidthPixels;
      this.initScreenLayout();
   }
}
