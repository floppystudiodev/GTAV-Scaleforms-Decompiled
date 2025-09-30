class com.rockstargames.gtav.levelDesign.SLOT_MACHINE extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var displayConfig;
   function SLOT_MACHINE()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "SLOT_MACHINE";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.initText();
   }
   function initText()
   {
      this.CONTENT.messageText.verticalAlign = "center";
      this.CONTENT.messageTextStroke.verticalAlign = "center";
      this.CONTENT.labelBet.textAutoSize = "shrink";
      this.CONTENT.labelBetStroke.textAutoSize = "shrink";
      this.CONTENT.labelLastWin.textAutoSize = "shrink";
      this.CONTENT.labelLastWinStroke.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.SLOT_MACHINE.setLocalisedText(this.CONTENT.labelBet,"SLOTS_RT_BET");
      com.rockstargames.gtav.levelDesign.SLOT_MACHINE.setLocalisedText(this.CONTENT.labelBetStroke,"SLOTS_RT_BET");
      com.rockstargames.gtav.levelDesign.SLOT_MACHINE.setLocalisedText(this.CONTENT.labelLastWin,"SLOTS_RT_LSTWIN");
      com.rockstargames.gtav.levelDesign.SLOT_MACHINE.setLocalisedText(this.CONTENT.labelLastWinStroke,"SLOTS_RT_LSTWIN");
      var _loc2_ = 15;
      this.CONTENT.labelBetStroke.outline = _loc2_;
      this.CONTENT.labelLastWinStroke.outline = _loc2_;
      this.CONTENT.messageTextStroke.outline = _loc2_;
      this.CONTENT.numberBetAmountStroke.outline = _loc2_;
      this.CONTENT.numberLastWinStroke.outline = _loc2_;
      if(this.displayConfig.isAsian)
      {
         this.resizeAsianText(this.CONTENT.labelBet);
         this.resizeAsianText(this.CONTENT.labelLastWin);
         this.resizeAsianText(this.CONTENT.labelBetStroke);
         this.resizeAsianText(this.CONTENT.labelLastWinStroke);
      }
   }
   function SET_MESSAGE(Message)
   {
      this.CONTENT.messageText.text = Message;
      this.CONTENT.messageTextStroke.text = Message;
      if(this.displayConfig.isAsian)
      {
         this.resizeAsianText(this.CONTENT.messageText);
         this.resizeAsianText(this.CONTENT.messageTextStroke);
      }
   }
   function SET_BET(Bet)
   {
      this.CONTENT.numberBetAmount.text = com.rockstargames.gtav.levelDesign.SLOT_MACHINE.formatNumber(Bet);
      this.CONTENT.numberBetAmountStroke.text = com.rockstargames.gtav.levelDesign.SLOT_MACHINE.formatNumber(Bet);
   }
   function SET_LAST_WIN(LastWin)
   {
      this.CONTENT.numberLastWin.text = com.rockstargames.gtav.levelDesign.SLOT_MACHINE.formatNumber(LastWin);
      this.CONTENT.numberLastWinStroke.text = com.rockstargames.gtav.levelDesign.SLOT_MACHINE.formatNumber(LastWin);
   }
   function SET_THEME(Theme)
   {
      switch(Theme)
      {
         case 2:
            this.colorSlotText(16635454);
            this.colorSlotNumbers(14630274);
            return;
         case 5:
            this.colorSlotText(14487821);
            this.colorSlotNumbers(16777215);
            return;
         case 6:
            this.colorSlotText(16280554);
            this.colorSlotNumbers(16777215);
            return;
         case 7:
            this.colorSlotText(16635454);
            this.colorSlotNumbers(16777215);
            return;
         case 8:
            this.colorSlotText(16777215);
            this.colorSlotNumbers(16674560);
            return;
         default:
            this.colorSlotText(16765200);
            this.colorSlotNumbers(16777215);
            return;
      }
   }
   function colorSlotText(colorValue)
   {
      this.CONTENT.messageText.textColor = colorValue;
      this.CONTENT.labelBet.textColor = colorValue;
      this.CONTENT.labelLastWin.textColor = colorValue;
   }
   function colorSlotNumbers(colorValue)
   {
      this.CONTENT.numberBetAmount.textColor = colorValue;
      this.CONTENT.numberLastWin.textColor = colorValue;
   }
   function resizeAsianText(tf)
   {
      var _loc1_ = tf.getTextFormat();
      _loc1_.size *= 0.8;
      _loc1_.leading = 8;
      tf.setTextFormat(_loc1_);
   }
   static function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
   static function formatPercentage(value)
   {
      return int(value * 100) / 100 + "%";
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
   static function formatTime(seconds)
   {
      var _loc1_ = seconds % 60;
      var _loc3_ = Math.floor((seconds - _loc1_) / 60) % 60;
      var _loc5_ = Math.floor((seconds - _loc1_ - _loc3_ * 60) / 3600);
      var _loc2_ = ("0" + _loc3_).substr(-2);
      var _loc4_ = ("0" + _loc1_).substr(-2);
      return _loc5_ != 0 ? _loc5_ + ":" + _loc2_ + ":" + _loc4_ : _loc2_ + ":" + _loc4_;
   }
   static function truncate(tf, txt, autoSize, letterSpacing)
   {
      tf.text = txt;
      var _loc3_;
      if(!isNaN(letterSpacing))
      {
         _loc3_ = tf.getTextFormat();
         _loc3_.letterSpacing = letterSpacing;
         tf.setTextFormat(_loc3_);
      }
      var _loc6_;
      var _loc2_;
      if(tf.textWidth > tf._width)
      {
         _loc6_ = tf._width;
         tf.autoSize = autoSize;
         _loc2_ = txt.length;
         while(_loc2_ > 0)
         {
            tf.text = txt.substring(0,_loc2_) + "...";
            if(!isNaN(letterSpacing))
            {
               _loc3_ = tf.getTextFormat();
               _loc3_.letterSpacing = letterSpacing;
               tf.setTextFormat(_loc3_);
            }
            if(tf._width <= _loc6_)
            {
               break;
            }
            _loc2_ = _loc2_ - 1;
         }
         tf.autoSize = "none";
         tf._width = _loc6_;
      }
   }
   static function playSound(soundName, soundSet)
   {
      if(soundSet == undefined)
      {
      }
      com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,soundName,soundSet);
   }
}
