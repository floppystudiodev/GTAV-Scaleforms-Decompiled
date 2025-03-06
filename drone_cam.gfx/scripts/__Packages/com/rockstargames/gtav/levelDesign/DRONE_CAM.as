class com.rockstargames.gtav.levelDesign.DRONE_CAM extends com.rockstargames.ui.core.BaseScreenLayout
{
   var soundWave;
   var CONTENT;
   var zoomMeter;
   var headingMeter;
   var shockMeter;
   var detonateMeter;
   var tranquilizeMeter;
   var boostMeter;
   var missileMeter;
   var empMeter;
   var machineGunMeter;
   var cannonMeter;
   var infoList;
   var reticle;
   var warning;
   static var displayConfig;
   static var STAGE_WIDTH = 1280;
   static var STAGE_HEIGHT = 720;
   function DRONE_CAM()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      com.rockstargames.gtav.levelDesign.DRONE_CAM.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,com.rockstargames.gtav.levelDesign.DRONE_CAM.displayConfig);
      this.initLayout();
      this.soundWave = new com.rockstargames.gtav.levelDesign.droneCam.SoundWave(this.CONTENT.soundWave,false);
      this.zoomMeter = new com.rockstargames.gtav.levelDesign.droneCam.ZoomMeter(this.CONTENT.zoomMeter,false);
      this.headingMeter = new com.rockstargames.gtav.levelDesign.droneCam.HeadingMeter(this.CONTENT.headingMeter,false);
      this.shockMeter = new com.rockstargames.gtav.levelDesign.droneCam.ChargingMeter(this.CONTENT.shockMeter,false,"DRONE_SHOCK");
      this.detonateMeter = new com.rockstargames.gtav.levelDesign.droneCam.ChargingMeter(this.CONTENT.detonateMeter,false,"DRONE_DETONATE");
      this.tranquilizeMeter = new com.rockstargames.gtav.levelDesign.droneCam.ChargingMeter(this.CONTENT.tranquilizeMeter,false,"DRONE_TRANQUILIZE");
      this.boostMeter = new com.rockstargames.gtav.levelDesign.droneCam.ChargingMeter(this.CONTENT.boostMeter,false,"DRONE_BOOST");
      this.missileMeter = new com.rockstargames.gtav.levelDesign.droneCam.ChargingMeter(this.CONTENT.missileMeter,false,"DRONE_MISSILE");
      this.empMeter = new com.rockstargames.gtav.levelDesign.droneCam.ChargingMeter(this.CONTENT.empMeter,false,"DRONE_EMP");
      this.machineGunMeter = new com.rockstargames.gtav.levelDesign.droneCam.ChargingMeter(this.CONTENT.machineGunMeter,false,"DRONE_MG","DRONE_HEAT","DRONE_COOL");
      this.cannonMeter = new com.rockstargames.gtav.levelDesign.droneCam.ChargingMeter(this.CONTENT.cannonMeter,false,"DRONE_CAN","DRONE_RELOAD","DRONE_RELOAD");
      this.infoList = new com.rockstargames.gtav.levelDesign.droneCam.PersonalInfoList(this.CONTENT.infoList,false,this.CONTENT.infoListLine);
      this.reticle = new com.rockstargames.gtav.levelDesign.droneCam.Reticle(this.CONTENT.reticle,false);
      this.warning = new com.rockstargames.gtav.levelDesign.droneCam.Warning(this.CONTENT.warning,false,"DRONE_WARN");
   }
   function initLayout()
   {
      var _loc2_ = com.rockstargames.gtav.levelDesign.DRONE_CAM.STAGE_WIDTH * com.rockstargames.gtav.levelDesign.DRONE_CAM.displayConfig.safeLeft;
      this.CONTENT.topLeft._x = _loc2_;
      this.CONTENT.bottomLeft._x = _loc2_;
      this.CONTENT.topRight._x = com.rockstargames.gtav.levelDesign.DRONE_CAM.STAGE_WIDTH - _loc2_;
      this.CONTENT.bottomRight._x = com.rockstargames.gtav.levelDesign.DRONE_CAM.STAGE_WIDTH - _loc2_;
      this.CONTENT.bottomLine._x = _loc2_;
      this.CONTENT.bottomLine._width = com.rockstargames.gtav.levelDesign.DRONE_CAM.STAGE_WIDTH - _loc2_ - _loc2_;
      this.CONTENT.zoomMeter._x = _loc2_;
      this.CONTENT.shockMeter._x = com.rockstargames.gtav.levelDesign.DRONE_CAM.STAGE_WIDTH - _loc2_ - this.CONTENT.shockMeter._width;
      this.CONTENT.detonateMeter._x = com.rockstargames.gtav.levelDesign.DRONE_CAM.STAGE_WIDTH - _loc2_ - this.CONTENT.detonateMeter._width;
      this.CONTENT.tranquilizeMeter._x = com.rockstargames.gtav.levelDesign.DRONE_CAM.STAGE_WIDTH - _loc2_ - this.CONTENT.tranquilizeMeter._width;
      this.CONTENT.boostMeter._x = com.rockstargames.gtav.levelDesign.DRONE_CAM.STAGE_WIDTH - _loc2_ - this.CONTENT.boostMeter._width;
      this.CONTENT.missileMeter._x = com.rockstargames.gtav.levelDesign.DRONE_CAM.STAGE_WIDTH - _loc2_ - this.CONTENT.missileMeter._width;
      this.CONTENT.empMeter._x = com.rockstargames.gtav.levelDesign.DRONE_CAM.STAGE_WIDTH - _loc2_ - this.CONTENT.empMeter._width;
      this.CONTENT.machineGunMeter._x = com.rockstargames.gtav.levelDesign.DRONE_CAM.STAGE_WIDTH - _loc2_ - this.CONTENT.machineGunMeter._width;
      this.CONTENT.cannonMeter._x = com.rockstargames.gtav.levelDesign.DRONE_CAM.STAGE_WIDTH - _loc2_ - this.CONTENT.cannonMeter._width;
      this.CONTENT.infoList._x = com.rockstargames.gtav.levelDesign.DRONE_CAM.STAGE_WIDTH - _loc2_ - this.CONTENT.infoList._width;
      this.CONTENT.infoListLine.mask._width = this.CONTENT.infoList._x - this.CONTENT.infoListLine._x + 2;
      this.CONTENT.headingMeter.mask._width = com.rockstargames.gtav.levelDesign.DRONE_CAM.STAGE_WIDTH - 2 * (_loc2_ + this.CONTENT.topLeft._width + 20);
   }
   static function setLocalisedText(tf, label, letterSpacing)
   {
      var _loc2_ = tf.getNewTextFormat();
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      if(letterSpacing != undefined)
      {
         _loc2_.letterSpacing = letterSpacing;
         tf.setTextFormat(_loc2_);
      }
      return tf.text;
   }
   function SET_RETICLE_IS_VISIBLE(isVisible)
   {
      this.reticle.visible = isVisible;
   }
   function SET_ZOOM_METER_IS_VISIBLE(isVisible)
   {
      this.zoomMeter.visible = isVisible;
   }
   function SET_HEADING_METER_IS_VISIBLE(isVisible)
   {
      this.headingMeter.visible = isVisible;
   }
   function SET_SHOCK_METER_IS_VISIBLE(isVisible)
   {
      this.shockMeter.visible = isVisible;
   }
   function SET_DETONATE_METER_IS_VISIBLE(isVisible)
   {
      this.detonateMeter.visible = isVisible;
   }
   function SET_TRANQUILIZE_METER_IS_VISIBLE(isVisible)
   {
      this.tranquilizeMeter.visible = isVisible;
   }
   function SET_BOOST_METER_IS_VISIBLE(isVisible)
   {
      this.boostMeter.visible = isVisible;
   }
   function SET_MISSILE_METER_IS_VISIBLE(isVisible)
   {
      this.missileMeter.visible = isVisible;
   }
   function SET_EMP_METER_IS_VISIBLE(isVisible)
   {
      this.empMeter.visible = isVisible;
   }
   function SET_CANNON_METER_IS_VISIBLE(isVisible)
   {
      this.cannonMeter.visible = isVisible;
   }
   function SET_MG_METER_IS_VISIBLE(isVisible)
   {
      this.machineGunMeter.visible = isVisible;
   }
   function SET_INFO_LIST_IS_VISIBLE(isVisible)
   {
      this.infoList.visible = isVisible;
      this.CONTENT.infoListLine._visible = isVisible;
   }
   function SET_SOUND_WAVE_IS_VISIBLE(isVisible)
   {
      this.soundWave.visible = isVisible;
   }
   function SET_BOTTOM_LEFT_CORNER_IS_VISIBLE(isVisible)
   {
      this.CONTENT.bottomLine._visible = isVisible;
      this.CONTENT.bottomLeft._visible = isVisible;
   }
   function SET_WARNING_IS_VISIBLE(isVisible)
   {
      this.warning.visible = isVisible;
   }
   function SET_STRIPES_VISIBLE(isVisible)
   {
      this.CONTENT.stripes._visible = isVisible;
   }
   function SET_RETICLE_CURVES_VISIBLE(isVisible)
   {
      this.CONTENT.reticle.leftCurve._visible = isVisible;
      this.CONTENT.reticle.rightCurve._visible = isVisible;
   }
   function SET_ZOOM_LABEL(index, label)
   {
      this.zoomMeter.setLabel(index,label);
   }
   function SET_ZOOM(level)
   {
      this.zoomMeter.zoomLevel = level;
   }
   function SET_HEADING(angle)
   {
      this.headingMeter.heading = angle;
   }
   function SET_SHOCK_PERCENTAGE(percent)
   {
      this.shockMeter.chargePercent = percent;
   }
   function SET_DETONATE_PERCENTAGE(percent)
   {
      this.detonateMeter.chargePercent = percent;
   }
   function SET_TRANQUILIZE_PERCENTAGE(percent)
   {
      this.tranquilizeMeter.chargePercent = percent;
   }
   function SET_BOOST_PERCENTAGE(percent)
   {
      this.boostMeter.chargePercent = percent;
   }
   function SET_MISSILE_PERCENTAGE(percent)
   {
      this.missileMeter.chargePercent = percent;
   }
   function SET_EMP_PERCENTAGE(percent)
   {
      this.empMeter.chargePercent = percent;
   }
   function SET_MG_PERCENTAGE(percent)
   {
      this.machineGunMeter.chargePercent = percent;
   }
   function SET_CANNON_PERCENTAGE(percent)
   {
      this.cannonMeter.chargePercent = percent;
   }
   function SET_CANNON_NAME(name)
   {
      this.CONTENT.cannonMeter.title.verticalAlign = "center";
      this.CONTENT.cannonMeter.title.text = name;
      var _loc2_ = this.CONTENT.cannonMeter.title.getNewTextFormat();
      _loc2_.letterSpacing = 3;
      this.CONTENT.cannonMeter.title.setTextFormat(_loc2_);
   }
   function SET_CANNON_LABEL(label)
   {
      this.cannonMeter.overrideReadyLabel(label);
   }
   function SET_INFO_LIST_DATA(rank, earnings, kills, deaths, vehicle, accuracy, radioStation, weapon, privateDances, numHoes, gamertag)
   {
      this.infoList.setData(rank,earnings,kills,deaths,vehicle,accuracy,radioStation,weapon,privateDances,numHoes,gamertag);
   }
   function ATTENUATE_SOUND_WAVE(scalar)
   {
      this.soundWave.attenuate(scalar);
   }
   function SET_RETICLE_PERCENTAGE(percent)
   {
      this.reticle.fillPercent = percent;
   }
   function SET_RETICLE_ON_TARGET(isOnTarget, colour)
   {
      this.reticle.isOnTarget = isOnTarget;
      if(colour != undefined)
      {
         this.reticle.colour = colour;
      }
   }
   function SET_RETICLE_STATE(state)
   {
      this.reticle.state = state;
   }
   function SET_RETICLE_OUTER_LINES_VISIBLE(visible)
   {
      this.reticle.outerLinesVisible = visible;
   }
   function SET_WARNING_FLASH_RATE(normRate)
   {
      this.warning.flashRate = normRate;
   }
}
