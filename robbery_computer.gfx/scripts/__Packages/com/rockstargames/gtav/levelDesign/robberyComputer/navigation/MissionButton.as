class com.rockstargames.gtav.levelDesign.robberyComputer.navigation.MissionButton extends com.rockstargames.gtav.levelDesign.robberyComputer.navigation.Target
{
   var _enabled;
   var available;
   var init;
   var view;
   function MissionButton(id, view)
   {
      super();
      var _loc4_ = view.hitArea.getBounds(_root);
      this.init(id,_loc4_.xMin,_loc4_.xMax,_loc4_.yMin,_loc4_.yMax);
      this.view = view;
      com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.setLocalisedText(view.info.heading,"ROBBERY_CMP_DET");
   }
   function setState(isOn)
   {
      this.view.focus._visible = isOn;
   }
   function set enabled(_enabled)
   {
      if(this.available)
      {
         super.enabled = _enabled;
      }
   }
   function populateView(name, info, txd, txn, completionState, available, imageManager)
   {
      this.view.name.text = name.toUpperCase();
      this.view.complete._visible = completionState == 1;
      this.view.locked._visible = completionState == 2;
      this.view.image._alpha = completionState != 2 ? 100 : 0;
      this.available = available;
      this._enabled = available;
      this.view.info.body.html = true;
      this.view.info.body.htmlText = info;
      this.view.info._visible = false;
      if(completionState == 1)
      {
         this.view.topNode.gotoAndStop("on");
         this.view.leftNode.gotoAndStop("on");
         this.view.rightNode.gotoAndStop("on");
         this.view.bottomNode.gotoAndStop("on");
      }
      this.view.gotoAndStop(completionState);
      imageManager.addImage(txd,txn,this.view.image);
      this.enabled = completionState != 2;
   }
   function set infoVisible(isVisible)
   {
      this.view.info._visible = isVisible;
   }
   function get isAvailable()
   {
      return this.available;
   }
   function dispose()
   {
      this.view = null;
   }
}
