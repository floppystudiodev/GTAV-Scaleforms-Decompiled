class com.rockstargames.gtav.web.WWW_VINEWOODLOGLINEGENERATOR_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var PAGE_NAMES;
   var CAN_STORE_PAGE;
   var browser;
   var selectedGenCharacterFlawsId;
   var selectedGenCharacterStrengthsId;
   var selectedGenCrisesId;
   var selectedGenHeroId;
   var selectedGenSidekickId;
   var selectedGenSpecialPowersId;
   var selectedGenAntagonistId;
   var selectedGenGoalId;
   var optionCount;
   var genCharacterFlaws;
   var genCharacterStrengths;
   var genCrises;
   var genHero;
   var genSidekick;
   var genSpecialPowers;
   var genAntagonist;
   var genGoal;
   var mcScope;
   var CONTENT;
   var dataTextScope;
   function WWW_VINEWOODLOGLINEGENERATOR_COM()
   {
      super();
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "PAGE2";
      this.PAGE_NAMES[3] = "PAGE3";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = false;
      this.browser = _level0.TIMELINE;
   }
   function READY()
   {
   }
   function initGenerator()
   {
      this.selectedGenCharacterFlawsId = 0;
      this.selectedGenCharacterStrengthsId = 0;
      this.selectedGenCrisesId = 0;
      this.selectedGenHeroId = 0;
      this.selectedGenSidekickId = 0;
      this.selectedGenSpecialPowersId = 0;
      this.selectedGenAntagonistId = 0;
      this.selectedGenGoalId = 0;
      this.optionCount = 15;
      this.genCharacterFlaws = new Array();
      this.genCharacterStrengths = new Array();
      this.genCrises = new Array();
      this.genHero = new Array();
      this.genSidekick = new Array();
      this.genSpecialPowers = new Array();
      this.genAntagonist = new Array();
      this.genGoal = new Array();
      var _loc25_ = MovieClip(this.mcScope.machine_character_flaw);
      var _loc24_ = _loc25_.wheel;
      var _loc8_ = 0;
      while(_loc8_ < this.optionCount)
      {
         var _loc16_ = _loc24_["gen_flaw_" + _loc8_].text;
         this.genCharacterFlaws.push(_loc16_);
         _loc8_ = _loc8_ + 1;
      }
      var _loc23_ = MovieClip(this.mcScope.machine_character_strength);
      var _loc7_ = 0;
      while(_loc7_ < this.optionCount)
      {
         var _loc12_ = _loc23_["gen_strength_" + _loc7_].text;
         this.genCharacterStrengths.push(_loc12_);
         _loc7_ = _loc7_ + 1;
      }
      var _loc27_ = MovieClip(this.mcScope.machine_crisis);
      var _loc18_ = _loc27_.text_crisis;
      var _loc5_ = 0;
      while(_loc5_ < this.optionCount)
      {
         var _loc13_ = _loc18_["gen_crisis_" + _loc5_].text;
         this.genCrises.push(_loc13_);
         _loc18_["gen_crisis_" + _loc5_]._visible = false;
         _loc5_ = _loc5_ + 1;
      }
      _loc18_.gen_crisis_0._visible = true;
      var _loc26_ = MovieClip(this.mcScope.machine_hero);
      var _loc21_ = _loc26_.hero_list;
      _loc8_ = 0;
      while(_loc8_ < this.optionCount)
      {
         var _loc10_ = _loc21_["gen_hero_" + _loc8_].text;
         this.genHero.push(_loc10_);
         _loc8_ = _loc8_ + 1;
      }
      var _loc29_ = MovieClip(this.mcScope.machine_sidekick);
      var _loc22_ = _loc29_.text_sidekick;
      var _loc6_ = 0;
      while(_loc6_ < this.optionCount)
      {
         var _loc14_ = _loc22_["gen_sidekick_" + _loc6_].text;
         this.genSidekick.push(_loc14_);
         _loc6_ = _loc6_ + 1;
      }
      var _loc19_ = MovieClip(this.mcScope.machine_special_power);
      var _loc4_ = 0;
      while(_loc4_ < this.optionCount)
      {
         var _loc9_ = _loc19_["gen_special_" + _loc4_].text;
         this.genSpecialPowers.push(_loc9_);
         MovieClip(_loc19_["gen_special_hex_" + _loc4_]).gotoAndStop(2);
         _loc4_ = _loc4_ + 1;
      }
      MovieClip(_loc19_.gen_special_hex_0).gotoAndStop(1);
      var _loc28_ = MovieClip(this.mcScope.machine_antagonist);
      var _loc20_ = _loc28_.text_antagonist;
      var _loc3_ = 0;
      while(_loc3_ < this.optionCount)
      {
         var _loc11_ = _loc20_["gen_antagonist_" + _loc3_].text;
         this.genAntagonist.push(_loc11_);
         _loc20_["gen_antagonist_" + _loc3_]._visible = false;
         _loc3_ = _loc3_ + 1;
      }
      _loc20_.gen_antagonist_0._visible = true;
      _loc28_ = MovieClip(this.mcScope.machine_goal);
      var _loc17_ = _loc28_.text_goal;
      var _loc2_ = 0;
      while(_loc2_ < this.optionCount)
      {
         var _loc15_ = _loc17_["gen_goal_" + _loc2_].text;
         this.genGoal.push(_loc15_);
         _loc17_["gen_goal_" + _loc2_]._visible = false;
         _loc2_ = _loc2_ + 1;
      }
      _loc17_.gen_goal_0._visible = true;
   }
   function setNextSelectedGenCharacterFlawsId(direction)
   {
      if(direction == "clockwise")
      {
         if(this.selectedGenCharacterFlawsId >= this.genCharacterFlaws.length - 1)
         {
            this.selectedGenCharacterFlawsId = 0;
         }
         else
         {
            this.selectedGenCharacterFlawsId = this.selectedGenCharacterFlawsId + 1;
         }
      }
      else if(this.selectedGenCharacterFlawsId < 1)
      {
         this.selectedGenCharacterFlawsId = this.genCharacterFlaws.length - 1;
      }
      else
      {
         this.selectedGenCharacterFlawsId = this.selectedGenCharacterFlawsId - 1;
      }
   }
   function generatorFlawSelect(direction)
   {
      this.setNextSelectedGenCharacterFlawsId(direction);
      MovieClip(this.mcScope.machine_character_flaw).gotoAndPlay("flaw_" + this.selectedGenCharacterFlawsId + "_" + direction);
   }
   function generatorStrengthSelect(id)
   {
      this.selectedGenCharacterStrengthsId = id;
      var _loc2_ = this.mcScope.machine_character_strength;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_.pointer,0.5,{_y:102 + 20 * id,ease:3});
   }
   function generatorCrisisSelect(id)
   {
      this.selectedGenCrisesId = id;
      var _loc4_ = this.mcScope.machine_crisis;
      var _loc3_ = _loc4_.text_crisis;
      var _loc2_ = 0;
      while(_loc2_ < this.optionCount)
      {
         _loc3_["gen_crisis_" + _loc2_]._visible = false;
         _loc2_ = _loc2_ + 1;
      }
      _loc3_["gen_crisis_" + id]._visible = true;
   }
   function generatorHeroSelect(direction)
   {
      var _loc2_ = MovieClip(this.mcScope.machine_hero);
      if(direction == "up")
      {
         if(this.selectedGenHeroId > 0)
         {
            this.selectedGenHeroId = this.selectedGenHeroId - 1;
         }
      }
      else if(this.selectedGenHeroId < this.optionCount - 1)
      {
         this.selectedGenHeroId = this.selectedGenHeroId + 1;
      }
      var _loc3_ = -1 * (31 * this.selectedGenHeroId) + 169;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_.hero_list,0.5,{_y:_loc3_,ease:3});
   }
   function generatorSidekickSelect()
   {
      if(this.selectedGenSidekickId >= this.genSidekick.length - 1)
      {
         this.selectedGenSidekickId = 0;
      }
      else
      {
         this.selectedGenSidekickId = this.selectedGenSidekickId + 1;
      }
      var _loc3_ = MovieClip(this.mcScope.machine_sidekick);
      var _loc2_ = -1 * (301 * this.selectedGenSidekickId) + 200;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3_.text_sidekick,0.5,{_x:_loc2_,ease:3});
   }
   function generatorSpecialSelect(id)
   {
      this.selectedGenSpecialPowersId = id;
      var _loc3_ = MovieClip(this.mcScope.machine_special_power);
      var _loc2_ = 0;
      while(_loc2_ < this.optionCount)
      {
         MovieClip(_loc3_["gen_special_hex_" + _loc2_]).gotoAndStop(2);
         _loc2_ = _loc2_ + 1;
      }
      MovieClip(_loc3_["gen_special_hex_" + id]).gotoAndStop(1);
   }
   function generatorAntagonistSelect(id)
   {
      this.selectedGenAntagonistId = id;
      var _loc4_ = MovieClip(this.mcScope.machine_antagonist);
      var _loc3_ = _loc4_.text_antagonist;
      var _loc2_ = 0;
      while(_loc2_ < this.optionCount)
      {
         _loc3_["gen_antagonist_" + _loc2_]._visible = false;
         _loc2_ = _loc2_ + 1;
      }
      _loc3_["gen_antagonist_" + id]._visible = true;
   }
   function generatorGoalSelect(id)
   {
      this.selectedGenGoalId = id;
      var _loc4_ = MovieClip(this.mcScope.machine_goal);
      var _loc3_ = _loc4_.text_goal;
      var _loc2_ = 0;
      while(_loc2_ < this.optionCount)
      {
         _loc3_["gen_goal_" + _loc2_]._visible = false;
         _loc2_ = _loc2_ + 1;
      }
      _loc3_["gen_goal_" + id]._visible = true;
   }
   function generateLogline()
   {
      var _loc2_ = "";
      _loc2_ += "When a ";
      _loc2_ += this.genCharacterFlaws[this.selectedGenCharacterFlawsId];
      _loc2_ += " ";
      _loc2_ += this.genHero[this.selectedGenHeroId];
      _loc2_ += " ";
      _loc2_ += this.genCrises[this.selectedGenCrisesId];
      _loc2_ += ", he must team up with a ";
      _loc2_ += this.genCharacterStrengths[this.selectedGenCharacterStrengthsId];
      _loc2_ += " ";
      _loc2_ += this.genSidekick[this.selectedGenSidekickId];
      _loc2_ += " and take on a ";
      _loc2_ += this.genSpecialPowers[this.selectedGenSpecialPowersId];
      _loc2_ += " ";
      _loc2_ += this.genAntagonist[this.selectedGenAntagonistId];
      _loc2_ += " ";
      _loc2_ += this.genGoal[this.selectedGenGoalId];
      _loc2_ = _loc2_.split("\n").join("");
      _loc2_ = _loc2_.split("\r").join("");
      return _loc2_;
   }
   function populateLogline()
   {
      var _loc2_ = MovieClip(this.mcScope.ticket);
      _loc2_.genLogline.text = this.generateLogline();
   }
   function goToAnchor(AnchorLink)
   {
      var _loc2_ = new Array();
      _loc2_ = AnchorLink.split("_");
      switch(_loc2_[1])
      {
         case "flaw":
            this.generatorFlawSelect(_loc2_[2]);
            break;
         case "strength":
            this.generatorStrengthSelect(_loc2_[2]);
            break;
         case "crisis":
            this.generatorCrisisSelect(_loc2_[2]);
            break;
         case "hero":
            this.generatorHeroSelect(_loc2_[2]);
            break;
         case "sidekick":
            this.generatorSidekickSelect();
            break;
         case "special":
            this.generatorSpecialSelect(_loc2_[2]);
            break;
         case "antagonist":
            this.generatorAntagonistSelect(_loc2_[2]);
            break;
         case "goal":
            this.generatorGoalSelect(_loc2_[2]);
      }
   }
   function POPULATE_TEXT(pageName)
   {
      switch(pageName)
      {
         case "PAGE1":
            this.mcScope = this.CONTENT.PAGE1;
            this.CONTENT.BOUNDING_BOX._height = 1046;
            break;
         case "PAGE2":
            this.mcScope = this.CONTENT.PAGE2;
            this.CONTENT.BOUNDING_BOX._height = 2070;
            this.initGenerator();
            break;
         case "PAGE3":
            this.mcScope = this.CONTENT.PAGE3;
            this.CONTENT.BOUNDING_BOX._height = 806;
            this.populateLogline();
      }
      this.dataTextScope = new Array();
      var _loc3_ = 0;
      for(var _loc4_ in this.mcScope)
      {
         if(typeof this.mcScope[_loc4_] == "movieclip")
         {
            if(this.mcScope[_loc4_].btnTxt != undefined)
            {
               this.mcScope[_loc4_].offColour = this.mcScope[_loc4_].btnTxt.textColor;
               var _loc2_ = this.mcScope[_loc4_].btnTxt;
               this.dataTextScope[_loc3_] = _loc2_;
               _loc3_ = _loc3_ + 1;
            }
         }
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
}
