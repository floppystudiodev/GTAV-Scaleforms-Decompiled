class com.rockstargames.gtav.web.prixluxuryrealestate.Mansion extends com.rockstargames.gtav.web.prixluxuryrealestate.Property
{
   var _description;
   var _id;
   var _isOwned;
   var _location;
   var _name;
   var _ownsAgencyProperty;
   var _ownsArcadeProperty;
   var _purchasedAI;
   var _purchasedArcade;
   var _purchasedArmory;
   var _purchasedArtStudio;
   var _purchasedDecor;
   var _purchasedPattern;
   var _purchasedPodium;
   var _purchasedSecurity;
   var _purchasedTint;
   var _purchasedWorkshop;
   var _txd;
   var _txn;
   var prices;
   static var ai;
   static var arcade;
   static var armory;
   static var artStudio;
   static var decor;
   static var pattern;
   static var podium;
   static var security;
   static var tint;
   static var workshop;
   static var NUM_TINTS = 4;
   static var NUM_PATTERNS = 6;
   static var NUM_DECOR = 3;
   static var NUM_AI = 3;
   static var TINT_INDEX = 0;
   static var PATTERN_INDEX = 1;
   static var DECOR_INDEX = 2;
   static var AI_INDEX = 3;
   static var ARMORY_INDEX = 4;
   static var ARCADE_INDEX = 5;
   static var PODIUM_INDEX = 6;
   static var WORKSHOP_INDEX = 7;
   static var SECURITY_INDEX = 8;
   static var BASE_COST_INDEX = 9;
   static var ART_STUDIO_INDEX = 10;
   function Mansion(data)
   {
      super(data);
   }
   function parseData(data)
   {
      this._id = data[0];
      this._name = data[1];
      this._location = data[2];
      this._description = data[3];
      this._txd = "PRIX_LUXURY_MANSION";
      this._txn = data[4];
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.TINT_INDEX] = [];
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.TINT_INDEX][0] = new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[5],data[6]);
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.TINT_INDEX][1] = new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[7],data[8]);
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.TINT_INDEX][2] = new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[9],data[10]);
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.TINT_INDEX][3] = new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[11],data[12]);
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PATTERN_INDEX] = [];
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PATTERN_INDEX][0] = new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[13],data[14]);
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PATTERN_INDEX][1] = new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[15],data[16]);
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PATTERN_INDEX][2] = new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[17],data[18]);
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PATTERN_INDEX][3] = new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[19],data[20]);
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PATTERN_INDEX][4] = new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[21],data[22]);
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PATTERN_INDEX][5] = new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[23],data[24]);
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.DECOR_INDEX] = [];
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.DECOR_INDEX][0] = new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[25],data[26]);
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.DECOR_INDEX][1] = new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[27],data[28]);
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.DECOR_INDEX][2] = new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[29],data[30]);
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.AI_INDEX] = [];
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.AI_INDEX][0] = new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[31],data[32]);
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.AI_INDEX][1] = new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[33],data[34]);
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.AI_INDEX][2] = new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[35],data[36]);
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ARMORY_INDEX] = [new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[37],data[38])];
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ARCADE_INDEX] = [new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[39],data[40])];
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.PODIUM_INDEX] = [new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[41],data[42])];
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.WORKSHOP_INDEX] = [new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[43],data[44])];
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ART_STUDIO_INDEX] = [new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[61],data[62])];
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.SECURITY_INDEX] = [new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[45],data[46])];
      this.prices[com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.BASE_COST_INDEX] = [new com.rockstargames.gtav.web.prixluxuryrealestate.Price(data[47],data[48])];
      this._purchasedTint = data[49];
      this._purchasedPattern = data[50];
      this._purchasedDecor = data[51];
      this._purchasedAI = data[52];
      this._purchasedArmory = data[53];
      this._purchasedArcade = data[54];
      this._purchasedPodium = data[55];
      this._purchasedWorkshop = data[56];
      this._purchasedArtStudio = data[60];
      this._purchasedSecurity = data[57];
      this._ownsArcadeProperty = data[58];
      this._ownsAgencyProperty = data[59];
      this._isOwned = this._purchasedTint >= 0;
      com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.resetBasket();
   }
   function get purchasedTint()
   {
      return this._purchasedTint;
   }
   function get purchasedPattern()
   {
      return this._purchasedPattern;
   }
   function get purchasedDecor()
   {
      return this._purchasedDecor;
   }
   function get purchasedAI()
   {
      return this._purchasedAI;
   }
   function get purchasedArmory()
   {
      return this._purchasedArmory;
   }
   function get purchasedArcade()
   {
      return this._purchasedArcade;
   }
   function get purchasedPodium()
   {
      return this._purchasedPodium;
   }
   function get purchasedWorkshop()
   {
      return this._purchasedWorkshop;
   }
   function get purchasedArtStudio()
   {
      return this._purchasedArtStudio;
   }
   function get purchasedSecurity()
   {
      return this._purchasedSecurity;
   }
   function get ownsArcadeProperty()
   {
      return this._ownsArcadeProperty;
   }
   function get ownsAgencyProperty()
   {
      return this._ownsAgencyProperty;
   }
   static function resetBasket(m)
   {
      com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.tint = m.purchasedTint != -1 ? m.purchasedTint : 0;
      com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.pattern = m.purchasedPattern != -1 ? m.purchasedPattern : 0;
      com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.decor = m.purchasedDecor != -1 ? m.purchasedDecor : 0;
      com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.ai = m.purchasedAI != -1 ? m.purchasedAI : 0;
      com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.armory = m.purchasedArmory != -1 ? m.purchasedArmory : 0;
      com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.arcade = m.purchasedArcade != -1 ? m.purchasedArcade : 0;
      com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.podium = m.purchasedPodium != -1 ? m.purchasedPodium : 0;
      com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.workshop = m.purchasedWorkshop != -1 ? m.purchasedWorkshop : 0;
      com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.artStudio = m.purchasedArtStudio != -1 ? m.purchasedArtStudio : 0;
      com.rockstargames.gtav.web.prixluxuryrealestate.Mansion.security = m.purchasedSecurity != -1 ? m.purchasedSecurity : 0;
   }
}
