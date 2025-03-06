class com.rockstargames.gtav.web.WWW_BLEETER_BIZ extends com.rockstargames.ui.core.BaseWebsite
{
   var PAGE_NAMES;
   var CAN_STORE_PAGE;
   var browser;
   var defaultButtonOnColour;
   var defaultButtonOffColour;
   var TXDarray;
   var char_contact_pics;
   var mcScope;
   var footerContainer;
   var currentPage;
   var dataTextScope;
   var bleetContainer;
   var generatedTrendsStr;
   var CONTENT;
   var dataProviderUI;
   var contentBG;
   var bleetSpacing = 8;
   var bleetIndex = 0;
   function WWW_BLEETER_BIZ()
   {
      super();
      this.IS_SITE_DYNAMIC = 0;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "ERROR_MAINTENANCE";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = false;
      this.IS_SITE_DYNAMIC = 1;
      this.resetScroll = false;
      this.browser = _level0.TIMELINE;
      this.defaultButtonOnColour = 15529444;
      this.defaultButtonOffColour = 16777215;
      this.TXDarray = new Array();
      this.char_contact_pics = new Array();
      this.char_contact_pics.push(new Array("@MorganChester","WEB_MORGANCHESTER"));
      this.char_contact_pics.push(new Array("@mackinit2009","WEB_MACKINIT2009"));
      this.char_contact_pics.push(new Array("@grapeseedcharlie","WEB_GRAPESEEDCHARLIE"));
      this.char_contact_pics.push(new Array("@jacksonbbj_1996","WEB_JACKSONBBJ"));
      this.char_contact_pics.push(new Array("@geraldinok6","WEB_GERALDINOK6"));
      this.char_contact_pics.push(new Array("@TheCraze","WEB_THECRAZE"));
      this.char_contact_pics.push(new Array("@dontelford_ff","WEB_DONTELFORD"));
      this.char_contact_pics.push(new Array("@mouskatear","WEB_MOUSKATEAR"));
      this.char_contact_pics.push(new Array("@KungFuRainbowLazerForce","WEB_KUNGFURAINBOW"));
      this.char_contact_pics.push(new Array("@lonnie_fig3","WEB_LONNIE_FIG3"));
      this.char_contact_pics.push(new Array("@manolodeoro2","WEB_MANOLODEORO2"));
      this.char_contact_pics.push(new Array("@ChadMulligan","WEB_CHADMULLIGAN"));
      this.char_contact_pics.push(new Array("@jillsthenewblack","WEB_JILLSTHENEWBLACK"));
      this.char_contact_pics.push(new Array("@titotittyfan","WEB_TITOTITTYFAN"));
      this.char_contact_pics.push(new Array("@MagentaFreeLove","WEB_MAGENTA"));
      this.char_contact_pics.push(new Array("@BillyBlue","WEB_BILLYBLUE"));
      this.char_contact_pics.push(new Array("@yungmarlon12","WEB_YUNGMARLON"));
      this.char_contact_pics.push(new Array("@AppropriateAssociates","WEB_APPASS"));
      this.char_contact_pics.push(new Array("@BillAnthony","WEB_BILLANTHONY"));
      this.char_contact_pics.push(new Array("@BruceSpade","WEB_BRUCESPADE"));
      this.char_contact_pics.push(new Array("@ToeShoes","WEB_TOESHOES"));
      this.char_contact_pics.push(new Array("@tacobrendan_who","WEB_TACOBRENDAN"));
      this.char_contact_pics.push(new Array("@ImpotentRage","WEB_IMPOTENTRAGE"));
      this.char_contact_pics.push(new Array("@SixFigureTemps","WEB_SIXFIGURETEMPS"));
      this.char_contact_pics.push(new Array("@rockford_captain67","WEB_ROCKFORD_CAPTAIN67"));
      this.char_contact_pics.push(new Array("@RepublicanSpaceRangers","WEB_REPUBLICANSPACERANGERS"));
      this.char_contact_pics.push(new Array("@MCClip","WEB_MCCLIP"));
      this.char_contact_pics.push(new Array("@brianaleatherDD","WEB_BRIANLEATHERDD"));
      this.char_contact_pics.push(new Array("@YourDeadFamily","WEB_YOURDEADFAMILY"));
      this.char_contact_pics.push(new Array("@Honkers","WEB_HONKERS"));
      this.char_contact_pics.push(new Array("@mandybrocoli","WEB_MANDYBROCOLI"));
      this.char_contact_pics.push(new Array("@chumash_kiki","WEB_CHUMASH_KIKI"));
      this.char_contact_pics.push(new Array("@usafrankieg","WEB_USAFRANKIEG"));
      this.char_contact_pics.push(new Array("@ELECTROTOKE","WEB_ELECTROTOKE"));
      this.char_contact_pics.push(new Array("@SextonDaniels","WEB_SEXTONDANIELS"));
      this.char_contact_pics.push(new Array("@BarbequeSpaceflight","WEB_BARBEQUESPACEFLIGHT"));
      this.char_contact_pics.push(new Array("@kankanjill","WEB_KANKANJILL"));
      this.char_contact_pics.push(new Array("@JunkEnergyDrink","WEB_JUNKENERGYDRINK"));
      this.char_contact_pics.push(new Array("@PowCleanse","WEB_POWCLEANSE"));
      this.char_contact_pics.push(new Array("@lsmorticianpete","WEB_LSMORTICIANPETE"));
      this.char_contact_pics.push(new Array("@CrisFormage","WEB_CRISFORMAGE"));
      this.char_contact_pics.push(new Array("@jennratt73","WEB_JENNRATT73"));
      this.char_contact_pics.push(new Array("@bunueloaddict5","WEB_BUNUELOADDICT5"));
      this.char_contact_pics.push(new Array("@PamelaDrake","WEB_PAMELADRAKE"));
      this.char_contact_pics.push(new Array("@PorcupinePete","WEB_PORCUPINEPETE"));
      this.char_contact_pics.push(new Array("@YourNewBabysName","WEB_YOURNEWBABYSNAME"));
      this.char_contact_pics.push(new Array("@FRUIT","WEB_FRUIT"));
      this.char_contact_pics.push(new Array("@CashForDeadDreams","WEB_CASHFORDEADDREAMS"));
      this.char_contact_pics.push(new Array("@MisfireGames","WEB_MISFIREGAMES"));
      this.char_contact_pics.push(new Array("@lspapacarlos","WEB_LSPAPACARLOS"));
      this.char_contact_pics.push(new Array("@louisaxox91","WEB_LOUISAXOX91"));
      this.char_contact_pics.push(new Array("@right4eva","WEB_RIGHT4EVA"));
      this.char_contact_pics.push(new Array("@NATIONALOFFICEOFSECURITYENFORCEMENT","WEB_NATIONALOFFICEOFSECURITYENFORCEMENT"));
      this.char_contact_pics.push(new Array("@thomasstight_yeah","WEB_THOMASSTIGHT_YEAH"));
      this.char_contact_pics.push(new Array("@JackHowitzer","WEB_JACKHOWITZER"));
      this.char_contact_pics.push(new Array("@FacadeComputers","WEB_FACADECOMPUTERS"));
      this.char_contact_pics.push(new Array("@sandysuresteve","WEB_SANDYSURESTEVE"));
      this.char_contact_pics.push(new Array("@DelanceyMedua","WEB_DELANCEYMEDUA"));
      this.char_contact_pics.push(new Array("@kevtrimbalt22","WEB_KEVTRIMBALT22"));
      this.char_contact_pics.push(new Array("@fukudad3","WEB_FUKUDAD3"));
      this.char_contact_pics.push(new Array("@PFISTERDESIGN","WEB_PFISTERDESIGN"));
      this.char_contact_pics.push(new Array("@LosSantosPoliceDept","WEB_LOSSANTOSPOLICEDEPT"));
      this.char_contact_pics.push(new Array("@LosSantosPolice","WEB_LOSSANTOSPOLICEDEPT"));
      this.char_contact_pics.push(new Array("@MeTV","WEB_METV"));
      this.char_contact_pics.push(new Array("@JusticeForLeonora","WEB_JUSTICEFORLEONORA"));
      this.char_contact_pics.push(new Array("@sillyjilly28","WEB_SILLYJILLY28"));
      this.char_contact_pics.push(new Array("@AlamoSeaTouristBoard","WEB_ALAMOSEATOURISTBOARD"));
      this.char_contact_pics.push(new Array("@recyclehugo17","WEB_RECYCLEHUGO17"));
      this.char_contact_pics.push(new Array("@MarkFostenburg","DIA_MARKFOST"));
      this.char_contact_pics.push(new Array("@carsnpipes_pedro","CHAR_MP_MECHANIC"));
      this.char_contact_pics.push(new Array("@BillBinder","DIA_FINGURU"));
      this.char_contact_pics.push(new Array("@TriathlonMaryAnn","CHAR_MARY_ANN"));
      this.char_contact_pics.push(new Array("@RoccoPelosi","DIA_ROCCOPELOSI"));
      this.char_contact_pics.push(new Array("@MiltonMcilroy","DIA_MILTON"));
      this.char_contact_pics.push(new Array("@FleecaBank","CHAR_BANK_FLEECA"));
      this.char_contact_pics.push(new Array("@MarnieAllen","CHAR_MARNIE"));
      this.char_contact_pics.push(new Array("@DeniseClinton","CHAR_DENISE"));
      this.char_contact_pics.push(new Array("@ExtremeDom","CHAR_DOM"));
      this.char_contact_pics.push(new Array("@Tanisha","CHAR_TANISHA"));
      this.char_contact_pics.push(new Array("@BAYGOR","DIA_BAYGOR"));
      this.char_contact_pics.push(new Array("@PaparazzoBeverly","CHAR_BEVERLY"));
      this.char_contact_pics.push(new Array("@BarryForWeed","CHAR_BARRY"));
      this.char_contact_pics.push(new Array("@NATIONALOFFICEOFSECURITYENFORCEMENT","CHAR_JOSH"));
      this.char_contact_pics.push(new Array("@JimmyBoston","CHAR_JIMMY_BOSTON"));
      this.char_contact_pics.push(new Array("@TraceyDeSanta","CHAR_TRACEY"));
      this.char_contact_pics.push(new Array("@MerryweatherSecurity","CHAR_MP_MERRYWEATHER"));
      this.char_contact_pics.push(new Array("@AntonBeaudelaire","DIA_ANTON"));
      this.char_contact_pics.push(new Array("@LostMotorcycleClub","DIA_LOST"));
      this.char_contact_pics.push(new Array("@SolomonRichards","CHAR_SOLOMON"));
      this.char_contact_pics.push(new Array("@SteveHainesFIB","CHAR_STEVE"));
      this.char_contact_pics.push(new Array("@PoppyMitchell","DIA_POPPYMICH"));
      this.char_contact_pics.push(new Array("@JoshBernsteinRealtor","CHAR_JOSH"));
      this.char_contact_pics.push(new Array("@Lazlow","WEB_Lazlow"));
      this.char_contact_pics.push(new Array("@JimmyDS","CHAR_JIMMY"));
      this.char_contact_pics.push(new Array("@DevinWeston","CHAR_DEVIN"));
      this.char_contact_pics.push(new Array("@DrFriedlander","CHAR_DR_FRIEDLANDER"));
      this.char_contact_pics.push(new Array("@DrDaleJenkins","WEB_DrDaleJenkins"));
      this.char_contact_pics.push(new Array("@LesterC","CHAR_LESTER"));
      this.char_contact_pics.push(new Array("@AccountantTVShow","WEB_AccountantTVShow"));
      this.char_contact_pics.push(new Array("@AlDiNapoli","WEB_AlDiNapoli"));
      this.char_contact_pics.push(new Array("@alphadev_87","WEB_alphadev_87"));
      this.char_contact_pics.push(new Array("@BahamaMamasWest","WEB_BahamaMamasWest"));
      this.char_contact_pics.push(new Array("@Benefactor","WEB_Benefactor"));
      this.char_contact_pics.push(new Array("@BitterSweetCellPhone","WEB_BitterSweetCellPhone"));
      this.char_contact_pics.push(new Array("@BrotherAdrian","WEB_BrotherAdrian"));
      this.char_contact_pics.push(new Array("@Brucie_K","WEB_Brucie_K"));
      this.char_contact_pics.push(new Array("@CherenkovVodka","WEB_CherenkovVodka"));
      this.char_contact_pics.push(new Array("@ClayPGJACKSON","WEB_ClayPGJACKSON"));
      this.char_contact_pics.push(new Array("@CluckinBell","WEB_CluckinBell"));
      this.char_contact_pics.push(new Array("@cowboy_becky","WEB_cowboy_becky"));
      this.char_contact_pics.push(new Array("@CreditCardConsolidationKings","WEB_CreditCardConsolidationKings"));
      this.char_contact_pics.push(new Array("@CrevisOutdoorApparel","WEB_CrevisOutdoorApparel"));
      this.char_contact_pics.push(new Array("@cunningstuntacademy","WEB_cunningstuntacademy"));
      this.char_contact_pics.push(new Array("@debbiebabes85","WEB_debbiebabes85"));
      this.char_contact_pics.push(new Array("@Debra_PuertoDelSol","WEB_Debra_PuertoDelSol"));
      this.char_contact_pics.push(new Array("@DIGIFARM","WEB_DIGIFARM"));
      this.char_contact_pics.push(new Array("@DrDaleJenkins","WEB_DrDaleJenkins"));
      this.char_contact_pics.push(new Array("@DrugObservationAgency","WEB_DrugObservationAgency"));
      this.char_contact_pics.push(new Array("@DudeEatDog","WEB_DudeEatDog"));
      this.char_contact_pics.push(new Array("@eColaSoftDrink","WEB_eColaSoftDrink"));
      this.char_contact_pics.push(new Array("@ERIS","WEB_ERIS"));
      this.char_contact_pics.push(new Array("@fabienlarouche","WEB_fabienlarouche"));
      this.char_contact_pics.push(new Array("@FameOrShame","WEB_FameOrShame"));
      this.char_contact_pics.push(new Array("@fearfirst","WEB_fearfirst"));
      this.char_contact_pics.push(new Array("@footlong_freddie","WEB_footlong_freddie"));
      this.char_contact_pics.push(new Array("@JillVonCrastenburg","WEB_JillVonCrastenburg"));
      this.char_contact_pics.push(new Array("@JockCranley","WEB_JockCranley"));
      this.char_contact_pics.push(new Array("@JoshBernsteinRealtor","WEB_JoshBernsteinRealtor"));
      this.char_contact_pics.push(new Array("@Kerrymcintosh","WEB_Kerrymcintosh"));
      this.char_contact_pics.push(new Array("@Kevmeister_yo","WEB_Kevmeister_yo"));
      this.char_contact_pics.push(new Array("@loggerlight","WEB_loggerlight"));
      this.char_contact_pics.push(new Array("@LOMBANK","WEB_LOMBANK"));
      this.char_contact_pics.push(new Array("@MitchDexter","WEB_MitchDexter"));
      this.char_contact_pics.push(new Array("@nobbly_head","WEB_nobbly_head"));
      this.char_contact_pics.push(new Array("@pato_grande26","WEB_pato_grande26"));
      this.char_contact_pics.push(new Array("@pillpharm","WEB_pillpharm"));
      this.char_contact_pics.push(new Array("@PoundersFootball","WEB_PoundersFootball"));
      this.char_contact_pics.push(new Array("@PremiumDeluxeMotorsport","WEB_PremiumDeluxeMotorsport"));
      this.char_contact_pics.push(new Array("@PROP116","WEB_PROP116"));
      this.char_contact_pics.push(new Array("@railroad_pete47","WEB_railroad_pete47"));
      this.char_contact_pics.push(new Array("@RedwoodCigarettes","WEB_RedwoodCigarettes"));
      this.char_contact_pics.push(new Array("@rockford_privatetennis","WEB_rockford_privatetennis"));
      this.char_contact_pics.push(new Array("@RustyBrownsDonuts","WEB_RustyBrownsDonuts"));
      this.char_contact_pics.push(new Array("@SebastianDixFashion","WEB_SebastianDixFashion"));
      this.char_contact_pics.push(new Array("@SeriousCougarShow","WEB_SeriousCougarShow"));
      this.char_contact_pics.push(new Array("@sexxisandra_ruggirl","WEB_sexxisandra_ruggirl"));
      this.char_contact_pics.push(new Array("@SorryCommodeBand","WEB_SorryCommodeBand"));
      this.char_contact_pics.push(new Array("@Sprunk","WEB_Sprunk"));
      this.char_contact_pics.push(new Array("@stabfino","WEB_stabfino"));
      this.char_contact_pics.push(new Array("@SueMurry","WEB_SueMurry"));
      this.char_contact_pics.push(new Array("@SwallowClothing","WEB_SwallowClothing"));
      this.char_contact_pics.push(new Array("@SwingersBaseball","WEB_SwingersBaseball"));
      this.char_contact_pics.push(new Array("@tonymctony","WEB_tonymctony"));
      this.char_contact_pics.push(new Array("@tummytodd_92","WEB_tummytodd_92"));
      this.char_contact_pics.push(new Array("@VinewoodLionel67","WEB_VinewoodLionel67"));
      this.char_contact_pics.push(new Array("@WhizWireless","WEB_WhizWireless"));
   }
   function READY()
   {
   }
   function makeAnchorButtons(buttonsArray)
   {
      var _loc10_ = buttonsArray.length;
      var _loc6_ = 0;
      var _loc11_ = 6.25;
      var _loc12_ = 2;
      if(this.mcScope.footerMC.footerContainer != undefined)
      {
         this.mcScope.footerMC.footerContainer.removeMovieClip();
      }
      this.footerContainer = this.mcScope.footerMC.createEmptyMovieClip("footerContainer",this.mcScope.footerMC.getNextHighestDepth());
      var _loc3_ = 0;
      while(_loc3_ < _loc10_)
      {
         var _loc7_ = _loc3_;
         var _loc2_ = "page" + buttonsArray[_loc3_].toString();
         if(this.footerContainer[_loc2_] != undefined)
         {
            this.footerContainer[_loc2_].removeMovieClip();
         }
         var _loc4_ = "anchorButtonMC";
         if(this.currentPage == buttonsArray[_loc3_])
         {
            _loc4_ = "anchorButtonFakeMC";
         }
         this.footerContainer.attachMovie(_loc4_,_loc2_,this.footerContainer.getNextHighestDepth(),{_x:_loc6_,_y:_loc11_});
         if(_loc4_ == "anchorButtonMC")
         {
            this.footerContainer[_loc2_].btnTxt.text = buttonsArray[_loc3_].toString();
            this.dataTextScope[_loc3_ + 5] = this.footerContainer[_loc2_].btnTxt;
         }
         else
         {
            this.footerContainer[_loc2_].textTF.text = buttonsArray[_loc3_].toString();
         }
         this.footerContainer[_loc2_].onColour = 15529444;
         this.footerContainer[_loc2_].offColour = 16777215;
         _loc6_ += this.footerContainer[_loc2_]._width + _loc12_;
         _loc3_ = _loc3_ + 1;
      }
      this.footerContainer._x = 433 - this.footerContainer._width / 2;
      this.mcScope.footerMC.prev._x = this.footerContainer._x - this.mcScope.footerMC.prev._width;
      this.mcScope.footerMC.next._x = this.footerContainer._x + this.footerContainer._width;
   }
   function goToAnchor(AnchorLinkLetter)
   {
   }
   function makeBleetList()
   {
      if(this.mcScope.bleetContainer != undefined)
      {
         this.mcScope.bleetContainer.removeMovieClip();
      }
      this.bleetContainer = this.mcScope.createEmptyMovieClip("bleetContainer",this.mcScope.getNextHighestDepth());
      this.bleetContainer._x = 238;
      this.bleetContainer._y = 406;
      this.generatedTrendsStr = "";
      var _loc23_ = 0;
      var _loc26_ = this.CONTENT.localisationTF;
      var _loc7_ = 2;
      while(_loc7_ < this.dataProviderUI.length)
      {
         if(this.dataProviderUI[_loc7_] != undefined)
         {
            if(this.dataProviderUI[_loc7_][0] != undefined)
            {
               var _loc2_ = this.dataProviderUI[_loc7_][0];
               var _loc11_ = "";
               var _loc10_ = "";
               var _loc8_ = "";
               var _loc12_ = "";
               var _loc14_ = _loc2_.indexOf("*");
               if(_loc14_ != -1)
               {
                  var _loc19_ = _loc2_.substr(_loc14_ + 1).indexOf(" ");
                  _loc11_ = "@" + _loc2_.slice(_loc14_ + 1,_loc19_ + 1);
                  var _loc9_ = _loc2_.substr(_loc19_ + 2,_loc2_.length);
                  _loc2_ = _loc9_;
               }
               _loc14_ = _loc2_.indexOf("@");
               if(_loc14_ != -1)
               {
                  _loc19_ = _loc2_.substr(_loc14_ + 1).indexOf(" ");
                  _loc10_ = _loc2_.slice(_loc14_,_loc19_ + 1);
                  if(_loc11_ == "")
                  {
                     _loc11_ = _loc10_;
                  }
                  _loc9_ = _loc2_.substr(_loc19_ + 2,_loc2_.length);
                  _loc2_ = _loc9_;
               }
               _loc9_ = _loc2_;
               _loc14_ = _loc2_.indexOf("#");
               if(_loc14_ != -1)
               {
                  var _loc3_ = _loc14_;
                  while(_loc3_ < _loc2_.length)
                  {
                     if(_loc2_.substr(_loc3_,1) == "#")
                     {
                        if(_loc2_.substr(_loc3_ + 1,1) != "." && _loc2_.substr(_loc3_ + 1,1) != " ")
                        {
                           var _loc6_ = _loc2_.substr(_loc3_ + 1).indexOf(" ");
                           if(_loc6_ == -1)
                           {
                              _loc6_ = _loc2_.length - 1;
                           }
                           var _loc5_ = _loc2_.substr(_loc3_,_loc6_ + 1);
                           var _loc20_ = _loc9_.split(_loc5_);
                           _loc9_ = _loc20_[0] + "<font color=\'#344d35\'>" + _loc5_ + "</font>" + _loc20_[1];
                           _loc8_ += _loc5_ + " ";
                        }
                     }
                     _loc3_ = _loc3_ + 1;
                  }
               }
               _loc2_ = _loc9_;
               this.generatedTrendsStr += _loc8_;
               var _loc13_ = "bleet" + (_loc7_ - 2);
               _loc14_ = _loc2_.indexOf("www.");
               if(_loc14_ != -1)
               {
                  var _loc16_ = _loc2_.substr(_loc14_ + 1).indexOf(" ");
                  if(_loc16_ == -1)
                  {
                     _loc16_ = _loc2_.length;
                  }
                  var _loc15_ = _loc2_.substr(_loc14_,_loc16_ + 1);
                  _loc12_ = this.browser.PARSE_TEXT_TO_FILENAME(_loc15_);
                  _loc13_ = _loc12_;
                  _loc20_ = _loc2_.split(_loc15_);
                  _loc2_ = _loc20_[0] + "<font color=\'#2f5c73\'>" + _loc15_ + "</font>" + _loc20_[1];
               }
               var _loc22_ = "BleetMC";
               var _loc4_ = this.bleetContainer.attachMovie(_loc22_,_loc13_,this.bleetContainer.getNextHighestDepth(),{_x:0,_y:_loc23_});
               var _loc17_ = this.findCharPic(_loc11_);
               if(_loc17_ != "")
               {
                  _loc4_.bleetAvatarMC._visible = false;
                  com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_BROWSER",_loc17_,_loc13_,true);
               }
               if(_loc12_ != "")
               {
                  var _loc21_ = this.dataTextScope.length;
                  this.dataTextScope[_loc21_] = _loc4_.btnTxt;
                  _loc4_.btnTxt.text = _loc12_;
               }
               var _loc18_ = _loc10_;
               if(_loc8_ != "")
               {
                  _loc18_ = _loc10_ + "<font color=\'#2DAE58\'> " + _loc8_;
               }
               _loc4_.usernameTF.htmlText = _loc18_;
               _loc4_.usernameTF.autoSize = true;
               _loc4_.bleetTF._y = _loc4_.usernameTF._y + _loc4_.usernameTF._height;
               _loc4_.bleetTF.htmlText = _loc2_;
               _loc4_.bleetTF.autoSize = true;
               _loc4_.bg._height = _loc4_.bleetTF._y + _loc4_.bleetTF._height;
               _loc23_ += this.bleetSpacing + _loc4_._height;
            }
         }
         _loc7_ = _loc7_ + 1;
      }
      this.mcScope.footerMC._y = this.bleetContainer._y + this.bleetContainer._height + 32;
   }
   function findCharPic(stringToFind)
   {
      var _loc3_ = "";
      var _loc2_ = 0;
      while(_loc2_ < this.char_contact_pics.length)
      {
         if(this.char_contact_pics[_loc2_][0].toLowerCase() == stringToFind.toLowerCase())
         {
            _loc3_ = this.char_contact_pics[_loc2_][1];
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
   }
   function makeTrendingBleets()
   {
      if(this.generatedTrendsStr.length > 0)
      {
         if(this.mcScope.trendingMC != undefined)
         {
            this.mcScope.trendingMC.removeMovieClip();
         }
         this.mcScope.attachMovie("trendingMC","trendingMC",this.mcScope.getNextHighestDepth(),{_x:806,_y:32,_visible:false});
         this.mcScope.trendingMC.trendingTF.autoSize = "right";
         this.mcScope.trendingMC.trendingTF.multiline = true;
         this.mcScope.trendingMC.trendingTF.text = this.generatedTrendsStr;
         this.mcScope.trendingMC.bg._width = this.mcScope.trendingMC.trendingTF.textWidth + 18;
         this.mcScope.trendingMC.bg._height = this.mcScope.trendingMC.trendingTF._height + 6;
         this.mcScope.trendingMC.bg._x = this.mcScope.trendingMC._width - (this.mcScope.trendingMC.trendingTF.textWidth + 12);
         this.mcScope.trendingMC._x = 906 - this.mcScope.trendingMC._width;
         this.mcScope.trendingMC._visible = true;
      }
   }
   function POPULATE_TEXT(pageName)
   {
      this.CLEANUP();
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"BLE_TITLEBARTEXT",this.CONTENT.localisationTF,false);
      this.browser.SET_TITLEBAR_TEXT(this.CONTENT.localisationTF.text,14474460);
      switch(pageName)
      {
         case "PAGE1":
            this.mcScope = this.CONTENT.PAGE1;
            this.contentBG = this.mcScope.contentBox;
            this.dataTextScope = new Array();
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"BLE_HEADER",this.mcScope.titleTF,true);
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"BLE_BODY",this.mcScope.bodyTF,true);
            this.mcScope.bodyTF.autoSize = true;
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"BLE_LATESTBLEETS",this.mcScope.title2TF,true);
            this.mcScope.dividersMC._alpha = 100;
            this.dataTextScope[1] = this.mcScope.footerMC.first.btnTxt;
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"BLE_FIRST",this.mcScope.footerMC.first.btnTxt,false);
            this.mcScope.footerMC.first.btnTxt.autoSize = "left";
            this.dataTextScope[2] = this.mcScope.footerMC.last.btnTxt;
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"BLE_LAST",this.mcScope.footerMC.last.btnTxt,false);
            this.mcScope.footerMC.last.btnTxt.autoSize = "left";
            this.mcScope.footerMC.last._x = 830 - this.mcScope.footerMC.last._width;
            this.dataTextScope[3] = this.mcScope.footerMC.prev.btnTxt;
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"BLE_PREV",this.mcScope.footerMC.prev.btnTxt,false);
            this.mcScope.footerMC.prev.btnTxt.autoSize = "left";
            this.dataTextScope[4] = this.mcScope.footerMC.next.btnTxt;
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"BLE_NEXT",this.mcScope.footerMC.next.btnTxt,false);
            this.mcScope.footerMC.next.btnTxt.autoSize = "left";
            this.currentPage = this.dataProviderUI[1][0];
            var _loc3_ = new Array();
            var _loc2_ = 1;
            while(_loc2_ < 11)
            {
               if(!(this.dataProviderUI[1][_loc2_] != "" && this.dataProviderUI[1][_loc2_] != undefined))
               {
                  break;
               }
               _loc3_.push(this.dataProviderUI[1][_loc2_]);
               _loc2_ = _loc2_ + 1;
            }
            this.makeAnchorButtons(_loc3_);
            this.makeBleetList();
            this.makeTrendingBleets();
            var _loc4_ = this.mcScope.footerMC._y + 80;
            this.mcScope.backgroundMC._height = _loc4_;
            if(_loc4_ < 627)
            {
               _loc4_ = 627;
            }
            this.CONTENT.BOUNDING_BOX._height = _loc4_;
            this.contentBG._height = this.bleetContainer._y + this.bleetContainer._height - 122;
            _level0.TIMELINE.SET_DATA_SLOT_EMPTY();
            break;
         case "ERROR_MAINTENANCE":
            this.mcScope = this.CONTENT.ERROR_MAINTENANCE;
            this.dataTextScope = new Array();
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_MAINTENANCE",this.mcScope.messageTF,true);
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      if(success == true)
      {
         this.TXDarray.push(new Array(textureDict,uniqueID));
         this.bleetContainer[uniqueID].avatarTF.htmlText = "<img src=\'img://" + textureDict + "/" + textureDict + "\' vspace=\'0\' hspace=\'0\' width=\'64\' height=\'64\'/>";
      }
   }
   function CLEANUP()
   {
      if(this.TXDarray.length > 0)
      {
         var _loc2_ = 0;
         while(_loc2_ < this.TXDarray.length)
         {
            if(this.TXDarray[_loc2_][0] != undefined)
            {
               if(this.bleetContainer[this.TXDarray[_loc2_][1]] != undefined)
               {
                  this.bleetContainer[this.TXDarray[_loc2_][1]].avatarTF.text = " ";
               }
               com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_BROWSER",this.TXDarray[_loc2_][0]);
               this.TXDarray[_loc2_][0] = undefined;
               this.TXDarray[_loc2_][1] = undefined;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      this.TXDarray = new Array();
   }
}
