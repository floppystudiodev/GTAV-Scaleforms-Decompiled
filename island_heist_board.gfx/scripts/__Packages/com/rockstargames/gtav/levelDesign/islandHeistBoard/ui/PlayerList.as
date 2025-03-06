class com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.PlayerList
{
   var view;
   function PlayerList(view, heistData, colourScheme)
   {
      this.view = view;
      var _loc3_ = 0;
      while(_loc3_ < 4)
      {
         var _loc2_ = view["player" + _loc3_];
         _loc2_.swatch.gotoAndStop(_loc3_ + 1);
         _loc2_.swatch.transform.colorTransform = colourScheme.mid;
         _loc2_.gamertag.transform.colorTransform = colourScheme.light;
         _loc2_.gamertag.tf.verticalAlign = "center";
         _loc2_.percentage.transform.colorTransform = colourScheme.light;
         _loc2_.percentage.tf.verticalAlign = "center";
         _loc2_.headset.transform.colorTransform = colourScheme.light;
         _loc2_.ready.label.transform.colorTransform = colourScheme.dark;
         _loc2_.ready.label.tf.verticalAlign = "center";
         _loc2_.ready.label.tf.autoSize = "left";
         _loc2_.ready.label.tf.text = com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.setLocalisedText(_loc2_.ready.label.tf,"IHB_READY").toUpperCase();
         _loc2_.ready.background.transform.colorTransform = colourScheme.mid;
         _loc2_.ready.background.scale9Grid = new flash.geom.Rectangle(4,4,54,20);
         _loc2_.ready.background._width = _loc2_.ready.label._width + 4;
         this.clear(_loc3_);
         _loc3_ = _loc3_ + 1;
      }
      var _loc6_ = _loc2_._width + 12;
      view.background._width = _loc6_;
      view.background.transform.colorTransform = colourScheme.dark;
      view.reveal._width = _loc6_ + 4;
      view.reveal.transform.colorTransform = colourScheme.dark;
      view.bezel.scale9Grid = new flash.geom.Rectangle(50,4,50,20);
      view.bezel._width = _loc6_;
      view.bezel.transform.colorTransform = colourScheme.mid;
      if(!heistData.crewCutsVisible)
      {
         view._alpha = 0;
      }
      this.update(heistData.crew);
   }
   function update(crewList)
   {
      var _loc3_ = 0;
      while(_loc3_ < 4)
      {
         var _loc2_ = crewList[_loc3_];
         if(_loc2_.id == -1)
         {
            this.clear(_loc3_);
         }
         else
         {
            this.setPlayer(_loc3_,_loc2_.gamertag,_loc2_.percentage,_loc2_.headsetState,_loc2_.isReady);
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function setPlayer(index, gamertag, percentage, headsetState, isReady)
   {
      var _loc2_ = this.view["player" + index];
      _loc2_.gamertag.tf.textAutoSize = "none";
      _loc2_.gamertag.tf.text = gamertag;
      if(_loc2_.gamertag.tf.textWidth > _loc2_.gamertag.tf._width)
      {
         if(gamertag.length > 16)
         {
            gamertag = gamertag.substr(0,16) + "...";
         }
         _loc2_.gamertag.tf.textAutoSize = "shrink";
         _loc2_.gamertag.tf.text = gamertag;
      }
      _loc2_.percentage.tf.text = percentage < 0 ? "" : int(percentage) + "%";
      _loc2_.headset.gotoAndStop(headsetState + 1);
      _loc2_.ready.background.gotoAndStop(!isReady ? "off" : "on");
      _loc2_.ready._visible = true;
   }
   function clear(index)
   {
      var _loc2_ = this.view["player" + index];
      _loc2_.gamertag.tf.text = "";
      _loc2_.percentage.tf.text = "";
      _loc2_.headset.gotoAndStop("hidden");
      _loc2_.ready._visible = false;
   }
   function setVisible(isVisible)
   {
      if(isVisible)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
         this.view._alpha = 100;
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.ELEMENT_FADE_OUT_DURATION,{_alpha:0,ease:com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.ELEMENT_FADE_OUT_CURVE});
      }
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
   }
}
