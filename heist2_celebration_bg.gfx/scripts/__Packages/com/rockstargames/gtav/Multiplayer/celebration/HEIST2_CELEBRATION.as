class com.rockstargames.gtav.Multiplayer.celebration.HEIST2_CELEBRATION extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var dispConf;
   var localisationTF;
   var sequences;
   var type;
   function HEIST2_CELEBRATION()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc, type)
   {
      super.INITIALISE(mc);
      this.dispConf = new com.rockstargames.ui.utils.DisplayConfig();
      this.dispConf = this.getDisplayConfig(true);
      if(!this.dispConf.isWideScreen)
      {
         Stage.scaleMode = "noBorder";
         this.dispConf.screenWidth = 960;
      }
      this.type = type;
      this.sequences = [];
      var _loc3_ = this.CONTENT.attachMovie("LocalisationText","localisationText",this.CONTENT.getNextHighestDepth());
      this.localisationTF = _loc3_.label;
      _loc3_._visible = false;
   }
   function registerSyncedMovie(id, sequenceTypeBit)
   {
      this.sequences[id].registerSyncedMovie(sequenceTypeBit);
   }
   function syncPointClear(id)
   {
      this.sequences[id].syncPointClear();
   }
   function PAUSE()
   {
   }
   function SET_PAUSE_DURATION()
   {
   }
   function CREATE_STAT_WALL(id, bgColourId, sfxId)
   {
      var _loc3_ = this.getColourFromId(bgColourId);
      if(isNaN(sfxId))
      {
         sfxId = 1;
      }
      this.sequences[id] = this.createSequence(_loc3_,sfxId,id);
   }
   function ADD_BACKGROUND_TO_WALL(id, alpha, sideTextureId)
   {
      this.sequences[id].addBackground(alpha,sideTextureId);
   }
   function ADD_MISSION_RESULT_TO_WALL(id, missionTextLabel, passFailTextLabel, messageLabel, isMessageRawText, isPassFailRawText, isMissionTextRawText)
   {
      var _loc4_ = !isMissionTextRawText ? this.getLocalisedText(missionTextLabel) : missionTextLabel;
      var _loc5_ = !isPassFailRawText ? this.getLocalisedText(passFailTextLabel) : passFailTextLabel;
      var _loc3_ = messageLabel != undefined ? (!isMessageRawText ? this.getLocalisedText(messageLabel) : messageLabel) : "";
      var _loc6_ = new com.rockstargames.gtav.Multiplayer.celebration.steps.MissionResultStep(this.sequences[id],_loc4_,_loc5_,_loc3_);
      this.sequences[id].addStep(_loc6_);
   }
   function ADD_COMPLETE_MESSAGE_TO_WALL(id, missionTextLabel, completeTextLabel, messageLabel, isMessageRawText, isCompleteRawText, isMissionTextRawText)
   {
      var _loc3_ = !isMissionTextRawText ? this.getLocalisedText(missionTextLabel) : missionTextLabel;
      var _loc2_ = !isCompleteRawText ? this.getLocalisedText(completeTextLabel) : completeTextLabel;
      var _loc4_ = new com.rockstargames.gtav.Multiplayer.celebration.steps.CompleteStep(this.sequences[id],_loc3_,_loc2_);
      this.sequences[id].addStep(_loc4_);
   }
   function CREATE_STAT_TABLE(id, stepId)
   {
      var _loc2_ = new com.rockstargames.gtav.Multiplayer.celebration.steps.StatTableStep(this.sequences[id],stepId);
      this.sequences[id].addStep(_loc2_);
   }
   function ADD_STAT_TO_TABLE(id, stepId, name, value, isNameRawText, isValueRawText, isTotalRow, isStatValueTime, colourId)
   {
      if(!isNameRawText)
      {
         name = this.getLocalisedText(name);
      }
      if(!isValueRawText)
      {
         value = this.getLocalisedText(value);
      }
      var _loc5_ = com.rockstargames.gtav.Multiplayer.celebration.steps.StatTableStep(this.sequences[id].getStepById(stepId));
      var _loc4_ = this.getColourFromId(colourId);
      _loc5_.addStat(name,value,_loc4_);
   }
   function ADD_STAT_TABLE_TO_WALL(id, stepId)
   {
      var _loc2_ = com.rockstargames.gtav.Multiplayer.celebration.steps.StatTableStep(this.sequences[id].getStepById(stepId));
      if(_loc2_.numStats == 0)
      {
         this.sequences[id].removeStep(_loc2_);
      }
   }
   function SHOW_STAT_WALL(id)
   {
      this.sequences[id].start();
   }
   function CREATE_INCREMENTAL_CASH_ANIMATION(id, stepId)
   {
      var _loc2_ = new com.rockstargames.gtav.Multiplayer.celebration.steps.BigDollarsStep(this.sequences[id],stepId);
      this.sequences[id].addStep(_loc2_);
   }
   function ADD_INCREMENTAL_CASH_WON_STEP(id, stepId, startDollars, finishDollars, topText, bottomText, rightHandStat, rightHandIcon, soundType)
   {
      var _loc8_ = com.rockstargames.gtav.Multiplayer.celebration.steps.BigDollarsStep(this.sequences[id].getStepById(stepId));
      if(topText == undefined)
      {
         topText = "";
      }
      if(bottomText == undefined)
      {
         bottomText = "";
      }
      if(rightHandStat == undefined)
      {
         rightHandStat = "";
      }
      if(rightHandIcon == undefined)
      {
         rightHandIcon = 3;
      }
      var _loc2_ = finishDollars - startDollars;
      if(isNaN(_loc2_))
      {
         _loc2_ = 0;
      }
      if(isNaN(soundType))
      {
         soundType = 0;
      }
      _loc8_.addStat(startDollars,_loc2_,topText,bottomText,rightHandStat,rightHandIcon,soundType);
   }
   function ADD_INCREMENTAL_CASH_ANIMATION_TO_WALL(id, stepId)
   {
   }
   function ADD_JOB_POINTS_TO_WALL(id, points, xAlign)
   {
      var _loc2_ = xAlign == "left";
      var _loc3_ = new com.rockstargames.gtav.Multiplayer.celebration.steps.JPStep(this.sequences[id],points,_loc2_);
      this.sequences[id].addStep(_loc3_);
   }
   function ADD_REP_POINTS_AND_RANK_BAR_TO_WALL(id, repPointsGained, startRepPoints, minRepPointsForRank, maxRepPointsForRank, currentRank, nextRank, rank1Txt, rank2Txt)
   {
      var _loc2_ = new com.rockstargames.gtav.Multiplayer.celebration.steps.RPAndRankBarStep(this.sequences[id],repPointsGained,startRepPoints,minRepPointsForRank,maxRepPointsForRank,currentRank,nextRank,rank1Txt,rank2Txt);
      this.sequences[id].addStep(_loc2_);
   }
   function PAUSE_BEFORE_PREVIOUS_LAYOUT()
   {
   }
   function ADD_CASH_DEDUCTION(id, title, description, value)
   {
      var _loc2_ = new com.rockstargames.gtav.Multiplayer.celebration.steps.SmallDollarsStep(this.sequences[id],title,description,value);
      this.sequences[id].addStep(_loc2_);
   }
   function ADD_CASH_WON_TO_WALL(id, statLabel, finalValue, startValue, xAlign, isRawText)
   {
      if(isNaN(startValue))
      {
         startValue = 0;
      }
      if(isNaN(finalValue))
      {
         finalValue = 0;
      }
      var _loc3_ = xAlign == "left";
      var _loc4_ = new com.rockstargames.gtav.Multiplayer.celebration.steps.CashStep(this.sequences[id],startValue,finalValue,_loc3_);
      this.sequences[id].addStep(_loc4_);
   }
   function ADD_CASH_TO_WALL(id, value, xAlign)
   {
      if(isNaN(value))
      {
         value = 0;
      }
      var _loc3_ = xAlign == "left";
      var _loc4_ = new com.rockstargames.gtav.Multiplayer.celebration.steps.CashStep(this.sequences[id],value,value,_loc3_);
      this.sequences[id].addStep(_loc4_);
   }
   function CLEANUP(id)
   {
      this.sequences[id].dispose();
   }
   function createSequence(bgColour, sfxId, id)
   {
      var _loc2_;
      switch(this.type)
      {
         case "BG":
            _loc2_ = new com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequenceBG(this.CONTENT,bgColour,this.dispConf,sfxId,id,4);
            break;
         case "FG":
            _loc2_ = new com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequenceFG(this.CONTENT,bgColour,this.dispConf,sfxId,id,2);
            break;
         case "CUTOUT":
            _loc2_ = new com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequenceCutout(this.CONTENT,bgColour,this.dispConf,sfxId,id,1);
            break;
         default:
            _loc2_ = new com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence(this.CONTENT,bgColour,this.dispConf,sfxId,id,0);
      }
      return _loc2_;
   }
   function getLocalisedText(label)
   {
      this.localisationTF.text = "";
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.localisationTF,label);
      return this.localisationTF.text;
   }
   function getColourFromId(id)
   {
      var _loc1_ = new com.rockstargames.ui.utils.HudColour();
      var _loc2_ = com.rockstargames.ui.utils.HudColour[id];
      if(isNaN(_loc2_))
      {
         return 0;
      }
      com.rockstargames.ui.utils.Colour.setHudColour(_loc2_,_loc1_);
      return _loc1_.r << 16 | _loc1_.g << 8 | _loc1_.b;
   }
}
