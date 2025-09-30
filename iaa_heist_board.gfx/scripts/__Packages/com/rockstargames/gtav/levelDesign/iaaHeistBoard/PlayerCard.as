class com.rockstargames.gtav.levelDesign.iaaHeistBoard.PlayerCard
{
   var cashHighlight;
   var currentHeadshotTexture;
   var index;
   var roleHighlight;
   var view;
   static var FADE_IN_SPEED = 0.3;
   static var FADE_IN_OFFSET = 0.1;
   static var POSITIONS = [];
   function PlayerCard(index, view, isLeader)
   {
      this.index = index;
      this.view = view;
      this.init(isLeader);
   }
   function init(isLeader)
   {
      com.rockstargames.gtav.levelDesign.iaaHeistBoard.PlayerCard.POSITIONS[this.index] = this.view._x;
      this.view.titleWrapper.title.text = this.setLocalisedText(this.view.titleWrapper.title,"IAA_PLAYER") + "_0" + (this.index + 1);
      this.currentHeadshotTexture = "";
      this.roleHighlight = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationElement(this.view.roleHighlight,com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationIDs["FINALE_PLAYER_" + this.index + "_ROLE"]);
      this.cashHighlight = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationElement(this.view.cashHighlight,com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationIDs["FINALE_PLAYER_" + this.index + "_CASH"]);
      this.view.roleHighlight.selectHighlight._visible = false;
      this.view.cashHighlight.selectHighlight._visible = false;
      if(!isLeader)
      {
         this.view.roleArrows._visible = false;
         this.view.cashArrows._visible = false;
      }
      this.view._visible = false;
      this.view._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,com.rockstargames.gtav.levelDesign.iaaHeistBoard.PlayerCard.FADE_IN_SPEED,{delay:this.index * com.rockstargames.gtav.levelDesign.iaaHeistBoard.PlayerCard.FADE_IN_OFFSET,_alpha:100});
   }
   function update(player, positionIndex)
   {
      if(this.view._x != com.rockstargames.gtav.levelDesign.iaaHeistBoard.PlayerCard.POSITIONS[positionIndex])
      {
         this.view._x = com.rockstargames.gtav.levelDesign.iaaHeistBoard.PlayerCard.POSITIONS[positionIndex];
         this.roleHighlight.updateBounds();
         this.cashHighlight.updateBounds();
      }
      this.view.gotoAndStop(!player.isActive ? "inactive" : "active");
      this.view.role.textAutoSize = "shrink";
      if(com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.displayConfig.isAsian)
      {
         this.view.role._y = 16;
      }
      this.view.role.text = player.role.toUpperCase();
      this.setEllipsis(player.gamertag,this.view.gamertag);
      this.view.percentage.text = player.percentage + "%";
      this.view.cashWrapper.cash.text = "$" + this.formatNumber(player.cash);
      this.view._visible = player.isEnabled;
      if(this.currentHeadshotTexture != player.texture)
      {
         this.currentHeadshotTexture = player.texture;
         this.loadTexture(this.view.headshot,this.currentHeadshotTexture);
      }
      this.roleHighlight.enabled = player.isEnabled;
      this.cashHighlight.enabled = player.isEnabled;
   }
   function setEllipsis(label, tf)
   {
      tf.text = label;
      var _loc1_;
      if(tf.textWidth > tf._width - 4)
      {
         _loc1_ = label.length;
         while(_loc1_ > 0)
         {
            tf.text = label.substring(0,_loc1_) + "...";
            if(tf.textWidth <= tf._width - 4)
            {
               break;
            }
            _loc1_ = _loc1_ - 1;
         }
      }
   }
   function updateActiveState(isActive)
   {
      this.view.gotoAndStop(!isActive ? "inactive" : "active");
   }
   function updateSelectHighlights(activeElementID)
   {
      if(this.roleHighlight.id != activeElementID)
      {
         this.roleHighlight.view.selectHighlight._visible = false;
      }
      if(this.cashHighlight.id != activeElementID)
      {
         this.cashHighlight.view.selectHighlight._visible = false;
      }
   }
   function updateRole(role)
   {
      this.view.role.text = role.toUpperCase();
   }
   function updateCashAndPercentage(cash, percentage)
   {
      this.view.cashWrapper.cash.text = "$" + this.formatNumber(cash);
      this.view.percentage.text = percentage + "%";
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
   }
   function loadTexture(mc, texture)
   {
      if(texture.length > 0)
      {
         com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.imageManager.addImage(texture,texture,mc);
      }
   }
   function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
   function formatNumber(value)
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
}
