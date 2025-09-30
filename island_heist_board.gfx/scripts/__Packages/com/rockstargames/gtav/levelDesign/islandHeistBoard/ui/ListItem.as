class com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.ListItem extends com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Button
{
   var checkBox1Selected;
   var checkBox2Selected;
   var colourScheme;
   var enabled;
   var isLocked;
   var isOn;
   var view;
   static var LABEL_X_POSITIONS = [22,44,66];
   static var LOCKED_ALPHA = 50;
   function ListItem(id, view, colourScheme)
   {
      super(id,view,colourScheme);
      this.isLocked = false;
      this.isOn = false;
      this.checkBox1Selected = false;
      this.checkBox2Selected = false;
   }
   function populate(label, labelIsStringLiteral, numerator, denominator, numCheckBoxesComplete, numTotalCheckBoxes, isLocked, isHidden, isMandatory, showDollar)
   {
      var _loc2_;
      if(isHidden)
      {
         this.view.checkBox1._visible = false;
         this.view.checkBox2._visible = false;
         this.view.locked._visible = false;
         this.view.hidden._visible = true;
         this.enabled = false;
         this.setState(false);
      }
      else
      {
         this.setLabel(label,labelIsStringLiteral);
         this.view.label._x = com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.ListItem.LABEL_X_POSITIONS[numTotalCheckBoxes];
         if(isLocked)
         {
            this.view.locked._visible = true;
            this.view.fraction.tf.text = "";
            this.setState(false);
         }
         else if(showDollar)
         {
            this.view.fraction.tf.verticalAlign = "center";
            this.view.fraction.tf.text = "$";
            com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(this.view.fraction.tf);
            this.view.locked._visible = false;
         }
         else
         {
            this.view.fraction.tf.verticalAlign = "center";
            _loc2_ = "";
            if(denominator > 0)
            {
               _loc2_ += numerator + " / " + denominator;
            }
            this.view.fraction.tf.text = _loc2_;
            com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(this.view.fraction.tf);
            this.view.locked._visible = false;
         }
         this.checkBox1Selected = numCheckBoxesComplete >= 1;
         this.view.checkBox1._visible = numTotalCheckBoxes >= 1;
         this.checkBox2Selected = numCheckBoxesComplete >= 2;
         this.view.checkBox2._visible = numTotalCheckBoxes >= 2;
         this.view.hidden._visible = false;
      }
      this.isLocked = isLocked;
      this.view.hidden.padlock.transform.colorTransform = this.colourScheme.light;
      this.view.hidden.background.transform.colorTransform = this.colourScheme.dark;
      this.view.locked.transform.colorTransform = this.colourScheme.light;
   }
   function updateCheckboxes(numComplete)
   {
      this.checkBox1Selected = numComplete >= 1;
      this.checkBox2Selected = numComplete >= 2;
      if(this.isOn)
      {
         this.view.checkBox1.outline.transform.colorTransform = !this.checkBox1Selected ? this.colourScheme.dark : this.colourScheme.mid;
         this.view.checkBox1.fill.transform.colorTransform = !this.checkBox1Selected ? this.colourScheme.light : this.colourScheme.mid;
         this.view.checkBox2.outline.transform.colorTransform = !this.checkBox2Selected ? this.colourScheme.dark : this.colourScheme.mid;
         this.view.checkBox2.fill.transform.colorTransform = !this.checkBox2Selected ? this.colourScheme.light : this.colourScheme.mid;
      }
      else
      {
         this.view.checkBox1.outline.transform.colorTransform = !this.checkBox1Selected ? this.colourScheme.light : this.colourScheme.mid;
         this.view.checkBox1.fill.transform.colorTransform = !this.checkBox1Selected ? this.colourScheme.dark : this.colourScheme.mid;
         this.view.checkBox2.outline.transform.colorTransform = !this.checkBox2Selected ? this.colourScheme.light : this.colourScheme.mid;
         this.view.checkBox2.fill.transform.colorTransform = !this.checkBox2Selected ? this.colourScheme.dark : this.colourScheme.mid;
      }
   }
   function setState(isOn)
   {
      super.setState(isOn);
      this.isOn = isOn;
      if(isOn)
      {
         this.view.fraction.transform.colorTransform = this.colourScheme.dark;
         this.view.locked.transform.colorTransform = this.colourScheme.dark;
         this.view.checkBox1.outline.transform.colorTransform = !this.checkBox1Selected ? this.colourScheme.dark : this.colourScheme.mid;
         this.view.checkBox1.fill.transform.colorTransform = !this.checkBox1Selected ? this.colourScheme.light : this.colourScheme.mid;
         this.view.checkBox2.outline.transform.colorTransform = !this.checkBox2Selected ? this.colourScheme.dark : this.colourScheme.mid;
         this.view.checkBox2.fill.transform.colorTransform = !this.checkBox2Selected ? this.colourScheme.light : this.colourScheme.mid;
      }
      else
      {
         this.view.fraction.transform.colorTransform = this.colourScheme.light;
         this.view.locked.transform.colorTransform = this.colourScheme.light;
         this.view.checkBox1.outline.transform.colorTransform = !this.checkBox1Selected ? this.colourScheme.light : this.colourScheme.mid;
         this.view.checkBox1.fill.transform.colorTransform = !this.checkBox1Selected ? this.colourScheme.dark : this.colourScheme.mid;
         this.view.checkBox2.outline.transform.colorTransform = !this.checkBox2Selected ? this.colourScheme.light : this.colourScheme.mid;
         this.view.checkBox2.fill.transform.colorTransform = !this.checkBox2Selected ? this.colourScheme.dark : this.colourScheme.mid;
      }
      if(this.isLocked)
      {
         this.view.background._alpha = com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.ListItem.LOCKED_ALPHA;
         this.view.label._alpha = com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.ListItem.LOCKED_ALPHA;
         this.view.checkBox1._alpha = com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.ListItem.LOCKED_ALPHA;
         this.view.checkBox2._alpha = com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.ListItem.LOCKED_ALPHA;
      }
   }
}
