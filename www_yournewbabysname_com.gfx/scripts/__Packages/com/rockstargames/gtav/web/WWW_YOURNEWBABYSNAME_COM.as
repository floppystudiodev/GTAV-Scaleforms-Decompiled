class com.rockstargames.gtav.web.WWW_YOURNEWBABYSNAME_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var PAGE_NAMES;
   var CAN_STORE_PAGE;
   var browser;
   var defaultButtonOnColour;
   var defaultButtonOffColour;
   var mcScope;
   var CONTENT;
   var dataTextScope;
   static var HOME_PAGE = "PAGE1";
   static var NAMEGEN_PAGE = "NAME_D_GENERATOR";
   static var names = ["Furball","Aerosol","Sle\'ghandri","Pastrami","Headrest","Trinket","Aquaduck","Benephisto","Squeendot","Tophusk","Circuitship","Santa Yeehah","Flobbydart","Conundrum","Cosmoswimmer","Dataplan","Denim Noo Noo","Mitzimoo","Beardsplitter","Yum Yum Killer","Clamdigger","Bandwidth","Folgerphone","Pk\'ikki\'lax","Sandblaster","Thundermoon","Hifructo","Mojito","Appstore","Dappaccino","Envelope","Chicken Tikka","Pro Phil Act\'It","Digi Kulamba","42ThePower","Spamfilter","Fatzwimble","Sashimi","Wheatgrass","Analogue","Zero Gravity","Yuyu Lampon","Apocalypse","Lozzyklingers","Farceur","Pudwhacker","Pork Belly","Labradoodle","Marinade","Rumdonkey","Screwdriver","Bongtuberipper","Diplomat","Admiral Bongo","Flannel","Tycoon","U-Bend","Pip Pip Jongles","Wolzal","Flu","720p","Mars Moon","Bandar","Pumpkin ale","Hezzelfit","Sexicon","Trampnesia","Neonty","Hydrolony","Halfscopy","Isofrazzle","Purps","Cytovag","Donkey the Third","Strickdine","Haggislocity","Shambastic","Titty Rhino","Duvee","Audreyobook","Conflussus","Shannando","Coppersweet","Dautletty","Clothesline","Midtown","Kalesheezer","Effengee","Poofberretz","Longburd","Fixieplix","Crowexza","Vapizza","Canto Santi","Heroineey","Whazangtiz","Urfcake","Bichplz","Hippo","Corn-hole","Ciao-Chow","Hammer","Fire Wall","Aorta","Homeopath","Mittens","Chum","Tapeworm"];
   function WWW_YOURNEWBABYSNAME_COM()
   {
      super();
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = com.rockstargames.gtav.web.WWW_YOURNEWBABYSNAME_COM.HOME_PAGE;
      this.PAGE_NAMES[2] = com.rockstargames.gtav.web.WWW_YOURNEWBABYSNAME_COM.NAMEGEN_PAGE;
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.browser = _level0.TIMELINE;
      this.defaultButtonOnColour = 4671303;
      this.defaultButtonOffColour = 0;
   }
   function READY()
   {
   }
   function POPULATE_TEXT(pageName)
   {
      this.mcScope = this.CONTENT[pageName];
      this.dataTextScope = [];
      this.CONTENT._y = 0;
      switch(pageName)
      {
         case com.rockstargames.gtav.web.WWW_YOURNEWBABYSNAME_COM.HOME_PAGE:
            this.dataTextScope.push(this.mcScope.NAME_D_GENERATOR.btnTxt);
            break;
         case com.rockstargames.gtav.web.WWW_YOURNEWBABYSNAME_COM.NAMEGEN_PAGE:
            this.dataTextScope.push(this.mcScope.boyBtn.btnTxt);
            this.dataTextScope.push(this.mcScope.girlBtn.btnTxt);
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
   function goToAnchor(AnchorLink)
   {
      var _loc2_ = Math.random() * com.rockstargames.gtav.web.WWW_YOURNEWBABYSNAME_COM.names.length | 0;
      this.mcScope.nameTF.text = com.rockstargames.gtav.web.WWW_YOURNEWBABYSNAME_COM.names[_loc2_];
   }
}
