class com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE extends com.rockstargames.ui.core.BaseScreenLayout
{
   var TIMELINE;
   var BOUNDING_BOX;
   var CONTENT;
   var displayConfig;
   var _imageManager;
   var _screenContainer;
   var _cursor;
   var _deactivated;
   var _inputReceived;
   var _currScreenID;
   var _vehicles;
   var _collections;
   var _exportCooldown;
   var _currScreen;
   static var IS_DEBUG = false;
   static var VC_SUPER = 0;
   static var VC_SPORT = 1;
   static var VC_SPORT_CLASSIC = 2;
   static var VC_MUSCLE = 3;
   var _staticVehicleData = {IE_VEH_PROTOTIPO_1:{id:1,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_PROTOTIPO_1"},IE_VEH_PROTOTIPO_2:{id:2,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_PROTOTIPO_2"},IE_VEH_PROTOTIPO_3:{id:3,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_PROTOTIPO_3"},IE_VEH_TYRUS_1:{id:4,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_TYRUS_1"},IE_VEH_TYRUS_2:{id:5,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_TYRUS_2"},IE_VEH_TYRUS_3:{id:6,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_TYRUS_3"},IE_VEH_BESTIAGTS_1:{id:7,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_BESTIAGTS_1"},IE_VEH_BESTIAGTS_2:{id:8,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE
   .VC_SPORT,texture:"IE_VEH_BESTIAGTS_2"},IE_VEH_BESTIAGTS_3:{id:9,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_BESTIAGTS_3"},IE_VEH_T20_1:{id:10,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_T20_1"},IE_VEH_T20_2:{id:11,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_T20_2"},IE_VEH_T20_3:{id:12,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_T20_3"},IE_VEH_SHEAVA_1:{id:13,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_SHEAVA_1"},IE_VEH_SHEAVA_2:{id:14,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_SHEAVA_2"},IE_VEH_SHEAVA_3:{id:15,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_SHEAVA_3"},IE_VEH_OSIRIS_1:{id:16,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE
   .VC_SUPER,texture:"IE_VEH_OSIRIS_1"},IE_VEH_OSIRIS_2:{id:17,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_OSIRIS_2"},IE_VEH_OSIRIS_3:{id:18,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_OSIRIS_3"},IE_VEH_FMJ_1:{id:19,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_FMJ_1"},IE_VEH_FMJ_2:{id:20,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_FMJ_2"},IE_VEH_FMJ_3:{id:21,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_FMJ_3"},IE_VEH_REAPER_1:{id:22,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_REAPER_1"},IE_VEH_REAPER_2:{id:23,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_REAPER_2"},IE_VEH_REAPER_3:{id:24,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_REAPER_3"},IE_VEH_PFISTER811_1:{id:25,category:com
   .rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_PFISTER811_1"},IE_VEH_PFISTER811_2:{id:26,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_PFISTER811_2"},IE_VEH_PFISTER811_3:{id:27,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_PFISTER811_3"},IE_VEH_ALPHA_1:{id:28,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_ALPHA_1"},IE_VEH_ALPHA_2:{id:29,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_ALPHA_2"},IE_VEH_ALPHA_3:{id:30,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_ALPHA_3"},IE_VEH_MAMBA_1:{id:31,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT_CLASSIC,texture:"IE_VEH_MAMBA_1"},IE_VEH_MAMBA_2:{id:32,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT_CLASSIC,texture:"IE_VEH_MAMBA_2"},IE_VEH_MAMBA_3:{id:33,category:com
   .rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT_CLASSIC,texture:"IE_VEH_MAMBA_3"},IE_VEH_TAMPA_1:{id:34,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_MUSCLE,texture:"IE_VEH_TAMPA_1"},IE_VEH_TAMPA_2:{id:35,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_MUSCLE,texture:"IE_VEH_TAMPA_2"},IE_VEH_TAMPA_3:{id:36,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_MUSCLE,texture:"IE_VEH_TAMPA_3"},IE_VEH_BTYPE3_1:{id:37,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT_CLASSIC,texture:"IE_VEH_BTYPE3_1"},IE_VEH_BTYPE3_2:{id:38,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT_CLASSIC,texture:"IE_VEH_BTYPE3_2"},IE_VEH_BTYPE3_3:{id:39,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT_CLASSIC,texture:"IE_VEH_BTYPE3_3"},IE_VEH_FELTZER3_1:{id:40,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT_CLASSIC,texture:"IE_VEH_FELTZER3_1"},IE_VEH_FELTZER3_2:{id:41,category:com
   .rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT_CLASSIC,texture:"IE_VEH_FELTZER3_2"},IE_VEH_FELTZER3_3:{id:42,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT_CLASSIC,texture:"IE_VEH_FELTZER3_3"},IE_VEH_ZTYPE_1:{id:43,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT_CLASSIC,texture:"IE_VEH_ZTYPE_1"},IE_VEH_ZTYPE_2:{id:44,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT_CLASSIC,texture:"IE_VEH_ZTYPE_2"},IE_VEH_ZTYPE_3:{id:45,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT_CLASSIC,texture:"IE_VEH_ZTYPE_3"},IE_VEH_TROPOS_1:{id:46,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_TROPOS_1"},IE_VEH_TROPOS_2:{id:47,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_TROPOS_2"},IE_VEH_TROPOS_3:{id:48,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_TROPOS_3"},IE_VEH_ENTITYXF_1:{id:49,category:com
   .rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_ENTITYXF_1"},IE_VEH_ENTITYXF_2:{id:50,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_ENTITYXF_2"},IE_VEH_ENTITYXF_3:{id:51,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_ENTITYXF_3"},IE_VEH_SULTANRS_1:{id:52,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_SULTANRS_1"},IE_VEH_SULTANRS_2:{id:53,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_SULTANRS_2"},IE_VEH_SULTANRS_3:{id:54,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_SULTANRS_3"},IE_VEH_ZENTORNO_1:{id:55,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_ZENTORNO_1"},IE_VEH_ZENTORNO_2:{id:56,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_ZENTORNO_2"},IE_VEH_ZENTORNO_3:{id:57,category:com
   .rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_ZENTORNO_3"},IE_VEH_OMNIS_1:{id:58,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_OMNIS_1"},IE_VEH_OMNIS_2:{id:59,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_OMNIS_2"},IE_VEH_OMNIS_3:{id:60,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_OMNIS_3"},IE_VEH_COQUETTE3_1:{id:61,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_MUSCLE,texture:"IE_VEH_COQUETTE3_1"},IE_VEH_COQUETTE3_2:{id:62,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_MUSCLE,texture:"IE_VEH_COQUETTE3_2"},IE_VEH_COQUETTE3_3:{id:63,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_MUSCLE,texture:"IE_VEH_COQUETTE3_3"},IE_VEH_SEVEN70_1:{id:64,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_SEVEN70_1"},IE_VEH_SEVEN70_2:{id:65,category:com
   .rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_SEVEN70_2"},IE_VEH_SEVEN70_3:{id:66,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_SEVEN70_3"},IE_VEH_VERLIERER2_1:{id:67,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_VERLIERER2_1"},IE_VEH_VERLIERER2_2:{id:68,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_VERLIERER2_2"},IE_VEH_VERLIERER2_3:{id:69,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_VERLIERER2_3"},IE_VEH_FELTZER2_1:{id:70,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_FELTZER2_1"},IE_VEH_FELTZER2_2:{id:71,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_FELTZER2_2"},IE_VEH_FELTZER2_3:{id:72,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_FELTZER2_3"},IE_VEH_COQUETTE2_1:{id:73,category:com
   .rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT_CLASSIC,texture:"IE_VEH_COQUETTE2_1"},IE_VEH_COQUETTE2_2:{id:74,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT_CLASSIC,texture:"IE_VEH_COQUETTE2_2"},IE_VEH_COQUETTE2_3:{id:75,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT_CLASSIC,texture:"IE_VEH_COQUETTE2_3"},IE_VEH_CHEETAH_1:{id:76,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_CHEETAH_1"},IE_VEH_CHEETAH_2:{id:77,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_CHEETAH_2"},IE_VEH_CHEETAH_3:{id:78,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_CHEETAH_3"},IE_VEH_NIGHTSHADE_1:{id:79,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_MUSCLE,texture:"IE_VEH_NIGHTSHADE_1"},IE_VEH_NIGHTSHADE_2:{id:80,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE
   .VC_MUSCLE,texture:"IE_VEH_NIGHTSHADE_2"},IE_VEH_NIGHTSHADE_3:{id:81,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_MUSCLE,texture:"IE_VEH_NIGHTSHADE_3"},IE_VEH_BANSHEE2_1:{id:82,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_BANSHEE2_1"},IE_VEH_BANSHEE2_2:{id:83,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_BANSHEE2_2"},IE_VEH_BANSHEE2_3:{id:84,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_BANSHEE2_3"},IE_VEH_TURISMOR_1:{id:85,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_TURISMOR_1"},IE_VEH_TURISMOR_2:{id:86,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_TURISMOR_2"},IE_VEH_TURISMOR_3:{id:87,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SUPER,texture:"IE_VEH_TURISMOR_3"},IE_VEH_MASSACRO_1:{id:88,category:com
   .rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_MASSACRO_1"},IE_VEH_MASSACRO_2:{id:89,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_MASSACRO_2"},IE_VEH_MASSACRO_3:{id:90,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_MASSACRO_3"},IE_VEH_SABREGT2_1:{id:91,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_MUSCLE,texture:"IE_VEH_SABREGT2_1"},IE_VEH_SABREGT2_2:{id:92,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_MUSCLE,texture:"IE_VEH_SABREGT2_2"},IE_VEH_SABREGT2_3:{id:93,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_MUSCLE,texture:"IE_VEH_SABREGT2_3"},IE_VEH_JESTER_1:{id:94,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_JESTER_1"},IE_VEH_JESTER_2:{id:95,category:com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_JESTER_2"},IE_VEH_JESTER_3:{id:96,category:com
   .rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.VC_SPORT,texture:"IE_VEH_JESTER_3"}};
   var _staticCollectionData = {METAL:{id:2001,collectionNameToken:"IEW_COLLECTION_METAL",cars:[28,23,90,55]},TROPICAL:{id:2002,collectionNameToken:"IEW_COLLECTION_TROPICAL",cars:[76,4,19,50]},ELEGANT:{id:2003,collectionNameToken:"IEW_COLLECTION_ELEGANT",cars:[82,42,65,87]},RALLY:{id:2004,collectionNameToken:"IEW_COLLECTION_RALLY",cars:[59,48,96,52]},PRETTY:{id:2005,collectionNameToken:"IEW_COLLECTION_PRETTY",cars:[73,67,15]},DECLASSE:{id:2006,collectionNameToken:"IEW_COLLECTION_DECLASSE",cars:[93,34,32]},DANGEROUS:{id:2007,collectionNameToken:"IEW_COLLECTION_DANGEROUS",cars:[2,12,18]},MATTE:{id:2008,collectionNameToken:"IEW_COLLECTION_MATTE",cars:[70,27,7]},MUSCULAR:{id:2009,collectionNameToken:"IEW_COLLECTION_MUSCULAR",cars:[61,80]},WEALTHY:{id:2010,collectionNameToken:"IEW_COLLECTION_WEALTHY",cars:[43,38]}};
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
   static var TXD = "IE_AD_HAWK_WAREHOUSE_CARS";
   var WAREHOUSE_SCREEN = 0;
   var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen];
   function IMPORT_EXPORT_WAREHOUSE()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "IMPORT_EXPORT_WAREHOUSE";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this._imageManager = new com.rockstargames.gtav.levelDesign.importExportWarehouse.ImageManager();
      this._screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      var _loc2_ = this.CONTENT.createEmptyMovieClip("cursorDebugView",this.CONTENT.getNextHighestDepth());
      var _loc3_ = this.CONTENT.attachMovie("cursor","cursor",this.CONTENT.getNextHighestDepth());
      this._cursor = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Cursor(_loc3_,_loc2_,this.displayConfig);
      this._deactivated = false;
      this._inputReceived = false;
      this._currScreenID = -1;
      this._vehicles = [];
      this._collections = [];
      this._exportCooldown = 0;
      this.createVehicleClasses();
      if(com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.IS_DEBUG)
      {
         this.debugCalls();
      }
   }
   function debugCalls()
   {
      var _loc2_ = 1;
      while(_loc2_ < 41)
      {
         this.UPDATE_VEHICLE(_loc2_,_loc2_,_loc2_,false,true,0,10);
         _loc2_ = _loc2_ + 1;
      }
      var _loc3_ = 2001;
      while(_loc3_ < 2011)
      {
         this.UPDATE_COLLECTION(_loc3_,_loc3_,false,false);
         _loc3_ = _loc3_ + 1;
      }
      this.SHOW_EXPORT_SCREEN();
      this.SET_COOLDOWN(240);
   }
   function ACTIVATE()
   {
      this._deactivated = false;
   }
   function DEACTIVATE()
   {
      this._deactivated = true;
   }
   function SHOW_EXPORT_SCREEN()
   {
      this.showScreen(this.WAREHOUSE_SCREEN);
   }
   function UPDATE_VEHICLE(id, value, collectionValue, selected, owned, rangeCategory, actualValue)
   {
      var _loc6_ = this.getVehicleById(id);
      if(_loc6_)
      {
         var _loc4_ = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Vehicle(_loc6_.id,_loc6_.texture,_loc6_.texture,_loc6_.category,value,collectionValue,selected,owned,rangeCategory,actualValue);
         var _loc5_ = false;
         var _loc2_ = 0;
         var _loc3_ = this._vehicles.length;
         while(_loc2_ < _loc3_)
         {
            if(this._vehicles[_loc2_].id == id)
            {
               this._vehicles.splice(_loc2_,1,_loc4_);
               _loc5_ = true;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
         if(!_loc5_)
         {
            this._vehicles.push(_loc4_);
         }
      }
   }
   function UPDATE_COLLECTION(id, value, selected, disabled)
   {
      var _loc7_ = this.getCollectionFromStaticDataById(id);
      if(_loc7_)
      {
         var _loc9_ = [];
         var _loc8_ = _loc7_.cars.length;
         var _loc11_ = 0;
         var _loc4_ = 0;
         while(_loc4_ < _loc8_)
         {
            var _loc3_ = this.getVehicleById(_loc7_.cars[_loc4_]);
            _loc3_.associatedCollection = id;
            if(_loc3_.owned)
            {
               _loc11_ = _loc11_ + 1;
            }
            _loc9_.push(_loc3_);
            _loc4_ = _loc4_ + 1;
         }
         var _loc14_ = _loc8_ != 0 ? Math.floor(_loc11_ / _loc8_ * 100) : 0;
         var _loc10_ = new com.rockstargames.gtav.levelDesign.importExportWarehouse.VehicleCollection(id,_loc7_.collectionNameToken,value,_loc9_,selected,disabled,_loc14_);
         var _loc12_ = false;
         var _loc2_ = 0;
         var _loc5_ = this._collections.length;
         while(_loc2_ < _loc5_)
         {
            if(this._collections[_loc2_].id == id)
            {
               if(disabled)
               {
                  this._collections.splice(_loc2_,1);
               }
               else
               {
                  this._collections.splice(_loc2_,1,_loc10_);
               }
               _loc12_ = true;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
         if(!_loc12_)
         {
            this._collections.push(_loc10_);
         }
      }
   }
   function SHOW_BUYERS(buyerRequirement0, buyerRequirement1, buyerRequirement2, buyerValue0, buyerValue1, buyerValue2, buyer0Available, buyer1Available, buyer2Available)
   {
      var _loc4_ = [buyerRequirement0,buyerRequirement1,buyerRequirement2];
      var _loc2_ = [buyerValue0,buyerValue1,buyerValue2];
      var _loc3_ = [buyer0Available,buyer1Available,buyer2Available];
      if(this._currScreen instanceof com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen)
      {
         com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen(this._currScreen).showBuyers(_loc4_,_loc2_,_loc3_);
      }
   }
   function SET_COOLDOWN(cooldownSeconds)
   {
      var _loc2_ = getTimer();
      this._exportCooldown = 1000 * cooldownSeconds + _loc2_;
      if(this._currScreen instanceof com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen)
      {
         com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen(this._currScreen).setCooldown(this._exportCooldown);
      }
   }
   function SHOW_OVERLAY(titleLabel, messageLabel, acceptButtonLabel, cancelButtonLabel)
   {
      if(this._deactivated)
      {
         return undefined;
      }
      if(this._currScreen instanceof com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen)
      {
         com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen(this._currScreen).showOverlay(titleLabel,messageLabel,acceptButtonLabel,cancelButtonLabel);
      }
   }
   function HIDE_OVERLAY()
   {
      if(this._deactivated)
      {
         return undefined;
      }
      if(this._currScreen instanceof com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen)
      {
         com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen(this._currScreen).hideOverlay();
      }
   }
   function GET_CURRENT_SELECTION()
   {
      if(this._inputReceived)
      {
         return this._cursor.getTargetIDUnderCursor();
      }
      return -1;
   }
   function GET_CURRENT_TAB_ID()
   {
      if(this._currScreen instanceof com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen)
      {
         return com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen(this._currScreen).activeTabIndex;
      }
   }
   function SET_INPUT_EVENT(inputID)
   {
      if(this._deactivated)
      {
         return undefined;
      }
      this._inputReceived = true;
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.Cursor.UP:
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.Cursor.RIGHT:
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.Cursor.DOWN:
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.Cursor.LEFT:
            var _loc3_ = this._cursor.setTarget(inputID);
            if(_loc3_)
            {
               com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.playSound("Mouse_Move_Cursor");
            }
            break;
         case com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.ACCEPT:
         case com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.LEFT_MOUSE:
            com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.playSound("Mouse_Click");
      }
      this._currScreen.handleButtonInput(inputID);
   }
   function SET_INPUT_RELEASE_EVENT(inputID)
   {
      this._currScreen.handleButtonInputRelease(inputID);
   }
   function SET_ANALOG_STICK_INPUT(isLeftStick, x, y, isMouseWheel)
   {
      if(isLeftStick)
      {
         this._cursor.moveBy(x,y);
      }
      this._currScreen.handleJoystickInput(isLeftStick,x,y,isMouseWheel);
   }
   function SET_CURSOR_SPEED(speed)
   {
      this._cursor.setSpeed(speed);
   }
   function SET_MOUSE_INPUT(x, y)
   {
      this._cursor.moveTo(x,y,true);
      this._currScreen.handleMouseInput(x,y);
   }
   static function setLocalisedText(tf, label)
   {
      if(com.rockstargames.gtav.levelDesign.IMPORT_EXPORT_WAREHOUSE.IS_DEBUG)
      {
         tf.text = label;
         return label;
      }
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
   static function formatNumber(value)
   {
      var _loc3_ = Math.abs(int(value)).toString();
      var _loc4_ = _loc3_.length;
      var _loc2_ = 0;
      var _loc1_ = _loc4_ % 3 || 3;
      var _loc5_ = (value >= 0 ? "" : "-") + _loc3_.slice(_loc2_,_loc1_);
      while(_loc1_ < _loc4_)
      {
         _loc2_ = _loc1_;
         _loc1_ += 3;
         _loc5_ += "," + _loc3_.slice(_loc2_,_loc1_);
      }
      return _loc5_;
   }
   static function playSound(soundName, soundSet)
   {
      if(soundSet == undefined)
      {
         soundSet = "GTAO_IE_Vehicle_Warehouse_PC_Sounds";
      }
      com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,soundName,soundSet);
   }
   function showScreen(screenID)
   {
      if(this._currScreen)
      {
         this._imageManager.clearImageQueue();
         this._currScreen.dispose();
      }
      this._cursor.setState(com.rockstargames.gtav.levelDesign.importExportWarehouse.Cursor.STATE_ARROW);
      this._currScreen = new this.SCREEN_CLASSES[screenID](this,this._screenContainer,this._cursor);
      this._currScreenID = screenID;
      this._inputReceived = false;
   }
   function TXD_HAS_LOADED(txd, success, id)
   {
      if(success)
      {
         this._imageManager.textureLoaded(txd);
      }
   }
   function getVehicleById(id)
   {
      var _loc4_ = this._vehicles.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = this._vehicles[_loc2_];
         if(_loc3_.id == id)
         {
            return _loc3_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function getCollectionFromStaticDataById(id)
   {
      for(var _loc5_ in this._staticCollectionData)
      {
         var _loc2_ = this._staticCollectionData[_loc5_];
         for(var _loc4_ in _loc2_)
         {
            if(_loc2_[_loc4_] == id)
            {
               return _loc2_;
            }
         }
      }
      return null;
   }
   function createVehicleClasses()
   {
      for(var _loc4_ in this._staticVehicleData)
      {
         var _loc2_ = this._staticVehicleData[_loc4_];
         var _loc3_ = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Vehicle(_loc2_.id,_loc2_.texture,_loc2_.texture,_loc2_.category,0,0,false,false);
         this._vehicles.push(_loc3_);
      }
      this._staticVehicleData = [];
   }
   function set vehicles(value)
   {
      this._vehicles = value;
   }
   function set collections(value)
   {
      this._collections = value;
   }
   function get vehicles()
   {
      return this._vehicles;
   }
   function get imageManager()
   {
      return this._imageManager;
   }
   function get collections()
   {
      return this._collections;
   }
   function get exportCooldown()
   {
      return this._exportCooldown;
   }
}
