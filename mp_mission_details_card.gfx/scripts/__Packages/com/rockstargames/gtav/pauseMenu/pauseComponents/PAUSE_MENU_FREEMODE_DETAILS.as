class com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_FREEMODE_DETAILS extends com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase
{
   var CONTENT;
   var defaultPlaceholderA;
   var depth;
   var gfxName;
   var imgLdr;
   var menuBlackAlphaColor;
   var model;
   var myMC;
   var scrollableContent;
   var titleFreemode;
   static var DISPLAY_TYPE_MISSION = 0;
   static var DISPLAY_TYPE_STORE = 1;
   var displayType = com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_FREEMODE_DETAILS.DISPLAY_TYPE_MISSION;
   var isStandalone = false;
   function PAUSE_MENU_FREEMODE_DETAILS()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      if(mc != undefined)
      {
         super.INITIALISE(mc);
         this.isStandalone = true;
         this.setImageLoaderInfo("mp_mission_details_card",4);
      }
      else
      {
         this.CONTENT = this.myMC;
         this.setImageLoaderInfo("PAUSE_MENU_SP_CONTENT",4);
      }
      this.titleFreemode = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeDetailsTitleItem(this.CONTENT.attachMovie("freemodeTitleItem","freemodeTitleItemMC",1));
      this.titleFreemode._y = this.CONTENT.descBG._y - this.titleFreemode.getHeight();
      this.scrollableContent = this.CONTENT.createEmptyMovieClip("scrollContent",0);
      this.scrollableContent._y = this.CONTENT.descBG._y;
      this.model = new com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeDetailsModel();
      this.model.createView(0,{id:0,x:0,y:0,rowSpacing:2,columnSpacing:0,container:this.scrollableContent,visibleItems:10,linkage:["freemodeDetailsItem"],viewMaskHeight:430,selectstyle:com.rockstargames.ui.components.GUIView.SCROLL_SELECTSTYLE});
      this.CONTENT.verifiedMC._visible = this.CONTENT.verifiedbgMC._visible = false;
      this.CONTENT._visible = false;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.descBG,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.verifiedbgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE);
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.imgPlaceholderMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_PAUSE_BG);
      this.defaultPlaceholderA = this.CONTENT.imgPlaceholderMC._alpha;
   }
   function setImageLoaderInfo(_gfxName, _depth)
   {
      this.gfxName = _gfxName;
      this.depth = _depth;
   }
   function SET_TITLE(str)
   {
      this.titleFreemode.highlightTitle(false);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.imgPlaceholderMC);
      this.CONTENT.imgPlaceholderMC._alpha = this.defaultPlaceholderA;
      this.CONTENT.imgPlaceholderMC._visible = true;
      var _loc6_ = arguments[1];
      if(_loc6_ != "")
      {
         this.titleFreemode.data = [0,0,0,0,0,0,_loc6_];
         this.titleFreemode._visible = true;
         this.CONTENT._y = 0;
      }
      else
      {
         this.titleFreemode._visible = false;
         this.CONTENT._y = -27;
      }
      var _loc9_ = arguments[2];
      var _loc7_ = arguments[3];
      var _loc5_ = arguments[4];
      var _loc10_ = 0;
      if(arguments[5] != undefined)
      {
         _loc10_ = arguments[5];
      }
      this.displayType = arguments[6];
      if(_loc6_ == "" || _loc6_ == undefined)
      {
         this.CONTENT.titleTF._visible = false;
         this.CONTENT.verifiedMC._visible = false;
      }
      else
      {
         this.CONTENT.titleTF.text = _loc6_;
         this.CONTENT.titleTF._visible = true;
         if(_loc9_ == 1)
         {
            this.CONTENT.verifiedMC._visible = this.CONTENT.verifiedbgMC._visible = true;
            com.rockstargames.gtav.Multiplayer.ROCKSTAR_VERIFIED(this.CONTENT.verifiedMC).SET_VERIFIED(1);
         }
         else if(_loc9_ == 2)
         {
            this.CONTENT.verifiedMC._visible = this.CONTENT.verifiedbgMC._visible = true;
            com.rockstargames.gtav.Multiplayer.ROCKSTAR_VERIFIED(this.CONTENT.verifiedMC).SET_VERIFIED(2);
         }
         else
         {
            this.CONTENT.verifiedMC._visible = this.CONTENT.verifiedbgMC._visible = false;
         }
      }
      var _loc3_ = this.menuBlackAlphaColor;
      var _loc12_;
      var _loc8_;
      var _loc11_;
      if(_loc7_ != undefined && _loc5_ != undefined && _loc7_ != "" && _loc5_ != "")
      {
         if(this.imgLdr == undefined)
         {
            this.imgLdr = com.rockstargames.ui.media.ImageLoaderMC(this.CONTENT.imgMC.attachMovie("GenericImageLoader","imgLdr",this.CONTENT.imgMC.getNextHighestDepth()));
         }
         _loc12_ = false;
         if(this.imgLdr.textureDict == _loc7_ && this.imgLdr.textureFilename == _loc5_)
         {
            _loc12_ = true;
         }
         else if(this.imgLdr.isLoaded)
         {
            this.imgLdr.removeTxdRef();
         }
         switch(this.displayType)
         {
            case com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_FREEMODE_DETAILS.DISPLAY_TYPE_STORE:
               this.imgLdr.init(this.gfxName,_loc7_,_loc5_,256,64,16,48);
               if(arguments[7] != undefined && arguments[8] != undefined && arguments[9] != undefined)
               {
                  _loc3_ = new com.rockstargames.ui.utils.HudColour();
                  _loc3_.r = arguments[7];
                  _loc3_.g = arguments[8];
                  _loc3_.b = arguments[9];
               }
               break;
            case com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_FREEMODE_DETAILS.DISPLAY_TYPE_MISSION:
            default:
               this.imgLdr.init(this.gfxName,_loc7_,_loc5_,288,160,0,0);
         }
         _loc8_ = String(this.imgLdr).split(".");
         _loc11_ = _loc8_.slice(_loc8_.length - this.depth).join(".");
         if(_loc10_ == 0)
         {
            this.imgLdr.addTxdRef(_loc11_,this.transitionInBitmap,this);
         }
         else
         {
            this.imgLdr.requestTxdRef(_loc11_,_loc12_,this.transitionInBitmap,this);
         }
      }
      if(this.imgLdr != undefined)
      {
         this.imgLdr._visible = false;
      }
      var _loc4_;
      var _loc0_;
      if(this.displayType != com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_FREEMODE_DETAILS.DISPLAY_TYPE_STORE)
      {
         _loc4_ = !this.CONTENT.verifiedMC._visible ? this.CONTENT.verifiedMC._y + 4.5 : this.CONTENT.verifiedMC._y + 26;
         if(arguments[10])
         {
            this.CONTENT.cmMultTF._y = _loc4_;
            this.CONTENT.cmIconMC._y = this.CONTENT.cmMultTF._y + 14;
            _loc4_ += 30;
            this.CONTENT.cmMultTF.text = arguments[10];
            this.CONTENT.cmIconMC._visible = _loc0_ = true;
            this.CONTENT.cmMultTF._visible = _loc0_;
         }
         else
         {
            this.CONTENT.cmIconMC._visible = _loc0_ = false;
            this.CONTENT.cmMultTF._visible = _loc0_;
         }
         if(arguments[9])
         {
            this.CONTENT.apMultTF._y = _loc4_;
            this.CONTENT.apIconMC._y = this.CONTENT.apMultTF._y + 14;
            _loc4_ += 30;
            this.CONTENT.apMultTF.text = arguments[9];
            this.CONTENT.apIconMC._visible = _loc0_ = true;
            this.CONTENT.apMultTF._visible = _loc0_;
         }
         else
         {
            this.CONTENT.apIconMC._visible = _loc0_ = false;
            this.CONTENT.apMultTF._visible = _loc0_;
         }
         if(arguments[7])
         {
            this.CONTENT.rpMultTF._y = _loc4_;
            this.CONTENT.rpIconMC._y = this.CONTENT.rpMultTF._y + 14;
            _loc4_ += 30;
            this.CONTENT.rpMultTF.text = arguments[7];
            this.CONTENT.rpIconMC._visible = _loc0_ = true;
            this.CONTENT.rpMultTF._visible = _loc0_;
         }
         else
         {
            this.CONTENT.rpIconMC._visible = _loc0_ = false;
            this.CONTENT.rpMultTF._visible = _loc0_;
         }
         if(arguments[8])
         {
            this.CONTENT.cashMultTF._y = _loc4_;
            this.CONTENT.cashIconMC._y = this.CONTENT.cashMultTF._y + 14;
            _loc4_ += 30;
            this.CONTENT.cashMultTF.text = arguments[8];
            this.CONTENT.cashIconMC._visible = _loc0_ = true;
            this.CONTENT.cashMultTF._visible = _loc0_;
         }
         else
         {
            this.CONTENT.cashIconMC._visible = _loc0_ = false;
            this.CONTENT.cashMultTF._visible = _loc0_;
         }
      }
      else
      {
         this.CONTENT.cmIconMC._visible = _loc0_ = false;
         this.CONTENT.cmMultTF._visible = _loc0_;
         this.CONTENT.apIconMC._visible = _loc0_ = false;
         this.CONTENT.apMultTF._visible = _loc0_;
         this.CONTENT.rpIconMC._visible = _loc0_ = false;
         this.CONTENT.rpMultTF._visible = _loc0_;
         this.CONTENT.cashIconMC._visible = _loc0_ = false;
         this.CONTENT.cashMultTF._visible = _loc0_;
      }
      com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.imgPlaceholderMC,_loc3_.r,_loc3_.g,_loc3_.b,_loc3_.a);
   }
   function transitionInBitmap()
   {
      this.imgLdr._alpha = 0;
      this.imgLdr._visible = true;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.imgLdr);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.imgPlaceholderMC);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.imgLdr,0.3,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.imgPlaceholderMC,0.3,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT,onCompleteScope:this,onComplete:this.transitionComplete});
   }
   function transitionComplete()
   {
      this.CONTENT.imgPlaceholderMC._alpha = this.defaultPlaceholderA;
      this.CONTENT.imgPlaceholderMC._visible = false;
   }
   function ON_DESTROY()
   {
      if(this.imgLdr.isLoaded == true)
      {
         this.imgLdr.removeTxdRef();
      }
      this.CONTENT._visible = false;
      if(this.imgLdr)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.imgLdr);
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.imgPlaceholderMC);
   }
   function SET_DATA_SLOT_EMPTY(viewIndex, itemIndex)
   {
      super.SET_DATA_SLOT_EMPTY(viewIndex,itemIndex);
      if(this.imgLdr.isLoaded == true)
      {
         this.imgLdr.removeTxdRef();
      }
      this.updateDescBG();
      this.CONTENT._visible = false;
   }
   function DISPLAY_VIEW(viewIndex, itemIndex)
   {
      super.DISPLAY_VIEW(viewIndex,itemIndex);
      this.updateDescBG();
      this.CONTENT._visible = true;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
   }
   function updateDescBG()
   {
      var _loc3_;
      var _loc5_;
      var _loc2_;
      var _loc6_;
      var _loc7_;
      var _loc4_;
      switch(this.displayType)
      {
         case com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_FREEMODE_DETAILS.DISPLAY_TYPE_STORE:
            this.CONTENT.descBG._height = this.scrollableContent._height;
            return;
         case com.rockstargames.gtav.pauseMenu.pauseComponents.PAUSE_MENU_FREEMODE_DETAILS.DISPLAY_TYPE_MISSION:
         default:
            _loc3_ = this.model.getCurrentView().itemList;
            _loc5_ = _loc3_.length;
            _loc2_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.singleplayer.PauseMenuFreemodeDetailsItem(_loc3_[_loc3_.length - 1]);
            _loc6_ = _loc2_.leftlabelMC.titleTF.textHeight;
            _loc7_ = 5;
            _loc4_ = 243;
            if(_loc2_.type == 5)
            {
               _loc4_ = _loc2_._y + _loc2_.leftlabelMC._y + _loc6_ + _loc7_ * 2;
            }
            else
            {
               _loc4_ = 2 + 27 * (_loc5_ - 1) + 25;
            }
            this.CONTENT.descBG._height = _loc4_;
            return;
      }
   }
   function SET_FOCUS(isFocused)
   {
      super.SET_FOCUS(isFocused);
      this.titleFreemode.highlightTitle(Boolean(isFocused));
   }
   function getKeys()
   {
      if(Key.isDown(38))
      {
         this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADUP);
      }
      else if(Key.isDown(40))
      {
         this.SET_INPUT_EVENT(com.rockstargames.ui.game.GamePadConstants.DPADDOWN);
      }
   }
   function SET_INPUT_EVENT(direction)
   {
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADUP)
      {
         this.model.prevItem();
      }
      if(direction == com.rockstargames.ui.game.GamePadConstants.DPADDOWN)
      {
         this.model.nextItem();
      }
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      this.dbg("TXD_HAS_LOADED textureDict: " + textureDict + " success: " + success + " uniqueID: " + uniqueID);
      if(success)
      {
         this.imgLdr.displayTxdResponse(textureDict,success);
      }
   }
   function TXD_ALREADY_LOADED(textureDict, uniqueID)
   {
      this.dbg("TXD_ALREADY_LOADED textureDict: " + textureDict + " uniqueID: " + uniqueID);
      this.imgLdr.displayTxdResponse(textureDict,true);
   }
   function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
   {
      this.dbg("ADD_TXD_REF_RESPONSE textureDict: " + textureDict + " uniqueID: " + uniqueID + " success: " + success);
      if(success)
      {
         this.imgLdr.displayTxdResponse(textureDict);
      }
   }
}
