class com.rockstargames.gtav.levelDesign.POPUP_WARNING extends com.rockstargames.gtav.levelDesign.INSTRUCTIONAL_BUTTONS
{
   var CONTENT;
   var DispConf;
   var _componentsForLoadingImages;
   var componentID;
   var itemContainer;
   var loaderObject;
   var thisObj;
   var fadeSpeed = 300;
   var sitemList = new Array();
   function POPUP_WARNING()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.CONTENT.warningMC.innerMC.main_image._visible = false;
      this.CONTENT._alpha = 0;
   }
   function debug()
   {
   }
   function SHOW_POPUP_WARNING(msecs, titleMsg, warningMsg, promptMsg, showBg, alertType, errorMsg)
   {
      this.CONTENT.warningMC.innerMC._visible = false;
      this.CONTENT.calibrationMC._visible = false;
      var _loc6_ = 0;
      var _loc7_ = 1;
      var _loc11_;
      var _loc9_;
      var _loc4_;
      var _loc8_;
      var _loc12_;
      var _loc5_;
      if(alertType == _loc6_ || alertType == undefined)
      {
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.warningMC.innerMC.strapBGMC.topLineMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.warningMC.innerMC.strapBGMC.centralBGMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.warningMC.innerMC.strapBGMC.bottomLineMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         if(titleMsg == undefined || titleMsg == "")
         {
            titleMsg = "alert!";
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.CONTENT.warningMC.innerMC.titleTF,"GLOBAL_ALERT_DEFAULT");
         }
         else
         {
            this.CONTENT.warningMC.innerMC.titleTF.htmlText = titleMsg;
         }
         this.CONTENT.warningMC.innerMC.titleTF.textAutoSize = "shrink";
         this.CONTENT.warningMC.innerMC.titleTF.antiAliasType = "normal";
         this.CONTENT.warningMC.innerMC.titleTF._width = 900;
         this.CONTENT.warningMC.innerMC.titleTF._x = - this.CONTENT.warningMC.innerMC.titleTF._width * 0.5;
         this.CONTENT.warningMC.innerMC._visible = true;
         this.CONTENT.warningMC.innerMC.main_image._y = 0;
         this.CONTENT.warningMC.innerMC.titleTF._y = 150;
         if(warningMsg != undefined)
         {
            this.CONTENT.warningMC.innerMC.labelTF._y = this.CONTENT.warningMC.innerMC.titleTF._y + this.CONTENT.warningMC.innerMC.titleTF.textHeight + 16;
            this.CONTENT.warningMC.innerMC.labelTF.autoSize = "center";
            this.CONTENT.warningMC.innerMC.labelTF.multiline = true;
            _loc11_ = new com.rockstargames.ui.utils.Text();
            this.CONTENT.warningMC.innerMC.buttonClip.removeMovieClip();
            _loc9_ = this.CONTENT.warningMC.innerMC.createEmptyMovieClip("buttonClip",this.CONTENT.warningMC.innerMC.getNextHighestDepth());
            _loc11_.setTextWithIcons(warningMsg,_loc9_,this.CONTENT.warningMC.innerMC.labelTF,0,18,1.5,true);
            if(titleMsg == undefined || titleMsg == "")
            {
               this.CONTENT.warningMC.innerMC.labelTF._y = this.CONTENT.warningMC.innerMC.titleTF + this.CONTENT.warningMC.innerMC.titleTF.textHeight;
            }
         }
         if(promptMsg != undefined)
         {
            this.CONTENT.warningMC.innerMC.labelTF.htmlText += promptMsg;
         }
         this.CONTENT.warningMC.errorTF.autoSize = "left";
         if(errorMsg != undefined)
         {
            this.CONTENT.warningMC.errorTF.text = errorMsg;
            this.CONTENT.warningMC.errorTF._x = this.DispConf.safeLeft != 0 ? 1280 * this.DispConf.safeLeft - 640 : -630;
            this.CONTENT.warningMC.errorTF._y = this.DispConf.safeBottom != 0 ? 720 * this.DispConf.safeBottom - 24 : 686;
         }
         else
         {
            this.CONTENT.warningMC.errorTF.text = "";
         }
         this.CONTENT.warningMC.innerMC._y = 0;
         _loc4_ = 21;
         _loc8_ = 100;
         this.CONTENT.warningMC.innerMC.strapBGMC._width = this.CONTENT.warningMC.innerMC.labelTF.textWidth + _loc8_;
         this.CONTENT.warningMC.innerMC.strapBGMC._height = this.CONTENT.warningMC.innerMC.labelTF.textHeight + _loc4_;
         this.CONTENT.warningMC.innerMC.strapBGMC._y = this.CONTENT.warningMC.innerMC.labelTF._y - 7;
         _loc12_ = 12;
         _loc5_ = this.CONTENT.warningMC.innerMC._height + this.CONTENT.warningMC.innerMC.titleTF._y + _loc12_;
         this.CONTENT.warningMC.innerMC._y = (720 - _loc5_) * 0.5;
      }
      if(alertType == _loc7_)
      {
         this.CONTENT.calibrationMC._visible = true;
         if(titleMsg != undefined && titleMsg != "")
         {
            this.CONTENT.calibrationMC.titleTF.htmlText = titleMsg;
            this.CONTENT.calibrationMC.labelTF.autoSize = "center";
            this.CONTENT.calibrationMC.labelTF.multiline = true;
         }
         if(warningMsg != undefined && warningMsg != "")
         {
            _loc11_ = new com.rockstargames.ui.utils.Text();
            this.CONTENT.calibrationMC.buttonClip.removeMovieClip();
            _loc9_ = this.CONTENT.calibrationMC.createEmptyMovieClip("buttonClip",this.CONTENT.calibrationMC.getNextHighestDepth());
            _loc11_.setTextWithIcons(warningMsg,_loc9_,this.CONTENT.calibrationMC.calibrationTF,0,15,0,true);
            this.CONTENT.calibrationMC.calibrationTF.autoSize = "center";
            this.CONTENT.calibrationMC.calibrationTF.multiline = true;
         }
      }
      this.CONTENT.bgMC._visible = showBg;
      this.CONTENT._alpha = 100;
      this.repositionListY();
   }
   function HIDE_POPUP_WARNING(msecs)
   {
      this.CONTENT.bgMC._visible = true;
      this.CONTENT._alpha = 0;
   }
   function SET_LIST_ROW(index, name, cash, rp, lvl, colour)
   {
      var _loc2_;
      var _loc3_;
      if(!this.itemContainer)
      {
         _loc2_ = this.CONTENT.warningMC.innerMC;
         _loc3_ = _loc2_.getNextHighestDepth();
         this.itemContainer = _loc2_.createEmptyMovieClip("itemContainerMC",_loc3_);
         this.sitemList = [];
      }
      var _loc5_ = this.sitemList.length;
      var _loc4_ = this.itemContainer.attachMovie("menuItems","menuItemsMC",_loc5_);
      _loc4_._y = _loc5_ * 27;
      com.rockstargames.ui.utils.UIText.setSizedText(_loc4_.textMC.nameTF,name,true,false,18,18);
      com.rockstargames.ui.utils.UIText.setSizedText(_loc4_.textMC.cashTF,"$" + cash,true);
      com.rockstargames.ui.utils.UIText.setSizedText(_loc4_.textMC.rankTF,"RP " + rp,true);
      com.rockstargames.ui.utils.UIText.setSizedText(_loc4_.levelTF,String(lvl),true,false,22,22);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc4_.rankMC.innerMC,colour);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc4_.rankMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
      this.sitemList.push({mc:_loc4_,i:index});
      this.repositionListGroup();
      this.repositionListY();
   }
   function SET_LIST_ITEMS(highlightIndex)
   {
      this.repositionListY();
      this.SET_LIST_HIGHLIGHT(highlightIndex);
   }
   function REMOVE_LIST_ITEMS()
   {
      var _loc2_ = 0;
      var _loc4_;
      var _loc3_;
      while(_loc2_ < this.sitemList.length)
      {
         _loc4_ = this.sitemList[_loc2_];
         _loc3_ = _loc4_.mc;
         _loc3_.removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      this.itemContainer.removeMovieClip();
      this.sitemList = [];
   }
   function repositionListY()
   {
      var _loc2_;
      if(this.itemContainer)
      {
         _loc2_ = this.CONTENT.warningMC.innerMC.strapBGMC._y + this.CONTENT.warningMC.innerMC.strapBGMC._height;
         this.itemContainer._y = _loc2_ + 12;
      }
   }
   function repositionListGroup()
   {
      var _loc2_ = 0;
      var _loc3_;
      var _loc5_;
      var _loc4_;
      var _loc6_;
      while(_loc2_ < this.sitemList.length)
      {
         _loc3_ = this.sitemList[_loc2_];
         _loc5_ = _loc3_.mc;
         _loc4_ = _loc2_ * 27;
         _loc6_ = 4 * _loc3_.i;
         _loc4_ += _loc6_;
         _loc5_._y = _loc4_;
         _loc2_ = _loc2_ + 1;
      }
   }
   function SET_LIST_HIGHLIGHT(highlightIndex)
   {
      var _loc3_ = 0;
      var _loc4_;
      var _loc2_;
      while(_loc3_ < this.sitemList.length)
      {
         _loc4_ = this.sitemList[_loc3_];
         _loc2_ = _loc4_.mc;
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2_.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
         com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc2_.textMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK);
         _loc2_.bgMC._alpha = _loc4_.i != highlightIndex ? 20 : 100;
         _loc3_ = _loc3_ + 1;
      }
   }
   function SET_ALERT_IMAGE(txd, texture)
   {
      this.CONTENT.warningMC.innerMC.main_image.highlight._visible = false;
      if(this._componentsForLoadingImages != undefined)
      {
         this._componentsForLoadingImages = [];
      }
      this.loadTextureIntoMovieClip(txd,texture,this.CONTENT.warningMC.innerMC.main_image.placeholder);
   }
   function SET_ALERT_IMAGE_WITH_GANG_HIGHLIGHT(txd, texture, gangEnum, r, g, b)
   {
      this.CONTENT.warningMC.innerMC.main_image.highlight._visible = true;
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.warningMC.innerMC.main_image.highlight,r,g,b,100);
      if(this._componentsForLoadingImages != undefined)
      {
         this._componentsForLoadingImages = [];
      }
      this.loadTextureIntoMovieClip(txd,texture,this.CONTENT.warningMC.innerMC.main_image.placeholder);
   }
   function loadTextureIntoMovieClip(txd, texture, targetLoadedInto)
   {
      this.CONTENT.warningMC.innerMC.main_image._visible = true;
      var _loc3_;
      var _loc2_;
      var _loc5_;
      if(txd != "" && texture != "")
      {
         var thisObj = this;
         _loc3_ = this._componentsForLoadingImages.length + 1;
         _loc2_ = new com.rockstargames.ui.core.BaseComponentInfo(_loc3_);
         this._componentsForLoadingImages[_loc3_] = _loc3_;
         _loc2_._depth = _loc3_ + 10;
         _loc2_._mc = targetLoadedInto;
         _loc2_._loader = new MovieClipLoader();
         _loc2_._listener = new Object();
         _loc2_._loader.addListener(this.loaderObject._listener);
         _loc2_._listener.thisObj = thisObj;
         _loc2_._listener.componentID = _loc3_;
         _loc2_._listener.onLoadInit = function(target_mc)
         {
            var _loc2_ = this.thisObj._componentsForLoadingImages[this.componentID];
            _loc2_._loader.removeListener(_loc2_._listener);
            _loc2_._loader = null;
         };
         _loc5_ = "img://" + txd + "/" + texture;
         _loc2_._loader.loadClip(_loc5_,_loc2_._mc);
      }
   }
}
