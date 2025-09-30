class com.rockstargames.gtav.levelDesign.iaaHeistBoard.ReplayMission
{
   var cost;
   var description;
   var index;
   var isActive;
   var isUnavailable;
   var navigationElement;
   var texture;
   var title;
   var txd;
   var view;
   function ReplayMission()
   {
      this.isActive = false;
      this.init(-1,"","",-1,"",false,"");
   }
   function init(index, title, description, cost, texture, isUnavailable, txd)
   {
      var _loc2_ = this.texture != texture || this.txd != txd;
      this.index = index;
      this.title = title;
      this.description = description;
      this.cost = cost;
      this.texture = texture;
      this.isUnavailable = isUnavailable;
      this.txd = txd;
      if(this.view)
      {
         this.setText();
         if(_loc2_)
         {
            this.loadTexture(this.view.texture,texture);
         }
      }
   }
   function setView(view, textPrintManager)
   {
      if(view != this.view)
      {
         this.view = view;
         this.setText(textPrintManager);
         this.loadTexture(view.texture,this.texture);
         this.navigationElement = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationElement(view.highlight,com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationIDs["REPLAY_MISSION_" + this.index]);
         this.updateActiveView();
      }
   }
   function updateHighlight(activeElementID)
   {
      if(!this.view)
      {
         return undefined;
      }
      if(this.isActive != (activeElementID == this.navigationElement.id))
      {
         this.isActive = !this.isActive;
         this.updateActiveView();
      }
   }
   function updateActiveView()
   {
      this.view.inactive._visible = !this.isActive;
      this.view.highlight._visible = this.isActive;
      this.view.titleBlock.gotoAndStop(!this.isActive ? "inactive" : "active");
   }
   function clearView()
   {
      this.view = null;
   }
   function get isInUse()
   {
      return this.index != -1;
   }
   function setText(textPrintManager)
   {
      if(com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.displayConfig.isAsian)
      {
         this.view.titleBlock.title.label.textAutoSize = "shrink";
         this.view.titleBlock.title.label.text = this.title.toUpperCase();
      }
      else
      {
         this.setEllipsis(this.title.toUpperCase(),this.view.titleBlock.title.label);
         textPrintManager.printText(this.view.titleBlock.title.label.text,this.view.titleBlock.title.label,this.index * 5,2);
      }
      textPrintManager.printText(this.description,this.view.titleBlock.description.label,this.index * 5,1);
      this.view.titleBlock.digit.label.text = this.index != -1 ? ("0" + (this.index + 1)).substr(-2) : "";
      if(this.isUnavailable)
      {
         this.view.titleBlock.cost.text = "";
         this.view.titleBlock.costBG._visible = false;
         this.setLocalisedText(this.view.titleBlock.costTitle,"IAA_UNAVAIL");
      }
      else
      {
         this.view.titleBlock.cost.text = "$" + this.cost;
         this.view.titleBlock.costBG._visible = true;
         this.view.titleBlock.costBG._width = this.view.titleBlock.cost.textWidth + 5;
         this.setLocalisedText(this.view.titleBlock.costTitle,"IAA_S_COST");
      }
      var _loc2_;
      if(com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.displayConfig.isAsian)
      {
         _loc2_ = this.view.titleBlock.costTitle.getTextFormat();
         _loc2_.size = 20;
         this.view.titleBlock.costTitle.setTextFormat(_loc2_);
         _loc2_ = this.view.titleBlock.cost.getTextFormat();
         _loc2_.size = 20;
         this.view.titleBlock.cost.setTextFormat(_loc2_);
         this.view.titleBlock.cost.verticalAlign = "center";
      }
      this.view.titleBlock._visible = this.cost >= 0;
   }
   function loadTexture(mc, texture)
   {
      if(texture.length > 0 && this.txd.length > 0)
      {
         com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.imageManager.addImage(this.txd,texture,mc);
      }
   }
   function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
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
}
