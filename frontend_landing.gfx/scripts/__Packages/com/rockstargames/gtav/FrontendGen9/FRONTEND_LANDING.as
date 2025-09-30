class com.rockstargames.gtav.FrontendGen9.FRONTEND_LANDING extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _carouselController;
   var _mainFeature;
   var _memberSticker;
   var _membership;
   var _name;
   var _tabController;
   var _tempGridArray;
   var _tmpCareerItems;
   var config;
   var getDisplayConfig;
   var hasRequestedMembershipTXD = false;
   static var IS_PC = false;
   function FRONTEND_LANDING()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "FRONTEND_LANDING";
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.config = this.getDisplayConfig(true);
      com.rockstargames.gtav.FrontendGen9.components.Text.isAsian = this.config.isAsian;
      this._memberSticker = com.rockstargames.gtav.FrontendGen9.components.Sticker(this.TIMELINE.attachMovie("stickersForMembers","stickersForMembers",this.TIMELINE.getNextHighestDepth(),{_visible:false,_y:37}));
   }
   function ADD_TXD_REF_RESPONSE(textureDict, success)
   {
   }
   function test()
   {
      com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"FRONTEND_LANDING","FRONTEND_LANDING_BASE",667,true);
   }
   function TXD_HAS_LOADED()
   {
      if(this.hasRequestedMembershipTXD)
      {
         this._membership.init();
      }
      else
      {
         this.debug();
      }
      this.hasRequestedMembershipTXD = false;
   }
   function TXD_ALREADY_LOADED()
   {
   }
   function debug()
   {
      this._tempGridArray = [];
      this._tmpCareerItems = [];
   }
   function SHOW_MEMBER_STICKER(id, str)
   {
      if(id > -1)
      {
         this._memberSticker.SET_TYPE_AND_TEXT(id,str,this.config.isAsian);
         this._memberSticker._visible = true;
         this._memberSticker._x = 1220 - this._memberSticker.getStickerWidth();
      }
      else
      {
         this._memberSticker._visible = false;
      }
   }
   function SET_GRIDITEM_STATE(whichItem, state)
   {
      var _loc2_ = com.rockstargames.gtav.FrontendGen9.components.GridItem(this._tempGridArray[whichItem]);
      _loc2_.SET_STATE(state);
   }
   function SET_CAREERITEM_STATE(whichItem, state)
   {
      var _loc2_ = com.rockstargames.gtav.FrontendGen9.components.CareersItem(this._tmpCareerItems[whichItem]);
      _loc2_.SET_STATE(state);
   }
   function UNHIGHLIGHT_ALL_TABS()
   {
      this._tabController.UNHIGHLIGHT_ALL_TABS();
   }
   function SET_TAB_STATE(whichTab, state, enabled)
   {
      this._tabController.SET_TAB_STATE(whichTab,state,enabled);
   }
   function UNHIGHLIGHT_ALL_CAROUSEL_ITEMS()
   {
      this._carouselController.UNHIGHLIGHT_ALL_CAROUSEL_ITEMS();
   }
   function SET_CAROUSEL_ITEM_STATE(whichItem, state, enabled)
   {
      this._carouselController.SET_CAROUSEL_ITEM_STATE(whichItem,state);
      this._carouselController.SET_CAROUSEL_ITEM_ENABLED(whichItem,enabled);
   }
   function NAV_RIGHT()
   {
      this._carouselController.NAV_RIGHT();
   }
   function NAV_LEFT()
   {
      this._carouselController.NAV_LEFT();
   }
   function CLEAR_STATS()
   {
      this._mainFeature.CLEAR_STATS();
   }
   function UPDATE_ITEM_TEXTURE()
   {
      this._carouselController.UPDATE_ITEM_TEXTURE(2,"FRONTEND_LANDING_TEMP","whatsnew");
   }
   function CLEAR_ALL_ITEMS()
   {
      this._carouselController.CLEAR_ALL_ITEMS();
   }
   function DISPLAY_MEMBERSHIP()
   {
      this._membership = new com.rockstargames.gtav.FrontendGen9.MEMBERSHIP(this);
      this.hasRequestedMembershipTXD = true;
      com.rockstargames.gtav.FrontendGen9.components.Text.MEMBERSHIP_MODE = true;
      this._tempGridArray = [];
      this._tmpCareerItems = [];
      com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"FRONTEND_LANDING","membership",667,true);
   }
   function SET_INPUT_EVENT(padID)
   {
      this._membership.SET_INPUT_EVENT(padID);
   }
   function SET_MOUSE_INPUT(x, y)
   {
      this._membership.SET_MOUSE_INPUT(x,y);
   }
   function SET_IS_MEMBERSHIP_ACTIVE(isActive)
   {
      this._membership.SET_IS_MEMBERSHIP_ACTIVE(isActive);
   }
   function SET_IS_PC(isPC)
   {
      com.rockstargames.gtav.FrontendGen9.FRONTEND_LANDING.IS_PC = isPC;
      if(this._tabController)
      {
         this._tabController.SET_IS_PC(isPC);
      }
   }
}
