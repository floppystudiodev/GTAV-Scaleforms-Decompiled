class com.rockstargames.gtav.web.WWW_FAMEORSHAME_NET extends com.rockstargames.gtav.web.GENERIC_WEBSITE_SCRIPT
{
   var CONTENT;
   var OnColour;
   var browser;
   var dataProviderUI;
   var dataTextScope;
   var defaultButtonOnColour;
   var mcScope;
   var videoDisabled = false;
   function WWW_FAMEORSHAME_NET()
   {
      super();
   }
   function DISABLE_VIDEO(disableVideo)
   {
      this.videoDisabled = disableVideo;
      if(this.videoDisabled == undefined)
      {
         this.videoDisabled = true;
      }
   }
   function POPULATE_TEXT(pageName)
   {
      if(this.CONTENT.globalColourMouseOver != undefined)
      {
         this.OnColour = this.CONTENT.globalColourMouseOver.textColor;
      }
      if(this.mcScope.colourMouseOver != undefined)
      {
         this.OnColour = this.mcScope.colourMouseOver.textColor;
      }
      this.dataTextScope = new Array();
      this.mcScope = this.CONTENT[pageName];
      var _loc3_ = 0;
      var _loc2_;
      for(var _loc4_ in this.mcScope)
      {
         if(typeof this.mcScope[_loc4_] == "movieclip")
         {
            if(this.mcScope[_loc4_].btnTxt != undefined)
            {
               this.mcScope[_loc4_].offColour = this.mcScope[_loc4_].btnTxt.textColor;
               _loc2_ = this.mcScope[_loc4_].btnTxt;
               this.dataTextScope[_loc3_] = _loc2_;
               _loc3_ = _loc3_ + 1;
            }
         }
      }
      switch(pageName)
      {
         case "PAGE1":
            if(this.videoDisabled == false)
            {
               this.dataTextScope[_loc3_] = this.mcScope.button_video_1.btnTxt;
               break;
            }
            this.mcScope.button_video_1._y = -500;
            break;
         case "PAGE2":
            if(this.videoDisabled == false)
            {
               this.dataTextScope[_loc3_] = this.mcScope.button_video_1.btnTxt;
               break;
            }
            this.mcScope.button_video_1._y = -500;
            break;
         case "PAGE4":
            if(this.videoDisabled == false)
            {
               this.dataTextScope[_loc3_] = this.mcScope.button_video_1.btnTxt;
            }
            else
            {
               this.mcScope.button_video_1._y = -500;
            }
            if(this.dataProviderUI[0] != undefined)
            {
               this.mcScope.tracy_desantaMC._visible = false;
            }
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      this.defaultButtonOnColour = this.OnColour;
   }
}
