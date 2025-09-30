class com.rockstargames.gtav.FrontendGen9.MEMBERSHIP extends MovieClip
{
   var _carousel;
   var _landingPage;
   var _pageList;
   var _sticker;
   var cursor;
   var imageFour;
   var imageOne;
   var imageSix;
   var imageThree;
   var imageTwo;
   var titleFour;
   var titleOne;
   var titleSix;
   var titleThree;
   var titleTwo;
   static var DPAD_DOWN = 187;
   static var DPAD_UP = 188;
   static var DPAD_LEFT = 189;
   static var DPAD_RIGHT = 190;
   static var ACCEPT = 201;
   static var CANCEL = 202;
   static var X = 203;
   static var Y = 204;
   static var LB = 205;
   static var RB = 206;
   static var LT = 207;
   static var RT = 208;
   static var LEFT_MOUSE = 237;
   static var RIGHT_MOUSE = 238;
   static var SCROLL_UP_MOUSE = 241;
   static var SCROLL_DOWN_MOUSE = 242;
   static var KEY_DOWN = 300;
   static var KEY_UP = 301;
   static var STAGE_WIDTH = 1280;
   static var STAGE_HEIGHT = 720;
   var currentPage = -1;
   function MEMBERSHIP(landingPage)
   {
      super();
      this._landingPage = landingPage;
      this._pageList = [];
   }
   function init()
   {
      this.setupCarousel();
      this.setupMainImages();
      var _loc2_ = com.rockstargames.gtav.FrontendGen9.components.Text(this._landingPage.TIMELINE.attachMovie("toolTip","toolTip",this._landingPage.TIMELINE.getNextHighestDepth(),{_x:65,_y:663}));
      _loc2_.SET_TEXT("MEMBER_BENEFITS_TIP",false);
      var _loc3_ = com.rockstargames.gtav.FrontendGen9.components.Text(this._landingPage.TIMELINE.attachMovie("title","header",this._landingPage.TIMELINE.getNextHighestDepth(),{_x:64,_y:37}));
      _loc3_.SET_TEXT("MEMBER_BENEFITS_HEADER",false);
      this.titleOne.ANIMATE_IN(1);
      this._sticker = com.rockstargames.gtav.FrontendGen9.components.StickersForMembership(this._landingPage.TIMELINE.attachMovie("stickersForMembership","stickersForMembership",this._landingPage.TIMELINE.getNextHighestDepth(),{_visible:true,_y:37}));
      this.SET_IS_MEMBERSHIP_ACTIVE(false);
      var _loc4_ = this._landingPage.TIMELINE.createEmptyMovieClip("cursor",this._landingPage.TIMELINE.getNextHighestDepth());
      var _loc5_ = this._landingPage.TIMELINE.createEmptyMovieClip("cursorDebug",this._landingPage.TIMELINE.getNextHighestDepth());
      this.cursor = new com.rockstargames.gtav.FrontendGen9.components.Cursor(_loc4_);
      this.cursor.addTarget(new com.rockstargames.gtav.FrontendGen9.components.Target(0,64,282,519,643));
      this.cursor.addTarget(new com.rockstargames.gtav.FrontendGen9.components.Target(1,297,515,519,643));
      this.cursor.addTarget(new com.rockstargames.gtav.FrontendGen9.components.Target(2,530,748,519,643));
      this.cursor.addTarget(new com.rockstargames.gtav.FrontendGen9.components.Target(3,763,981,519,643));
      this.cursor.addTarget(new com.rockstargames.gtav.FrontendGen9.components.Target(4,996,1214,519,643));
   }
   function setupCarousel()
   {
      this._landingPage._carouselController = com.rockstargames.gtav.FrontendGen9.components.Carousel(this._landingPage.TIMELINE.attachMovie("carousel","carousel",this._landingPage.TIMELINE.getNextHighestDepth(),{_x:64,_y:519}));
      this._carousel = com.rockstargames.gtav.FrontendGen9.components.Carousel(this._landingPage._carouselController);
      this._carousel.ADD_CAROUSEL_ITEM("MEMBER_BENEFITS_1_TILE","membership","MEMBERSHIP_PREVIEW_COREREWARDS",1,false);
      this._carousel.ADD_CAROUSEL_ITEM("MEMBER_BENEFITS_2_TILE","membership","MEMBERSHIP_PREVIEW_CASH",1,false);
      this._carousel.ADD_CAROUSEL_ITEM("MEMBER_BENEFITS_3_TILE","membership","MEMBERSHIP_PREVIEW_PROPERTIES",1,false);
      this._carousel.ADD_CAROUSEL_ITEM("MEMBER_BENEFITS_4_TILE","membership","MEMBERSHIP_PREVIEW_VEHICLES",1,false);
      this._carousel.ADD_CAROUSEL_ITEM("MEMBER_BENEFITS_6_TILE","membership","MEMBERSHIP_PREVIEW_ANDMORE",1,false);
      this._carousel.ANIMATE_IN(0);
      this._carousel.ANIMATE_IN(1);
      this._carousel.ANIMATE_IN(2);
      this._carousel.ANIMATE_IN(3);
      this._carousel.ANIMATE_IN(4);
      this._landingPage.SET_CAROUSEL_ITEM_STATE(0,1,true);
   }
   function setupMainImages()
   {
      this.imageOne = com.rockstargames.gtav.FrontendGen9.components.MainImage(this._landingPage.TIMELINE.attachMovie("mainImageSeries","mainImage1",this._landingPage.TIMELINE.getNextHighestDepth(),{_x:0,_y:82.6666}));
      this.imageOne.SET_IMAGE("membership","MEMBERSHIP_MAIN_COREREWARDS",true);
      this.titleOne = com.rockstargames.gtav.FrontendGen9.components.MainFeature(this._landingPage.TIMELINE.attachMovie("mainFeature","mainFeature1",this._landingPage.TIMELINE.getNextHighestDepth(),{_x:64,_y:97.3333}));
      this.titleOne.SET_FEATURE_ITEM_DETAILS("GTAO_MEM_BECOME_HEADER","GTAO_MEM_BECOME_BODY","","","",false);
      this.imageTwo = com.rockstargames.gtav.FrontendGen9.components.MainImage(this._landingPage.TIMELINE.attachMovie("mainImageSeries","mainImage2",this._landingPage.TIMELINE.getNextHighestDepth(),{_x:0,_y:82.6666,_visible:false}));
      this.imageTwo.SET_IMAGE("membership","MEMBERSHIP_MAIN_CASH",true);
      this.titleTwo = com.rockstargames.gtav.FrontendGen9.components.MainFeature(this._landingPage.TIMELINE.attachMovie("mainFeature","mainFeature2",this._landingPage.TIMELINE.getNextHighestDepth(),{_x:64,_y:97.3333,_visible:false}));
      this.titleTwo.SET_FEATURE_ITEM_DETAILS("MEMBER_BENEFITS_2_SUBHEADER","MEMBER_BENEFITS_2_DESC","","","",false);
      this.imageThree = com.rockstargames.gtav.FrontendGen9.components.MainImage(this._landingPage.TIMELINE.attachMovie("mainImageSeries","mainImage3",this._landingPage.TIMELINE.getNextHighestDepth(),{_x:0,_y:82.6666,_visible:false}));
      this.imageThree.SET_IMAGE("membership","MEMBERSHIP_MAIN_PROPERTIES",true);
      this.titleThree = com.rockstargames.gtav.FrontendGen9.components.MainFeature(this._landingPage.TIMELINE.attachMovie("mainFeature","mainFeature3",this._landingPage.TIMELINE.getNextHighestDepth(),{_x:64,_y:97.3333,_visible:false}));
      this.titleThree.SET_FEATURE_ITEM_DETAILS("MEMBER_BENEFITS_3_SUBHEADER","MEMBER_BENEFITS_3_DESC","","","",false);
      this.imageFour = com.rockstargames.gtav.FrontendGen9.components.MainImage(this._landingPage.TIMELINE.attachMovie("mainImageSeries","mainImage4",this._landingPage.TIMELINE.getNextHighestDepth(),{_x:0,_y:82.6666,_visible:false}));
      this.imageFour.SET_IMAGE("membership","MEMBERSHIP_MAIN_VEHICLES",true);
      this.titleFour = com.rockstargames.gtav.FrontendGen9.components.MainFeature(this._landingPage.TIMELINE.attachMovie("mainFeature","mainFeature4",this._landingPage.TIMELINE.getNextHighestDepth(),{_x:64,_y:97.3333,_visible:false}));
      this.titleFour.SET_FEATURE_ITEM_DETAILS("MEMBER_BENEFITS_4_SUBHEADER","MEMBER_BENEFITS_4_DESC","","","",false);
      this.imageSix = com.rockstargames.gtav.FrontendGen9.components.MainImage(this._landingPage.TIMELINE.attachMovie("mainImageSeries","mainImage6",this._landingPage.TIMELINE.getNextHighestDepth(),{_x:0,_y:82.6666,_visible:false}));
      this.imageSix.SET_IMAGE("membership","MEMBERSHIP_MAIN_ANDMORE",true);
      this.titleSix = com.rockstargames.gtav.FrontendGen9.components.MainFeature(this._landingPage.TIMELINE.attachMovie("mainFeature","mainFeature6",this._landingPage.TIMELINE.getNextHighestDepth(),{_x:64,_y:97.3333,_visible:false}));
      this.titleSix.SET_FEATURE_ITEM_DETAILS("MEMBER_BENEFITS_6_SUBHEADER","MEMBER_BENEFITS_6_DESC","","","",false);
      this.titleOne.mainFeatureDescription._y = 80;
      this.titleTwo.mainFeatureDescription._y = 80;
      this.titleThree.mainFeatureDescription._y = 80;
      this.titleFour.mainFeatureDescription._y = 80;
      this.titleSix.mainFeatureDescription._y = 80;
      this._pageList.push([this.imageOne,this.titleOne]);
      this._pageList.push([this.imageTwo,this.titleTwo]);
      this._pageList.push([this.imageThree,this.titleThree]);
      this._pageList.push([this.imageFour,this.titleFour]);
      this._pageList.push([this.imageSix,this.titleSix]);
   }
   function SET_INPUT_EVENT(padID)
   {
      switch(padID)
      {
         case com.rockstargames.gtav.FrontendGen9.MEMBERSHIP.DPAD_LEFT:
            this._carousel.NAV_LEFT();
            this.SHOW_PAGE(this._carousel.GET_INDEX());
            break;
         case com.rockstargames.gtav.FrontendGen9.MEMBERSHIP.DPAD_RIGHT:
            this._carousel.NAV_RIGHT();
            this.SHOW_PAGE(this._carousel.GET_INDEX());
            break;
         case com.rockstargames.gtav.FrontendGen9.MEMBERSHIP.CANCEL:
            com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"BACK","HUD_FRONTEND_DEFAULT_SOUNDSET");
         default:
            return;
      }
   }
   function SET_MOUSE_INPUT(x, y)
   {
      x *= com.rockstargames.gtav.FrontendGen9.MEMBERSHIP.STAGE_WIDTH;
      y *= com.rockstargames.gtav.FrontendGen9.MEMBERSHIP.STAGE_HEIGHT;
      this.cursor.snapTo(x,y);
      var _loc2_ = this.cursor.getTargetUnderCursor();
      if(_loc2_ != null && _loc2_.id != this._carousel.GET_INDEX())
      {
         while(this._carousel.GET_INDEX() < _loc2_.id)
         {
            this._carousel.NAV_RIGHT();
         }
         while(this._carousel.GET_INDEX() > _loc2_.id)
         {
            this._carousel.NAV_LEFT();
         }
         this.SHOW_PAGE(this._carousel.GET_INDEX());
      }
   }
   function SHOW_PAGE(pageID)
   {
      var _loc3_;
      if(this.currentPage != pageID)
      {
         this.currentPage = pageID;
         com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"NAV_LEFT_RIGHT","HUD_FRONTEND_DEFAULT_SOUNDSET");
         this._pageList[0][0]._visible = false;
         this._pageList[1][0]._visible = false;
         this._pageList[2][0]._visible = false;
         this._pageList[3][0]._visible = false;
         this._pageList[4][0]._visible = false;
         this._pageList[0][1]._visible = false;
         this._pageList[1][1]._visible = false;
         this._pageList[2][1]._visible = false;
         this._pageList[3][1]._visible = false;
         this._pageList[4][1]._visible = false;
         this._pageList[pageID][0]._visible = true;
         this._pageList[pageID][1]._visible = true;
         _loc3_ = com.rockstargames.gtav.FrontendGen9.components.MainImage(this._pageList[pageID][0]);
         _loc3_.rearrangeContent();
      }
   }
   function SET_IS_MEMBERSHIP_ACTIVE(isActive)
   {
      if(isActive)
      {
         this.ADD_STICKER(9,"GTAO_MEM_STATUS_JOINED");
         this.titleOne.SET_FEATURE_ITEM_DETAILS("GTAO_MEM_JOINED_HEADER","GTAO_MEM_JOINED_BODY","","","",false);
      }
      else
      {
         this.ADD_STICKER(com.rockstargames.gtav.FrontendGen9.components.StickerTypeData.NON_MEMBER,"GTA_MEM_STATUS_NOTJOINED");
         this.titleOne.SET_FEATURE_ITEM_DETAILS("GTAO_MEM_BECOME_HEADER","GTAO_MEM_BECOME_BODY","","","",false);
      }
   }
   function ADD_STICKER(id, str)
   {
      this._sticker.SET_TYPE_AND_TEXT(id,str);
      this._sticker._visible = true;
      this._sticker._x = 1220 - this._sticker.getStickerWidth();
   }
   function REMOVE_STICKER()
   {
      this._sticker._visible = false;
   }
}
