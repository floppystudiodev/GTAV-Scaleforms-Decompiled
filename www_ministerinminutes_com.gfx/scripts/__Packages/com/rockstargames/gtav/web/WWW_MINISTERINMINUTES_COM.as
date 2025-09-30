class com.rockstargames.gtav.web.WWW_MINISTERINMINUTES_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var OnColour;
   var PAGE_NAMES;
   var browser;
   var dataTextScope;
   var defaultButtonOnColour;
   var mcScope;
   var nameGiven;
   function WWW_MINISTERINMINUTES_COM()
   {
      super();
      _global.gfxExtensions = true;
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "FORM";
      this.PAGE_NAMES[3] = "FAQ";
      this.PAGE_NAMES[4] = "CERTIFICATE";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = true;
      this.CAN_STORE_PAGE[4] = false;
      this.browser = _level0.TIMELINE;
   }
   function READY()
   {
   }
   function goToAnchor(AnchorLink)
   {
      if(this.browser.pageName == "FORM")
      {
         switch(AnchorLink)
         {
            case "CERTIFICATE":
               if(!this.mcScope.tickMC.tickMC._visible || this.mcScope.firstMC.btnTxt.text == "" || this.mcScope.lastMC.btnTxt.text == "")
               {
                  this.mcScope.formErrorTF.text = "Please complete form!";
                  this.mcScope.formErrorTF._visible = true;
               }
               else
               {
                  this.nameGiven = this.mcScope.firstMC.btnTxt.text + " " + this.mcScope.lastMC.btnTxt.text;
                  this.mcScope.formErrorTF.text = "";
                  this.mcScope.formErrorTF._visible = false;
                  this.browser.GO_TO_WEBPAGE("WWW_MINISTERINMINUTES_COM_S_CERTIFICATE");
               }
               break;
            case "tickMC":
               this.mcScope.tickMC.tickMC._visible = !this.mcScope.tickMC.tickMC._visible;
            default:
               return;
         }
      }
   }
   function POPULATE_TEXT(pageName)
   {
      this.CONTENT._y = 0;
      if(this.CONTENT.globalColourMouseOver != undefined)
      {
         this.OnColour = this.CONTENT.globalColourMouseOver.textColor;
      }
      this.mcScope = this.CONTENT[pageName];
      if(this.mcScope.colourMouseOver != undefined)
      {
         this.OnColour = this.mcScope.colourMouseOver.textColor;
      }
      this.dataTextScope = new Array();
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
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      this.defaultButtonOnColour = this.OnColour;
      switch(this.browser.pageName)
      {
         case "CERTIFICATE":
            this.mcScope.nameGivenTF.textAutoSize = "shrink";
            this.mcScope.nameGivenTF.text = this.nameGiven.toUpperCase();
            break;
         case "FORM":
            this.mcScope.tickMC.tickMC._visible = false;
         default:
            return;
      }
   }
}
