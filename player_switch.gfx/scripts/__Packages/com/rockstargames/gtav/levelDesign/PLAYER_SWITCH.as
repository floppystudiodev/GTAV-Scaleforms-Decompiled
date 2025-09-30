class com.rockstargames.gtav.levelDesign.PLAYER_SWITCH extends com.rockstargames.ui.core.BaseScriptUI
{
   var CONTENT;
   var dataList;
   var hotswapchar0;
   var hotswapchar1;
   var hotswapchar2;
   var hotswapchar3;
   var loaderObject;
   var switchContainerMC;
   var switchMCList;
   var thisObj;
   var FILE_NAME = "";
   var selectedIndex = 0;
   var oldselectedIndex = -1;
   var _isVisible = false;
   var debugMPpedheadshot = false;
   function PLAYER_SWITCH()
   {
      super();
      _global.gfxExtensions = true;
      this.dataList = [];
      this.dataList[0] = [];
      this.dataList[1] = [];
      this.dataList[2] = [];
      this.dataList[3] = [];
      this.loaderObject = new Object();
   }
   function INITIALISE(mc, fileName)
   {
      this.FILE_NAME = fileName;
      super.INITIALISE(mc);
      this.switchMCList = [];
      this.addDisplay();
   }
   function addDisplay()
   {
      var _loc2_ = this.CONTENT.getNextHighestDepth();
      this.switchContainerMC = this.CONTENT.attachMovie("display","display",10);
      this.SET_SWITCH_VISIBLE(false);
      this.hotswapchar0 = com.rockstargames.gtav.levelDesign.PlayerSwitchChar(this.switchContainerMC.attachMovie("hotswapchar","hotswapchar0",100,{_x:63,_y:63}));
      this.hotswapchar1 = com.rockstargames.gtav.levelDesign.PlayerSwitchChar(this.switchContainerMC.attachMovie("hotswapchar","hotswapchar1",200,{_x:63,_y:63}));
      this.hotswapchar2 = com.rockstargames.gtav.levelDesign.PlayerSwitchChar(this.switchContainerMC.attachMovie("hotswapchar","hotswapchar2",300,{_x:63,_y:63}));
      this.hotswapchar3 = com.rockstargames.gtav.levelDesign.PlayerSwitchChar(this.switchContainerMC.attachMovie("hotswapchar","hotswapchar3",400,{_x:63,_y:63}));
      this.switchMCList = [this.hotswapchar0,this.hotswapchar1,this.hotswapchar2,this.hotswapchar3];
      this.hotswapchar0.init(0);
      this.hotswapchar1.init(1);
      this.hotswapchar2.init(2);
      this.hotswapchar3.init(3);
   }
   function renderDisplay(index)
   {
      var _loc3_;
      if(index == undefined)
      {
         this.hotswapchar0.setSlot(this.dataList[0]);
         this.hotswapchar1.setSlot(this.dataList[1]);
         this.hotswapchar2.setSlot(this.dataList[2]);
         this.hotswapchar3.setSlot(this.dataList[3]);
      }
      else
      {
         _loc3_ = this.switchMCList[index];
         _loc3_.setSlot(this.dataList[index]);
      }
   }
   function SET_SWITCH_VISIBLE(bool)
   {
      this.switchContainerMC._visible = Boolean(bool);
   }
   function SET_SWITCH_SLOT(index, stateEnum, charEnum, selected, pedheadshot_txt_string)
   {
      this.dataList[index][0] = charEnum;
      this.dataList[index][1] = stateEnum;
      this.dataList[index][2] = selected;
      if(index == 2)
      {
         if(this.dataList[index][5] != undefined)
         {
            this.dataList[index][5] = pedheadshot_txt_string;
         }
      }
      this.renderDisplay(index);
      var _loc4_ = this.switchMCList[index];
      var _loc3_ = ["","AVAILABLE","UNAVAILABLE","NOTMET"];
      _loc4_.stateMC.gotoAndStop(_loc3_[stateEnum]);
   }
   function SET_MULTIPLAYER_HEAD(_newTXD)
   {
      if(_newTXD == "director")
      {
         this.loadComponent(_newTXD,this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerPIC,true);
         return undefined;
      }
      var _loc2_;
      if(_newTXD == undefined)
      {
         _loc2_ = this.dataList[2][5];
      }
      else
      {
         _loc2_ = _newTXD;
      }
      if(this.FILE_NAME != "")
      {
         if(_loc2_ != "")
         {
            com.rockstargames.ui.game.GameInterface.call("ADD_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.FILE_NAME,_loc2_,"");
         }
      }
   }
   function SET_SWITCH_HINTED(index, hinted)
   {
      this.dataList[index][3] = hinted;
      this.renderDisplay(index);
   }
   function SET_SWITCH_HINTED_ALL(hinted0, hinted1, hinted2, hinted3)
   {
      this.dataList[0][3] = hinted0;
      this.dataList[1][3] = hinted1;
      this.dataList[2][3] = hinted2;
      this.dataList[3][3] = hinted3;
      this.renderDisplay();
   }
   function SET_PLAYER_DAMAGE(index, bVisible, bFlash)
   {
      if(bFlash == undefined)
      {
         bFlash = true;
      }
      var _loc3_ = this.switchMCList[index];
      _loc3_.showDamageIndicator(bVisible,bFlash);
   }
   function SET_SWITCH_COUNTER_ALL(count0, count1, count2, count3)
   {
      this.setMissionText(this.hotswapchar0,count0);
      this.setMissionText(this.hotswapchar1,count1);
      this.setMissionText(this.hotswapchar2,count2);
      this.setMissionText(this.hotswapchar3,count3);
   }
   function setMissionText(mc, count)
   {
      if(count < 1)
      {
         mc.counterMC._visible = false;
      }
      else
      {
         mc.counterMC._visible = true;
         mc.counterMC.labelTF.text = String(count);
      }
   }
   function SET_PLAYER_SELECTED(sindex)
   {
      this.selectedIndex = sindex;
      if(this.selectedIndex != this.oldselectedIndex)
      {
         this.hotswapchar0.highlighted(false);
         this.hotswapchar1.highlighted(false);
         this.hotswapchar2.highlighted(false);
         this.hotswapchar3.highlighted(false);
         if(sindex != -1)
         {
            this.switchMCList[this.selectedIndex].highlighted(true);
            com.rockstargames.ui.game.GameInterface.call("VIBRATE_PAD",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,100,0.08,200);
         }
      }
      this.oldselectedIndex = this.selectedIndex;
   }
   function SET_MP_LABEL(str)
   {
      if(str == "")
      {
         this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.multiplayerTF._visible = false;
         this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mp_background._visible = false;
      }
      else
      {
         this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.multiplayerTF.text = str;
         this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.multiplayerTF._visible = true;
         this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mp_background._visible = true;
      }
   }
   function GET_SWITCH_SELECTED()
   {
      return this.selectedIndex;
   }
   function ADD_TXD_REF_RESPONSE(txd, uniqueStr, success)
   {
      if(success)
      {
         this.loadComponent(txd,this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerPIC);
      }
   }
   function loadComponent(txd, target, isDirectorMode)
   {
      trace("PLAYER_SWITCH::loadComponent pic:" + this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerPIC);
      trace("PLAYER_SWITCH::loadComponent pic properties alpha:" + this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerPIC._alpha + ", visible:" + this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerPIC._visible + ", width: " + this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerPIC._width + ", height:" + this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerPIC._height);
      trace("PLAYER_SWITCH::loadComponent shadow:" + this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerShadow);
      trace("PLAYER_SWITCH::loadComponent pic properties alpha:" + this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerShadow._alpha + ", visible:" + this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerShadow._visible + ", width: " + this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerShadow._width + ", height:" + this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerShadow._height);
      if(isDirectorMode == undefined)
      {
         isDirectorMode = false;
      }
      var thisObj = this;
      this.loaderObject._depth = 100;
      this.loaderObject._mc = target;
      this.loaderObject._loader = new MovieClipLoader();
      this.loaderObject._listener = new Object();
      this.loaderObject._loader.addListener(this.loaderObject._listener);
      this.loaderObject._listener.thisObj = thisObj;
      this.loaderObject._listener.onLoadInit = function(target_mc)
      {
         var _loc2_ = this.thisObj.loaderObject;
         this.thisObj.setupMasking();
         var _loc3_ = this.thisObj.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerPIC;
         trace("PLAYER_SWITCH::loadComponent._listener pic:" + this.thisObj.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerPIC);
         trace("PLAYER_SWITCH::loadComponent._listener pic properties alpha:" + this.thisObj.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerPIC._alpha + ", visible:" + this.thisObj.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerPIC._visible + ", width: " + this.thisObj.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerPIC._width + ", height:" + this.thisObj.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerPIC._height);
         trace("PLAYER_SWITCH::loadComponent._listener shadow:" + this.thisObj.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerShadow);
         trace("PLAYER_SWITCH::loadComponent._listener pic properties alpha:" + this.thisObj.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerShadow._alpha + ", visible:" + this.thisObj.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerShadow._visible + ", width: " + this.thisObj.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerShadow._width + ", height:" + this.thisObj.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerShadow._height);
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.thisObj.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerShadow,com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_IMG_FADE_DURATION,{_alpha:0});
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.thisObj.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMC.multiplayerPIC,com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_IMG_FADE_DURATION,{_alpha:100});
         _loc3_._width = 80;
         _loc3_._height = 80;
         _loc2_._loader.removeListener(_loc2_._listener);
         _loc2_._loader = null;
      };
      var _loc3_;
      if(isDirectorMode)
      {
         _loc3_ = "img://" + this.FILE_NAME + "/" + txd;
      }
      else
      {
         _loc3_ = "img://" + txd + "/" + txd;
      }
      this.loaderObject._loader.loadClip(_loc3_,this.loaderObject._mc);
   }
   function setupMasking()
   {
      trace("PLAYER_SWITCH::setupMasking mask:" + this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMaskMC);
      trace("PLAYER_SWITCH::setupMasking mask properties alpha:" + this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMaskMC._alpha + ", visible:" + this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMaskMC._visible + ", width:" + this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMaskMC._width + ", height:" + this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMaskMC._height);
      trace("PLAYER_SWITCH::setupMasking maskee:" + this.hotswapchar2.mc.imagesMC.stateMC.mpMC);
      trace("PLAYER_SWITCH::setupMasking mask properties alpha:" + this.hotswapchar2.mc.imagesMC.stateMC.mpMC._alpha + ", visible:" + this.hotswapchar2.mc.imagesMC.stateMC.mpMC._visible + ", width:" + this.hotswapchar2.mc.imagesMC.stateMC.mpMC._width + ", height:" + this.hotswapchar2.mc.imagesMC.stateMC.mpMC._height);
      this.hotswapchar2.mc.imagesMC.stateMC.mpMC.setMask(this.switchContainerMC.hotswapchar2.mc.imagesMC.stateMC.mpMaskMC);
   }
   function debug()
   {
      this.SET_SWITCH_VISIBLE(false);
      this.SET_PLAYER_SELECTED(-1);
      this.SET_SWITCH_SLOT(0,1,2,true);
      this.SET_SWITCH_SLOT(1,3,1,false);
      this.SET_SWITCH_SLOT(2,2,3,false);
      this.SET_SWITCH_SLOT(3,3,0,false);
      this.SET_SWITCH_HINTED_ALL(false,false,false,false);
      this.SET_SWITCH_COUNTER_ALL(0,0,0,0);
      this.SET_SWITCH_VISIBLE(true);
   }
}
