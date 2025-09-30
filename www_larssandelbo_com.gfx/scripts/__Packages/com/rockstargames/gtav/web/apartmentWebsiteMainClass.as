class com.rockstargames.gtav.web.apartmentWebsiteMainClass extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var PAGE_NAMES;
   var TIMELINE;
   var TXDarray;
   var browser;
   var buyNowStr;
   var carColoursArray;
   var carManuStr;
   var carNameStr;
   var carNumber;
   var categoryData;
   var colourNumber;
   var dataProviderUI;
   var dataTextScope;
   var defaultButtonOffColour;
   var defaultButtonOnColour;
   var displayArray;
   var freeStr;
   var intervalId;
   var mcScope;
   var outOfStockStr;
   var prevCarNumber;
   var prevColourNumber;
   var vehicleData;
   var currentRank = 0;
   var isMP = false;
   function apartmentWebsiteMainClass()
   {
      super();
      this.IS_SITE_DYNAMIC = 1;
      this.browser = _level0.TIMELINE;
      this.browser.DebugTextContent = true;
      if(this.browser.player == 1)
      {
         this.isMP = true;
      }
      else
      {
         this.isMP = false;
      }
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "SEARCH";
      this.PAGE_NAMES[3] = "CARDETAILS1";
      this.PAGE_NAMES[4] = "CARDETAILS2";
      this.PAGE_NAMES[5] = "CARDETAILS3";
      this.PAGE_NAMES[6] = "CARDETAILS4";
      this.PAGE_NAMES[7] = "CARDETAILS5";
      this.PAGE_NAMES[8] = "CARDETAILS6";
      this.PAGE_NAMES[9] = "CARDETAILS7";
      this.PAGE_NAMES[10] = "CARDETAILS8";
      this.PAGE_NAMES[11] = "CARDETAILS9";
      this.PAGE_NAMES[12] = "CARDETAILS10";
      this.PAGE_NAMES[13] = "CARDETAILS11";
      this.PAGE_NAMES[14] = "CARDETAILS12";
      this.PAGE_NAMES[15] = "CARDETAILS13";
      this.PAGE_NAMES[16] = "CARDETAILS14";
      this.PAGE_NAMES[17] = "CARDETAILS15";
      this.PAGE_NAMES[18] = "CARDETAILS16";
      this.PAGE_NAMES[19] = "CARDETAILS17";
      this.PAGE_NAMES[20] = "CARDETAILS18";
      this.PAGE_NAMES[21] = "CARDETAILS19";
      this.PAGE_NAMES[22] = "CARDETAILS20";
      this.PAGE_NAMES[23] = "CARDETAILS21";
      this.PAGE_NAMES[24] = "CARDETAILS22";
      this.PAGE_NAMES[25] = "CARDETAILS23";
      this.PAGE_NAMES[26] = "CARDETAILS24";
      this.PAGE_NAMES[27] = "CARDETAILS25";
      this.PAGE_NAMES[28] = "CARDETAILS26";
      this.PAGE_NAMES[29] = "CARDETAILS27";
      this.PAGE_NAMES[30] = "CARDETAILS28";
      this.PAGE_NAMES[31] = "CARDETAILS29";
      this.PAGE_NAMES[32] = "CARDETAILS30";
      this.PAGE_NAMES[33] = "CARDETAILS31";
      this.PAGE_NAMES[34] = "PURCHASECAR";
      this.PAGE_NAMES[35] = "PURCHASE_D_FAILED";
      this.PAGE_NAMES[36] = "PURCHASE_D_ERROR";
      this.PAGE_NAMES[37] = "PURCHASE_D_CONFIRM";
      this.PAGE_NAMES[38] = "CARDETAILS32";
      this.PAGE_NAMES[39] = "CARDETAILS33";
      this.PAGE_NAMES[40] = "CARDETAILS34";
      this.PAGE_NAMES[41] = "CARDETAILS35";
      this.PAGE_NAMES[42] = "CARDETAILS36";
      this.PAGE_NAMES[43] = "CARDETAILS37";
      this.PAGE_NAMES[44] = "CARDETAILS38";
      this.PAGE_NAMES[45] = "CARDETAILS39";
      this.PAGE_NAMES[46] = "CARDETAILS40";
      this.PAGE_NAMES[47] = "CARDETAILS41";
      this.PAGE_NAMES[48] = "CARDETAILS42";
      this.PAGE_NAMES[49] = "CARDETAILS43";
      this.PAGE_NAMES[50] = "CARDETAILS44";
      this.PAGE_NAMES[51] = "CARDETAILS45";
      this.PAGE_NAMES[52] = "CARDETAILS46";
      this.PAGE_NAMES[53] = "CARDETAILS47";
      this.PAGE_NAMES[54] = "CARDETAILS48";
      this.PAGE_NAMES[55] = "CARDETAILS49";
      this.PAGE_NAMES[56] = "CARDETAILS50";
      this.PAGE_NAMES[57] = "CARDETAILS51";
      this.PAGE_NAMES[58] = "CARDETAILS52";
      this.PAGE_NAMES[59] = "CARDETAILS53";
      this.PAGE_NAMES[60] = "CARDETAILS54";
      this.PAGE_NAMES[61] = "CARDETAILS55";
      this.PAGE_NAMES[62] = "CARDETAILS56";
      this.PAGE_NAMES[63] = "CARDETAILS57";
      this.PAGE_NAMES[64] = "CARDETAILS58";
      this.PAGE_NAMES[65] = "CARDETAILS59";
      this.PAGE_NAMES[66] = "CARDETAILS60";
      this.PAGE_NAMES[67] = "CARDETAILS61";
      this.PAGE_NAMES[68] = "CARDETAILS62";
      this.PAGE_NAMES[69] = "CARDETAILS63";
      this.PAGE_NAMES[70] = "CARDETAILS64";
      this.PAGE_NAMES[71] = "CARDETAILS65";
      this.PAGE_NAMES[72] = "CARDETAILS66";
      this.PAGE_NAMES[73] = "CARDETAILS67";
      this.PAGE_NAMES[74] = "CARDETAILS68";
      this.PAGE_NAMES[75] = "CARDETAILS69";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = false;
      this.CAN_STORE_PAGE[3] = true;
      this.CAN_STORE_PAGE[4] = true;
      this.CAN_STORE_PAGE[5] = true;
      this.CAN_STORE_PAGE[6] = true;
      this.CAN_STORE_PAGE[7] = true;
      this.CAN_STORE_PAGE[8] = true;
      this.CAN_STORE_PAGE[9] = true;
      this.CAN_STORE_PAGE[10] = true;
      this.CAN_STORE_PAGE[11] = true;
      this.CAN_STORE_PAGE[12] = true;
      this.CAN_STORE_PAGE[13] = true;
      this.CAN_STORE_PAGE[14] = true;
      this.CAN_STORE_PAGE[15] = true;
      this.CAN_STORE_PAGE[16] = true;
      this.CAN_STORE_PAGE[17] = true;
      this.CAN_STORE_PAGE[18] = true;
      this.CAN_STORE_PAGE[19] = true;
      this.CAN_STORE_PAGE[20] = true;
      this.CAN_STORE_PAGE[21] = true;
      this.CAN_STORE_PAGE[22] = true;
      this.CAN_STORE_PAGE[23] = true;
      this.CAN_STORE_PAGE[24] = true;
      this.CAN_STORE_PAGE[25] = true;
      this.CAN_STORE_PAGE[26] = true;
      this.CAN_STORE_PAGE[27] = true;
      this.CAN_STORE_PAGE[28] = true;
      this.CAN_STORE_PAGE[29] = true;
      this.CAN_STORE_PAGE[30] = true;
      this.CAN_STORE_PAGE[31] = true;
      this.CAN_STORE_PAGE[32] = true;
      this.CAN_STORE_PAGE[33] = true;
      this.CAN_STORE_PAGE[34] = false;
      this.CAN_STORE_PAGE[35] = false;
      this.CAN_STORE_PAGE[36] = false;
      this.CAN_STORE_PAGE[37] = false;
      this.CAN_STORE_PAGE[38] = true;
      this.CAN_STORE_PAGE[39] = true;
      this.CAN_STORE_PAGE[40] = true;
      this.CAN_STORE_PAGE[41] = true;
      this.CAN_STORE_PAGE[42] = true;
      this.CAN_STORE_PAGE[43] = true;
      this.CAN_STORE_PAGE[44] = true;
      this.CAN_STORE_PAGE[45] = false;
      this.CAN_STORE_PAGE[46] = false;
      this.CAN_STORE_PAGE[47] = false;
      this.CAN_STORE_PAGE[48] = true;
      this.CAN_STORE_PAGE[49] = true;
      this.CAN_STORE_PAGE[50] = true;
      this.CAN_STORE_PAGE[51] = true;
      this.CAN_STORE_PAGE[52] = true;
      this.CAN_STORE_PAGE[53] = true;
      this.CAN_STORE_PAGE[54] = true;
      this.CAN_STORE_PAGE[55] = true;
      this.CAN_STORE_PAGE[56] = true;
      this.CAN_STORE_PAGE[57] = true;
      this.CAN_STORE_PAGE[58] = true;
      this.CAN_STORE_PAGE[59] = true;
      this.CAN_STORE_PAGE[60] = true;
      this.CAN_STORE_PAGE[61] = true;
      this.CAN_STORE_PAGE[62] = true;
      this.CAN_STORE_PAGE[63] = true;
      this.CAN_STORE_PAGE[64] = true;
      this.CAN_STORE_PAGE[65] = true;
      this.CAN_STORE_PAGE[66] = true;
      this.CAN_STORE_PAGE[67] = true;
      this.CAN_STORE_PAGE[68] = true;
      this.CAN_STORE_PAGE[69] = true;
      this.CAN_STORE_PAGE[70] = true;
      this.CAN_STORE_PAGE[71] = true;
      this.CAN_STORE_PAGE[72] = true;
      this.CAN_STORE_PAGE[73] = true;
      this.CAN_STORE_PAGE[74] = true;
      this.CAN_STORE_PAGE[75] = true;
      this.defaultButtonOnColour = 0;
      this.defaultButtonOffColour = 3355443;
      this.vehicleData = new Array();
      this.vehicleData.push(undefined);
      this.vehicleData.push({BRAND:"BENEFAC",VEHICLE:"SCHWARZE",PAGEID:3,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"UBERMACH",VEHICLE:"ZION",PAGEID:4,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"BRAVADO",VEHICLE:"GAUNTLET",PAGEID:5,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"DECLASSE",VEHICLE:"VIGERO",PAGEID:6,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"WEENY",VEHICLE:"ISSI2",PAGEID:7,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"PEGASSI",VEHICLE:"INFERNUS",PAGEID:8,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"BENEFAC",VEHICLE:"SURANO",PAGEID:9,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"PEGASSI",VEHICLE:"VACCA",PAGEID:10,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"OBEY",VEHICLE:"NINEF",PAGEID:11,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"PFISTER",VEHICLE:"COMET2",PAGEID:12,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"BRAVADO",VEHICLE:"BANSHEE",PAGEID:13,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"BENEFAC",VEHICLE:"FELTZER",PAGEID:14,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"BF",VEHICLE:"BFINJECT",PAGEID:15,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"VAPID",VEHICLE:"SANDKING",PAGEID:16,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false});
      this.vehicleData.push({BRAND:"VAPID",VEHICLE:"FUGITIVE",PAGEID:17,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false});
      this.vehicleData.push({BRAND:"KARIN",VEHICLE:"DILETTAN",PAGEID:18,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false});
      this.vehicleData.push({BRAND:"ENUS",VEHICLE:"SUPERD",PAGEID:19,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false});
      this.vehicleData.push({BRAND:"DEWBAUCH",VEHICLE:"EXEMPLAR",PAGEID:20,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false});
      this.vehicleData.push({BRAND:"GALLIVAN",VEHICLE:"BALLER2",PAGEID:21,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false});
      this.vehicleData.push({BRAND:"ALBANY",VEHICLE:"CAVCADE",PAGEID:22,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false});
      this.vehicleData.push({BRAND:"OBEY",VEHICLE:"ROCOTO",PAGEID:23,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false});
      this.vehicleData.push({BRAND:"LAMPADA",VEHICLE:"FELON",PAGEID:24,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false});
      this.vehicleData.push({BRAND:"UBERMACH",VEHICLE:"ORACLE",PAGEID:25,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false});
      this.vehicleData.push({BRAND:"PEGASSI",VEHICLE:"BATI",PAGEID:26,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"DINKA",VEHICLE:"AKUMA",PAGEID:27,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"PEGASSI",VEHICLE:"RUFFIAN",PAGEID:28,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"SHITZU",VEHICLE:"VADER",PAGEID:29,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"NAGASAKI",VEHICLE:"BLAZER",PAGEID:30,PRICE:-1,RANK:-1,SEATS:"01",IS_DLC:false});
      this.vehicleData.push({BRAND:"SHITZU",VEHICLE:"PCJ",PAGEID:31,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"MAIBATSU",VEHICLE:"SANCHEZ",PAGEID:32,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false,LIVERY1:"SSS_SPRUNK",LIVERY2:"SSS_ATOMIC",LIVERY3:"SSS_PATRIOT",LIVERY4:"SSS_SHREWSBURY"});
      this.vehicleData.push({BRAND:"PRINCIPL",VEHICLE:"FAGGIO",PAGEID:33,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"BRAVADO",VEHICLE:"BISON",PAGEID:38,PRICE:-1,RANK:-1,SEATS:"06",IS_DLC:false});
      this.vehicleData.push({BRAND:"DINKA",VEHICLE:"DOUBLE",PAGEID:39,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"LAMPADA",VEHICLE:"FELON2",PAGEID:40,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"LCC",VEHICLE:"HEXER",PAGEID:41,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"UBERMACH",VEHICLE:"ZION2",PAGEID:42,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"PEGASSI",VEHICLE:"BATI2",PAGEID:43,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false,LIVERY1:"SSS_REDWOOD",LIVERY2:"SSS_CERVEZA",LIVERY3:"SSS_STRONZO",LIVERY4:"SSS_SPRUNK"});
      this.vehicleData.push({BRAND:"DUNDREAR",VEHICLE:"STRETCH",PAGEID:44,PRICE:-1,RANK:-1,SEATS:"06",IS_DLC:false,NOCOLOUR:true});
      this.vehicleData.push({BRAND:"BF",VEHICLE:"BIFTA",PAGEID:45,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:true});
      this.vehicleData.push({BRAND:"CANIS",VEHICLE:"KALAHARI",PAGEID:46,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:true});
      this.vehicleData.push({BRAND:"BRAVADO",VEHICLE:"PARADISE",PAGEID:47,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:true,LIVERY1:"SSS_SURF",LIVERY2:"SSS_SHARK",LIVERY3:"SSS_LOGGER",LIVERY4:"SSS_OCTOPUS"});
      this.vehicleData.push({BRAND:"CANIS",VEHICLE:"BODHI2",PAGEID:48,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false});
      this.vehicleData.push({BRAND:"BF",VEHICLE:"DUNE",PAGEID:49,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"KARIN",VEHICLE:"REBEL",PAGEID:50,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"VAPID",VEHICLE:"SADLER",PAGEID:51,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false});
      this.vehicleData.push({BRAND:"VAPID",VEHICLE:"SANDKIN2",PAGEID:52,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"MAIBATSU",VEHICLE:"SANCHEZ2",PAGEID:53,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false});
      this.vehicleData.push({BRAND:"DECLASSE",VEHICLE:"ASEA",PAGEID:54,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false,TXD:"SSSA_DLC_BUSINESS"});
      this.vehicleData.push({BRAND:"KARIN",VEHICLE:"ASTROPE",PAGEID:55,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false,TXD:"SSSA_DLC_BUSINESS"});
      this.vehicleData.push({BRAND:"VAPID",VEHICLE:"BOBCATXL",PAGEID:56,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:false,TXD:"SSSA_DLC_BUSINESS"});
      this.vehicleData.push({BRAND:"ALBANY",VEHICLE:"CAVCADE2",PAGEID:57,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false,TXD:"SSSA_DLC_BUSINESS"});
      this.vehicleData.push({BRAND:"DECLASSE",VEHICLE:"GRANGER",PAGEID:58,PRICE:-1,RANK:-1,SEATS:"08",IS_DLC:false,TXD:"SSSA_DLC_BUSINESS"});
      this.vehicleData.push({BRAND:"VULCAR",VEHICLE:"INGOT",PAGEID:59,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false,TXD:"SSSA_DLC_BUSINESS"});
      this.vehicleData.push({BRAND:"KARIN",VEHICLE:"INTRUDER",PAGEID:60,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false,TXD:"SSSA_DLC_BUSINESS"});
      this.vehicleData.push({BRAND:"VAPID",VEHICLE:"MINIVAN",PAGEID:61,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false,TXD:"SSSA_DLC_BUSINESS"});
      this.vehicleData.push({BRAND:"DECLASSE",VEHICLE:"PREMIER",PAGEID:62,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false,TXD:"SSSA_DLC_BUSINESS"});
      this.vehicleData.push({BRAND:"VAPID",VEHICLE:"RADI",PAGEID:63,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false,TXD:"SSSA_DLC_BUSINESS"});
      this.vehicleData.push({BRAND:"DECLASSE",VEHICLE:"RANCHERX",PAGEID:64,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false,TXD:"SSSA_DLC_BUSINESS"});
      this.vehicleData.push({BRAND:"VAPID",VEHICLE:"STANIER",PAGEID:65,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false,TXD:"SSSA_DLC_BUSINESS"});
      this.vehicleData.push({BRAND:"ZIRCONIU",VEHICLE:"STRATUM",PAGEID:66,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false,TXD:"SSSA_DLC_BUSINESS"});
      this.vehicleData.push({BRAND:"ALBANY",VEHICLE:"WASHINGT",PAGEID:67,PRICE:-1,RANK:-1,SEATS:"04",IS_DLC:false,TXD:"SSSA_DLC_BUSINESS"});
      this.vehicleData.push({BRAND:"CHEVAL",VEHICLE:"PICADOR",PAGEID:68,PRICE:-1,RANK:1,SEATS:"02",IS_DLC:false,TXD:"SSSA_DLC_HIPSTER"});
      this.vehicleData.push({BRAND:"DUNDREAR",VEHICLE:"REGINA",PAGEID:69,PRICE:-1,RANK:1,SEATS:"04",IS_DLC:false,TXD:"SSSA_DLC_HIPSTER"});
      this.vehicleData.push({BRAND:"BF",VEHICLE:"SURFER",PAGEID:70,PRICE:-1,RANK:1,SEATS:"02",IS_DLC:false,TXD:"SSSA_DLC_HIPSTER"});
      this.vehicleData.push({BRAND:"BRAVADO",VEHICLE:"YOUGA",PAGEID:71,PRICE:-1,RANK:1,SEATS:"02",IS_DLC:false,TXD:"SSSA_DLC_HIPSTER"});
      this.vehicleData.push({BRAND:"BRAVADO",VEHICLE:"DLC_CAR_1",PAGEID:72,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:true,TXD:"SSSA_DLC_HIPSTER"});
      this.vehicleData.push({BRAND:"BRAVADO",VEHICLE:"DLC_CAR_2",PAGEID:73,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:true,TXD:"SSSA_DLC_HIPSTER"});
      this.vehicleData.push({BRAND:"BRAVADO",VEHICLE:"DLC_CAR_3",PAGEID:74,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:true,TXD:"SSSA_DLC_HIPSTER"});
      this.vehicleData.push({BRAND:"BRAVADO",VEHICLE:"DLC_CAR_4",PAGEID:75,PRICE:-1,RANK:-1,SEATS:"02",IS_DLC:true,TXD:"SSSA_DLC_HIPSTER"});
      this.TXDarray = new Array();
      this.carNameStr = new Array();
      this.carManuStr = new Array();
      this.displayArray = new Array();
      this.categoryData = new Array();
      if(this.isMP == false)
      {
         this.displayArray = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
         this.categoryData[0] = [1,"2DOOR"];
         this.categoryData[1] = [6,"SPORTS"];
         this.categoryData[2] = [13,"OFFROAD"];
         this.categoryData[3] = [15,"4DOOR"];
         this.categoryData[4] = [17,"LUXURY"];
         this.categoryData[5] = [24,"MOTORBIKES"];
      }
      else
      {
         this.displayArray = [39,40,41,66,67,68,69,1,2,36,3,4,5,50,62,64,65,13,14,46,32,42,43,44,45,15,16,48,49,52,53,54,55,56,57,58,59,60,61,63,19,20,51,21,22,34,23,38,24,37,26,27,28,29,30,47,31,25,33,35];
         this.categoryData[0] = [1,"2DOOR"];
         this.categoryData[1] = [13,"OFFROAD"];
         this.categoryData[2] = [15,"4DOOR"];
         this.categoryData[3] = [19,"LUXURY"];
         this.categoryData[4] = [24,"MOTORBIKES"];
      }
      this.carColoursArray = new Array();
      this.carColoursArray.push(new Array(0,0,0));
      this.carColoursArray.push(new Array(204,0,0));
      this.carColoursArray.push(new Array(255,0,153));
      this.carColoursArray.push(new Array(255,255,0));
      this.carColoursArray.push(new Array(253,173,7));
      this.carColoursArray.push(new Array(102,204,51));
      this.carColoursArray.push(new Array(0,102,204));
      this.carColoursArray.push(new Array(25,25,25));
      this.carColoursArray.push(new Array(255,255,255));
   }
   function READY()
   {
   }
   function SET_PRICES(slotID, price)
   {
      if(slotID < 34)
      {
         this.vehicleData[slotID - 2].PRICE = price;
      }
      else
      {
         this.vehicleData[slotID - 6].PRICE = price;
      }
   }
   function SET_RANKS(slotID, rank, current)
   {
      if(slotID < 34)
      {
         this.vehicleData[slotID - 2].RANK = rank;
      }
      else
      {
         this.vehicleData[slotID - 6].RANK = rank;
      }
      if(current != undefined)
      {
         this.currentRank = current;
      }
   }
   function getCarStrings()
   {
      var _loc3_;
      var _loc2_;
      if(this.carManuStr.length == 0)
      {
         _loc3_ = 0;
         while(_loc3_ < this.displayArray.length)
         {
            _loc2_ = this.displayArray[_loc3_];
            if(this.vehicleData[_loc2_].BRAND != "")
            {
               this.set_localised_text(-1,this.CONTENT.localisationTF,this.vehicleData[_loc2_].BRAND);
               this.carManuStr[_loc2_] = this.CONTENT.localisationTF.text;
            }
            else
            {
               this.carManuStr[_loc2_] = "";
            }
            if(this.vehicleData[_loc2_].VEHICLE == "CAVCADE2")
            {
               this.set_localised_text(-1,this.CONTENT.localisationTF,"CAVCADE");
            }
            else
            {
               this.set_localised_text(-1,this.CONTENT.localisationTF,this.vehicleData[_loc2_].VEHICLE);
            }
            this.carNameStr[_loc2_] = this.CONTENT.localisationTF.text;
            _loc3_ = _loc3_ + 1;
         }
         this.set_localised_text(-1,this.CONTENT.localisationTF,"WEB_OUTOFSTOCK");
         this.outOfStockStr = this.CONTENT.localisationTF.text;
         this.set_localised_text(-1,this.CONTENT.localisationTF,"ITEM_FREE");
         this.freeStr = this.CONTENT.localisationTF.text;
         this.set_localised_text(-1,this.CONTENT.localisationTF,"SSS_BUYNOW");
         this.buyNowStr = this.CONTENT.localisationTF.text;
      }
   }
   function goToAnchor(AnchorLink)
   {
      var _loc3_ = new Array();
      _loc3_ = AnchorLink.split("_");
      var _loc2_;
      if(_loc3_[0] == "car")
      {
         this.carNumber = parseInt(_loc3_[1]);
         this.browser.GO_TO_WEBPAGE("WWW_SOUTHERNSANANDREASSUPERAUTOS_COM_S_CARDETAILS" + this.carNumber);
      }
      else if(_loc3_[0] == "colour")
      {
         this.colourNumber = parseInt(_loc3_[1]);
         this.setColourPicker(this.colourNumber);
      }
      else if(_loc3_[0] == "PURCHASECAR")
      {
         this.browser.GO_TO_WEBPAGE("WWW_SOUTHERNSANANDREASSUPERAUTOS_COM_S_PURCHASECAR");
      }
      else if(_loc3_[0] == "thumbnail")
      {
         this.carNumber = parseInt(_loc3_[1]);
         _loc2_ = 1;
         while(_loc2_ < 10)
         {
            this.mcScope["PURCHASECAR_" + _loc2_]._y = -50;
            _loc2_ = _loc2_ + 1;
         }
         this.browser.GO_TO_WEBPAGE("WWW_SOUTHERNSANANDREASSUPERAUTOS_COM_S_CARDETAILS" + this.carNumber);
      }
   }
   function setColourPicker(col)
   {
      if(col == 0)
      {
         this.colourNumber = 1;
      }
      else
      {
         this.colourNumber = col;
      }
      var _loc2_ = 1;
      while(_loc2_ < 9)
      {
         this.mcScope["PURCHASECAR_" + _loc2_]._y = -50;
         _loc2_ = _loc2_ + 1;
      }
      var _loc3_;
      if(col == 0)
      {
         _loc3_ = this.mcScope.PURCHASECAR_1;
         this.browser.DISABLE_BUTTON(17,true);
         _loc3_._alpha = 10;
         this.mcScope.colourSelectedMC._y = -50;
      }
      else
      {
         _loc3_ = this.mcScope["PURCHASECAR_" + this.colourNumber];
         this.browser.DISABLE_BUTTON(col + 16,false);
         _loc3_._alpha = 100;
         this.mcScope.colourSelectedMC._x = this.mcScope["colour_" + this.colourNumber]._x;
         this.mcScope.colourSelectedMC._y = this.mcScope["colour_" + this.colourNumber]._y;
         this.prevColourNumber = this.colourNumber;
      }
      if(this.vehicleData[this.carNumber].NOCOLOUR == true)
      {
         _loc3_ = this.mcScope.PURCHASECAR_1;
         this.browser.DISABLE_BUTTON(17,false);
         _loc3_._alpha = 100;
         this.mcScope.colourSelectedMC._y = -50;
      }
      _loc3_._x = 988;
      _loc3_._y = 333;
   }
   function colouriseButtons()
   {
      var _loc2_;
      if(this.vehicleData[this.carNumber].NOCOLOUR != true)
      {
         _loc2_ = 1;
         while(_loc2_ < 9)
         {
            com.rockstargames.ui.utils.Colour.Colourise(this.mcScope["colour_" + _loc2_],this.carColoursArray[_loc2_][0],this.carColoursArray[_loc2_][1],this.carColoursArray[_loc2_][2],100);
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function makeThumbnails(startSlot)
   {
      var _loc16_ = 627;
      var _loc9_ = 255;
      var _loc17_ = 1000;
      var _loc4_ = _loc9_;
      var _loc6_ = 407;
      var _loc10_ = 1;
      var _loc5_ = 0;
      var _loc3_;
      var _loc2_;
      var _loc8_;
      while(_loc5_ < this.displayArray.length)
      {
         _loc3_ = this.displayArray[_loc5_];
         if(this.vehicleData[_loc3_].PRICE != -1)
         {
            _loc2_ = "thumbnail_" + _loc3_;
            if(this.mcScope[_loc2_] == undefined)
            {
               _loc8_ = this.mcScope.attachMovie("button_car_box",_loc2_,this.mcScope.getNextHighestDepth(),{_x:_loc4_,_y:_loc6_,_alpha:0,_width:72.2,_height:52.6});
            }
            else
            {
               this.mcScope[_loc2_]._x = _loc4_;
               this.mcScope[_loc2_]._y = _loc6_;
            }
            this.displayVehicleImage(_loc2_,_loc3_,this.mcScope[_loc2_]);
            this.dataTextScope[startSlot] = this.mcScope[_loc2_].btnTxt;
            if(this.vehicleData[_loc3_].PRICE == 0)
            {
               this.mcScope[_loc2_].carImages.outOfStock._alpha = 100;
               this.mcScope[_loc2_].carImages.outOfStock.outOfStockTF.autoSize = "center";
               this.mcScope[_loc2_].carImages.outOfStock.outOfStockTF.multiline = true;
               this.mcScope[_loc2_].carImages.outOfStock.outOfStockTF.wordWrap = true;
               this.mcScope[_loc2_].carImages.outOfStock.outOfStockTF.htmlText = this.outOfStockStr;
               this.mcScope[_loc2_].carImages.outOfStock.outOfStockTF._y = 85 - this.mcScope[_loc2_].carImages.outOfStock.outOfStockTF._height / 2;
               this.dataTextScope[startSlot] = undefined;
            }
            else if(this.vehicleData[_loc3_].PRICE > 0 || isNaN(this.vehicleData[_loc3_].PRICE))
            {
               this.mcScope[_loc2_].carImages.outOfStock._alpha = 0;
            }
            if(this.isMP == true)
            {
               if(this.vehicleData[_loc3_].RANK > this.currentRank)
               {
                  _loc8_ = this.mcScope[_loc2_].attachMovie("MP_RANK BIG","MPrankBig",this.mcScope[_loc2_].getNextHighestDepth());
                  _loc8_.rankTF.text = this.vehicleData[_loc3_].RANK;
                  this.dataTextScope[startSlot] = undefined;
               }
            }
            this.mcScope[_loc2_]._alpha = 100;
            startSlot = startSlot + 1;
            _loc16_ = _loc6_ + 98;
            _loc4_ += 77;
            if(_loc4_ > _loc17_)
            {
               _loc10_ = _loc10_ + 1;
               if(!(_loc10_ & 1) == true)
               {
                  _loc4_ = _loc9_ - 35;
               }
               else
               {
                  _loc4_ = _loc9_;
               }
               _loc6_ += 61;
            }
         }
         _loc5_ = _loc5_ + 1;
      }
      return _loc16_;
   }
   function labelAsDlcPack(targetMc, selection)
   {
      targetMc.carImages.dlcPackTF.text = "";
      var _loc2_;
      if(this.vehicleData[selection].IS_DLC == true)
      {
         _loc2_ = targetMc.carImages.dlcPackTF;
         _loc2_._visible = false;
         _loc2_.autoSize = "center";
         _loc2_.multiline = true;
         _loc2_.wordWrap = true;
         if(selection >= 39 && selection <= 41)
         {
            this.set_localised_text(-1,_loc2_,"SSS_BEACHBUM",true);
         }
         if(this.vehicleData[selection].TXD == "SSSA_DLC_HIPSTER")
         {
            this.set_localised_text(-1,_loc2_,"WEB_HIPSTERPACK",true);
         }
         _loc2_._visible = true;
      }
   }
   function POPULATE_TEXT(pageName, searchArgs, newPage)
   {
      this.CONTENT._y = 0;
      this.browser.SUPRESS_HISTORY(false);
      this.getCarStrings();
      var _loc19_ = pageName;
      if(_loc19_.substring(0,10) == "CARDETAILS")
      {
         _loc19_ = "CARDETAILS";
      }
      else
      {
         this.prevCarNumber = undefined;
      }
      var _loc10_;
      if(this.TXDarray.length > 0)
      {
         _loc10_ = 0;
         while(_loc10_ < this.TXDarray.length)
         {
            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_BROWSER",this.TXDarray[_loc10_],"loadedCheck");
            _loc10_ = _loc10_ + 1;
         }
      }
      var _loc23_;
      var _loc7_;
      var _loc17_;
      var _loc8_;
      var _loc5_;
      var _loc18_;
      var _loc12_;
      var _loc13_;
      var _loc3_;
      var _loc9_;
      var _loc4_;
      var _loc6_;
      var _loc11_;
      var _loc22_;
      var _loc2_;
      var _loc21_;
      var _loc20_;
      switch(_loc19_)
      {
         case "PAGE1":
            clearInterval(this.intervalId);
            this.mcScope = this.CONTENT.PAGE1;
            this.set_localised_text(0,this.CONTENT.localisationTF,"SSS_TOOLBAR");
            this.browser.SET_TITLEBAR_TEXT(this.CONTENT.localisationTF.text,14474460);
            this.dataTextScope = new Array();
            _loc23_ = 627;
            _loc7_ = 218;
            _loc17_ = 804;
            _loc8_ = _loc7_;
            _loc5_ = 370;
            _loc18_ = 293;
            _loc12_ = 213;
            _loc13_ = 1;
            if(newPage == false)
            {
               _loc10_ = 0;
               while(_loc10_ < this.displayArray.length)
               {
                  _loc3_ = this.displayArray[_loc10_];
                  if(this.vehicleData[_loc3_].PRICE != -1 && this.vehicleData[_loc3_].IS_DLC == true)
                  {
                     if(this.mcScope.CAT_EXCLUSIVE != undefined)
                     {
                        this.mcScope.CAT_EXCLUSIVE.removeMovieClip();
                     }
                     _loc9_ = this.mcScope.attachMovie("categoryHeader","CAT_EXCLUSIVE",this.mcScope.getNextHighestDepth(),{_x:_loc7_,_y:_loc5_});
                     this.set_localised_text(-1,_loc9_.categoryTF,"SSS_EXCLUSIVE");
                     _loc5_ += _loc9_._height;
                     break;
                  }
                  _loc10_ = _loc10_ + 1;
               }
               _loc10_ = 0;
               while(_loc10_ < this.displayArray.length)
               {
                  _loc3_ = this.displayArray[_loc10_];
                  _loc4_ = 0;
                  while(_loc4_ < this.categoryData.length)
                  {
                     if(this.categoryData[_loc4_][0] == _loc3_)
                     {
                        _loc6_ = "CAT_" + this.categoryData[_loc4_][1];
                        if(this.mcScope[_loc6_] != undefined)
                        {
                           this.mcScope[_loc6_].removeMovieClip();
                        }
                        if(_loc8_ > _loc7_)
                        {
                           _loc5_ += _loc12_;
                        }
                        _loc9_ = this.mcScope.attachMovie("categoryHeader",_loc6_,this.mcScope.getNextHighestDepth(),{_x:_loc7_,_y:_loc5_});
                        _loc11_ = "SSS_" + this.categoryData[_loc4_][1];
                        this.set_localised_text(-1,_loc9_.categoryTF,_loc11_);
                        _loc8_ = _loc7_;
                        _loc5_ += _loc9_._height;
                        break;
                     }
                     _loc4_ = _loc4_ + 1;
                  }
                  if(this.vehicleData[_loc3_].PRICE != -1)
                  {
                     _loc22_ = "car_" + _loc3_;
                     if(this.mcScope[_loc22_] != undefined)
                     {
                        this.mcScope[_loc22_].removeMovieClip();
                     }
                     _loc2_ = this.mcScope.attachMovie("button_car_box",_loc22_,this.mcScope.getNextHighestDepth(),{_x:_loc8_,_y:_loc5_,_alpha:0});
                     this.displayVehicleImage(_loc22_,_loc3_,_loc2_);
                     _loc2_.btnTxt.text = this.carManuStr[_loc3_] + " " + this.carNameStr[_loc3_];
                     this.dataTextScope[_loc13_] = _loc2_.btnTxt;
                     _loc2_.carImages.outOfStock._alpha = 0;
                     if(this.vehicleData[_loc3_].PRICE == 0)
                     {
                        _loc2_.carImages.outOfStock._alpha = 100;
                        _loc2_.carImages.outOfStock.outOfStockTF.autoSize = "center";
                        _loc2_.carImages.outOfStock.outOfStockTF.multiline = true;
                        _loc2_.carImages.outOfStock.outOfStockTF.wordWrap = true;
                        _loc2_.carImages.outOfStock.outOfStockTF.htmlText = this.outOfStockStr;
                        _loc2_.carImages.outOfStock.outOfStockTF._y = 85 - _loc2_.carImages.outOfStock.outOfStockTF._height / 2;
                        this.dataTextScope[_loc13_] = undefined;
                     }
                     else if(this.vehicleData[_loc3_].PRICE > 0 || isNaN(this.vehicleData[_loc3_].PRICE))
                     {
                        this.set_price_text(_loc2_.priceTF,this.vehicleData[_loc3_].PRICE);
                     }
                     if(this.isMP == true)
                     {
                        if(this.vehicleData[_loc3_].RANK > this.currentRank)
                        {
                           _loc21_ = _loc2_.attachMovie("MP_RANK","MPrank",_loc2_.getNextHighestDepth());
                           _loc21_.rankTF.text = this.vehicleData[_loc3_].RANK;
                           this.dataTextScope[_loc13_] = undefined;
                        }
                        if(this.vehicleData[_loc3_].SEATS != "")
                        {
                           _loc21_ = _loc2_.attachMovie("MP_VEHICLE_NUMBER","MPseats",_loc2_.getNextHighestDepth());
                           _loc21_.seatsTF.text = this.vehicleData[_loc3_].SEATS;
                        }
                     }
                     _loc13_ = _loc13_ + 1;
                     _loc2_._alpha = 100;
                     _loc23_ = _loc5_ + _loc12_ + 44;
                     _loc8_ += _loc18_;
                     if(_loc8_ > _loc17_)
                     {
                        _loc8_ = _loc7_;
                        _loc5_ += _loc12_;
                     }
                  }
                  _loc10_ = _loc10_ + 1;
               }
            }
            this.set_localised_text(-1,this.mcScope.header,"SSS_PG1_HEADER");
            this.set_localised_text(-1,this.mcScope.body1,"SSS_PG1_BODY1");
            this.set_localised_text(-1,this.mcScope.header2,"SSS_PG1_HEADER2");
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = _loc23_;
            this.CONTENT.background._height = _loc23_;
            break;
         case "CARDETAILS":
            clearInterval(this.intervalId);
            this.mcScope = this.CONTENT.CARDETAILS;
            this.prevColourNumber = undefined;
            _loc20_ = pageName.split("CARDETAILS");
            this.carNumber = parseInt(_loc20_[1]);
            if(newPage == true)
            {
               this.dataTextScope = new Array();
               this.dataTextScope[0] = this.mcScope.WWW_SOUTHERNSANANDREASSUPERAUTOS_COM.btnTxt;
               if(this.vehicleData[this.carNumber].LIVERY1 != undefined)
               {
                  this.mcScope.gotoAndStop("LIVERY");
               }
               else if(this.vehicleData[this.carNumber].NOCOLOUR == true)
               {
                  this.mcScope.gotoAndStop("NOCOLOURS");
               }
               else
               {
                  this.mcScope.gotoAndStop("COLOURS");
                  this.colouriseButtons();
               }
               this.mcScope.carImages.outOfStock._alpha = 0;
               if(this.vehicleData[this.carNumber].NOCOLOUR != true)
               {
                  this.dataTextScope[9] = this.mcScope.colour_1.btnTxt;
                  this.dataTextScope[10] = this.mcScope.colour_2.btnTxt;
                  this.dataTextScope[11] = this.mcScope.colour_3.btnTxt;
                  this.dataTextScope[12] = this.mcScope.colour_4.btnTxt;
                  if(this.vehicleData[this.carNumber].LIVERY1 != undefined)
                  {
                     this.set_localised_text(9,this.mcScope.colour_1.btnTxt,this.vehicleData[this.carNumber].LIVERY1);
                     this.set_localised_text(10,this.mcScope.colour_2.btnTxt,this.vehicleData[this.carNumber].LIVERY2);
                     this.set_localised_text(11,this.mcScope.colour_3.btnTxt,this.vehicleData[this.carNumber].LIVERY3);
                     this.set_localised_text(12,this.mcScope.colour_4.btnTxt,this.vehicleData[this.carNumber].LIVERY4);
                  }
                  else
                  {
                     this.dataTextScope[13] = this.mcScope.colour_5.btnTxt;
                     this.dataTextScope[14] = this.mcScope.colour_6.btnTxt;
                     this.dataTextScope[15] = this.mcScope.colour_7.btnTxt;
                     this.dataTextScope[16] = this.mcScope.colour_8.btnTxt;
                  }
               }
               _loc10_ = 1;
               while(_loc10_ < 10)
               {
                  this.mcScope["PURCHASECAR_" + _loc10_].btnTxt.text = this.buyNowStr;
                  this.dataTextScope[_loc10_ + 16] = this.mcScope["PURCHASECAR_" + _loc10_].btnTxt;
                  _loc10_ = _loc10_ + 1;
               }
               this.set_localised_text(8,this.mcScope.selectColourTF,"LGM_COLOUR");
               if(this.isMP == true)
               {
                  if(this.vehicleData[this.carNumber].SEATS != "")
                  {
                     if(this.mcScope.carImages.MPseats != undefined)
                     {
                        this.mcScope.carImages.MPseats.removeMovieClip();
                     }
                     _loc21_ = this.mcScope.carImages.attachMovie("MP_VEHICLE_NUMBER","MPseats",this.mcScope.carImages.getNextHighestDepth());
                     _loc21_.seatsTF.text = this.vehicleData[this.carNumber].SEATS;
                  }
               }
               this.mcScope.body.multiline = true;
               this.mcScope.body.wordWrap = true;
               _loc22_ = "mainImage_" + this.carNumber;
               if(this.prevCarNumber != this.carNumber)
               {
                  this.mcScope.carImages.vehicleTF.text = "";
                  this.prevCarNumber = this.carNumber;
               }
               this.displayVehicleImage(_loc22_,this.carNumber,this.mcScope);
               this.mcScope.carNameTF.text = this.carManuStr[this.carNumber] + " " + this.carNameStr[this.carNumber];
               this.set_localised_text(5,this.mcScope.body1,"SSS_" + this.vehicleData[this.carNumber].VEHICLE);
            }
            _loc23_ = this.makeThumbnails(28);
            this.CONTENT.BOUNDING_BOX._height = _loc23_;
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.setColourPicker(0);
            this.set_price_text(this.mcScope.priceTF,this.vehicleData[this.carNumber].PRICE);
            break;
         case "PURCHASECAR":
            clearInterval(this.intervalId);
            this.mcScope = this.CONTENT.PURCHASECAR;
            this.mcScope.body1._alpha = 0;
            this.mcScope.soldTF._alpha = 0;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_SOUTHERNSANANDREASSUPERAUTOS_COM.btnTxt;
            this.set_localised_text(5,this.mcScope.body1,"SSS_PURCHASED");
            this.mcScope.body1.autoSize = true;
            this.set_localised_text(6,this.mcScope.soldTF,"WEB_SOLD");
            this.mcScope.body.multiline = true;
            this.mcScope.body.wordWrap = true;
            _loc22_ = "mainImage_" + this.carNumber;
            this.displayVehicleImage(_loc22_,this.carNumber,this.mcScope);
            this.mcScope.carNameTF.text = this.carManuStr[this.carNumber] + " " + this.carNameStr[this.carNumber];
            this.set_price_text(this.mcScope[_loc22_].priceTF,this.vehicleData[this.carNumber].PRICE);
            if(this.vehicleData[this.carNumber].LIVERY1 != undefined || this.vehicleData[this.carNumber].NOCOLOUR == true)
            {
               this.mcScope.colour._alpha = 0;
            }
            else
            {
               com.rockstargames.ui.utils.Colour.Colourise(this.mcScope.colour,this.carColoursArray[this.prevColourNumber][0],this.carColoursArray[this.prevColourNumber][1],this.carColoursArray[this.prevColourNumber][2],100);
            }
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 627;
            this.intervalId = setInterval(this,"displayPurchasedText",1500);
            break;
         case "PURCHASE_D_FAILED":
            this.mcScope = this.CONTENT.PURCHASE_D_FAILED;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_SOUTHERNSANANDREASSUPERAUTOS_COM.btnTxt;
            this.set_localised_text(1,this.mcScope.soldTF,"WEB_NOT_SOLD");
            this.mcScope.carNameTF.text = this.carManuStr[this.carNumber] + " " + this.carNameStr[this.carNumber];
            this.set_localised_text(-1,this.mcScope.soldTF,"WEB_NOT_SOLD");
            this.mcScope.body1.autoSize = "center";
            this.set_localised_text(-1,this.mcScope.body1,"SSS_FAILED");
            _loc22_ = "mainImage_" + this.carNumber;
            this.displayVehicleImage(_loc22_,this.carNumber,this.mcScope);
            if(this.vehicleData[this.carNumber].LIVERY1 != undefined || this.prevColourNumber == undefined || this.vehicleData[this.carNumber].NOCOLOUR == true)
            {
               this.mcScope.colour._alpha = 0;
            }
            else
            {
               com.rockstargames.ui.utils.Colour.Colourise(this.mcScope.colour,this.carColoursArray[this.prevColourNumber][0],this.carColoursArray[this.prevColourNumber][1],this.carColoursArray[this.prevColourNumber][2],100);
            }
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "PURCHASE_D_ERROR":
            this.mcScope = this.CONTENT.PURCHASE_D_ERROR;
            this.dataTextScope = new Array();
            this.dataTextScope[0] = this.mcScope.WWW_SOUTHERNSANANDREASSUPERAUTOS_COM.btnTxt;
            this.dataTextScope[1] = this.mcScope.soldTF;
            if(this.dataProviderUI[1][0] != undefined)
            {
               this.dataTextScope[1].text = this.dataProviderUI[1][0];
            }
            this.mcScope.body1.multiline = true;
            this.mcScope.body1.autoSize = "center";
            if(this.dataProviderUI[2][0] != undefined)
            {
               this.mcScope.body1.text = this.dataProviderUI[2][0];
            }
            this.mcScope.carNameTF.text = this.carManuStr[this.carNumber] + " " + this.carNameStr[this.carNumber];
            this.set_localised_text(-1,this.mcScope.soldTF,"WEB_NOT_SOLD");
            _loc22_ = "mainImage_" + this.carNumber;
            this.displayVehicleImage(_loc22_,this.carNumber,this.mcScope);
            if(this.vehicleData[this.carNumber].LIVERY1 != undefined || this.prevColourNumber == undefined || this.vehicleData[this.carNumber].NOCOLOUR == true)
            {
               this.mcScope.colour._alpha = 0;
            }
            else
            {
               com.rockstargames.ui.utils.Colour.Colourise(this.mcScope.colour,this.carColoursArray[this.prevColourNumber][0],this.carColoursArray[this.prevColourNumber][1],this.carColoursArray[this.prevColourNumber][2],100);
            }
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 627;
            break;
         case "PURCHASE_D_CONFIRM":
            this.mcScope = this.CONTENT.PURCHASE_D_CONFIRM;
            this.dataTextScope = new Array();
            this.mcScope.body.multiline = true;
            this.mcScope.body.wordWrap = true;
            this.dataTextScope[1] = this.mcScope.body;
            if(this.dataProviderUI[1] != undefined)
            {
               this.dataTextScope[1].htmlText = this.dataProviderUI[1];
            }
            this.dataTextScope[2] = this.mcScope.PURCHASECAR.btnTxt;
            if(this.dataProviderUI[2] != undefined)
            {
               this.dataTextScope[2].htmlText = this.dataProviderUI[2];
            }
            this.dataTextScope[3] = this.mcScope.PURCHASE_D_FAILED.btnTxt;
            if(this.dataProviderUI[3] != undefined)
            {
               this.dataTextScope[3].htmlText = this.dataProviderUI[3];
            }
            this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
            this.CONTENT.BOUNDING_BOX._height = 627;
         default:
            return;
      }
   }
   function displayPurchasedText()
   {
      clearInterval(this.intervalId);
      this.mcScope.carNameTF._alpha = 100;
      this.mcScope.body1._alpha = 100;
      this.mcScope.soldTF._alpha = 100;
   }
   function set_localised_text(slotID, TF, TextLabel, setDataSlot)
   {
      this.dataTextScope[slotID] = TF;
      var _loc3_ = TF.html;
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,TextLabel,TF,_loc3_);
   }
   function set_price_text(TF, price)
   {
      TF.text = "";
      var _loc5_;
      var _loc3_;
      var _loc7_;
      var _loc6_;
      var _loc2_;
      var _loc8_;
      if(price > 0 || isNaN(price))
      {
         TF._visible = false;
         if(isNaN(price))
         {
            TF.multiline = true;
            TF.wordWrap = true;
            TF.textAutoSize = "shrink";
            TF.htmlText = price;
         }
         else
         {
            _loc3_ = price.toString();
            _loc7_ = _loc3_.length;
            if(_loc7_ > 3)
            {
               _loc6_ = "";
               _loc2_ = _loc3_.slice(0,-3);
               _loc8_ = "," + _loc3_.slice(-3);
               if(_loc2_.length > 3)
               {
                  _loc6_ = _loc2_.slice(0,-3) + ",";
                  _loc2_ = _loc2_.slice(-3);
               }
               _loc5_ = _loc6_ + _loc2_ + _loc8_;
            }
            else
            {
               _loc5_ = _loc3_;
            }
            TF.text = "$" + _loc5_;
         }
         if(TF._y == 128.35)
         {
            TF._y = 168 - TF._height;
         }
         TF._visible = true;
      }
   }
   function displayVehicleImage(mcName, vehicleIndex, targetMc)
   {
      if(this.vehicleData[vehicleIndex].TXD == undefined)
      {
         targetMc.carImages.gotoAndStop(this.vehicleData[vehicleIndex].VEHICLE);
      }
      else
      {
         targetMc.carImages.gotoAndStop(1);
         if(this.hasTxdLoaded(this.vehicleData[vehicleIndex].TXD) == true)
         {
            this.addImageToTextfield(this.vehicleData[vehicleIndex].TXD,mcName);
         }
         else
         {
            com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_BROWSER",this.vehicleData[vehicleIndex].TXD,mcName,true);
         }
      }
      if(mcName.substr(0,9) != "thumbnail")
      {
         this.labelAsDlcPack(targetMc,vehicleIndex);
      }
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      if(success == true)
      {
         if(this.hasTxdLoaded(textureDict) == false)
         {
            this.TXDarray.push(textureDict);
         }
         if(uniqueID != "loadedCheck")
         {
            this.addImageToTextfield(textureDict,uniqueID);
         }
      }
   }
   function addImageToTextfield(textureDict, mcName)
   {
      var _loc2_ = new Array();
      _loc2_ = mcName.split("_");
      var _loc4_ = parseInt(_loc2_[1]);
      var _loc5_ = this.vehicleData[_loc4_].VEHICLE;
      var _loc3_;
      if(_loc2_[0] == "mainImage")
      {
         _loc3_ = this.mcScope;
      }
      else
      {
         _loc3_ = this.mcScope[mcName];
      }
      _loc3_.carImages.vehicleTF.htmlText = "<img src=\'img://" + textureDict + "/" + _loc5_ + "\' vspace=\'0\' hspace=\'0\' width=\'256\' height=\'170\'/>";
   }
   function hasTxdLoaded(textureDict)
   {
      var _loc3_ = false;
      var _loc2_ = 0;
      while(_loc2_ < this.TXDarray.length)
      {
         if(this.TXDarray[_loc2_] == textureDict)
         {
            _loc3_ = true;
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
   }
   function CLEANUP()
   {
      var _loc2_;
      if(this.TXDarray.length > 0)
      {
         this.TIMELINE.CONTENT.gotoAndStop(1);
         _loc2_ = 0;
         while(_loc2_ < this.TXDarray.length)
         {
            if(this.TXDarray[_loc2_] != undefined)
            {
               com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_BROWSER",this.TXDarray[_loc2_]);
               this.TXDarray[_loc2_] = undefined;
            }
            _loc2_ = _loc2_ + 1;
         }
         this.TXDarray = new Array();
      }
   }
}
