class com.rockstargames.gtav.pc.applications.App_Sub extends com.rockstargames.gtav.pc.applications.App_Base
{
   var _subRef;
   var accessSwitchesMC;
   var onEnterFrame;
   var securityLayoutMC;
   var sluiceGateMC;
   var warningMC;
   var warningBlips = new Array();
   var buttonList = new Array();
   var textTimer = 30;
   var row1Ar = new Array();
   var row2Ar = new Array();
   function App_Sub()
   {
      super();
   }
   function ready()
   {
      var _loc4_ = new com.rockstargames.gtav.pc.PCButtonBase();
      _loc4_.init(this.accessSwitchesMC.openSluiceBtnMC,com.rockstargames.gtav.constants.PCAppLUT.PC_SUB_OPEN_SLUICE[0],{depth:50});
      var _loc3_ = new com.rockstargames.gtav.pc.PCButtonBase();
      _loc3_.init(this.accessSwitchesMC.releaseSubBtnMC,com.rockstargames.gtav.constants.PCAppLUT.PC_SUB_RELEASE_SUB[0],{depth:50});
      this.buttonList = [];
      this.buttonList[com.rockstargames.gtav.constants.PCAppLUT.PC_SUB_OPEN_SLUICE[0]] = _loc4_;
      this.buttonList[com.rockstargames.gtav.constants.PCAppLUT.PC_SUB_RELEASE_SUB[0]] = _loc3_;
      this._subRef.ADD_BUTTONS(_loc4_);
      this._subRef.ADD_BUTTONS(_loc3_);
      this.securityLayoutMC._x = this.safeRight - this.securityLayoutMC._width - 10;
      this.accessSwitchesMC._x = this.safeRight - this.accessSwitchesMC._width - 20;
      var _loc2_ = 0;
      while(_loc2_ < 10)
      {
         this.row1Ar.push(this.getRndNum());
         this.row2Ar.push(this.getRndNum());
         _loc2_ = _loc2_ + 1;
      }
      this.securityLayoutMC.row1TF.text = this.outputStr(this.row1Ar);
      this.warningBlips = [];
      this.onEnterFrame = function()
      {
         this.update();
      };
   }
   function getRndNum()
   {
      return Math.ceil(Math.random() * 99999999);
   }
   function outputStr(ar)
   {
      var _loc3_ = "";
      var _loc1_ = 0;
      while(_loc1_ < ar.length)
      {
         _loc3_ += ar[_loc1_] + "\n";
         _loc1_ = _loc1_ + 1;
      }
      return _loc3_;
   }
   function adjustAr(ar)
   {
      ar.shift();
      ar.push(this.getRndNum());
      return this.outputStr(ar);
   }
   function update()
   {
      this.textTimer = this.textTimer - 1;
      if(this.textTimer <= 0)
      {
         this.securityLayoutMC.row1TF.text = this.adjustAr(this.row1Ar);
         this.securityLayoutMC.row2TF.text = this.adjustAr(this.row2Ar);
         this.textTimer = 60 + Math.ceil(Math.random() * 30);
      }
   }
   function setButtonActive(buttonEnum, isActive)
   {
      var _loc2_ = this.buttonList[buttonEnum];
      this._subRef.ACTIVATE_BUTTONS(_loc2_,Boolean(isActive));
   }
   function setLabels(sluiceLbl, techLbl, securityLbl, accessLbl)
   {
      this.sluiceGateMC.labelTF.text = sluiceLbl;
      this.securityLayoutMC.labelTF.text = securityLbl;
      this.accessSwitchesMC.labelTF.text = accessLbl;
   }
   function setDate(days, months, years)
   {
      var _loc3_ = days <= 9 ? "0" + days : String(days);
      var _loc5_ = months <= 9 ? "0" + months : String(months);
      var _loc7_ = years <= 9 ? "0" + years : String(years);
      this.sluiceGateMC.dateMC.dayTF.text = _loc3_;
      this.sluiceGateMC.dateMC.monthTF.text = _loc5_;
      this.sluiceGateMC.dateMC.yearTF.text = _loc7_;
   }
   function setTime(hours, mins)
   {
      var _loc4_ = hours <= 9 ? "0" + hours : String(hours);
      var _loc2_ = mins <= 9 ? "0" + mins : String(mins);
      this.sluiceGateMC.timeMC.hoursTF.text = _loc4_;
      this.sluiceGateMC.timeMC.minsTF.text = _loc2_;
   }
   function setSection(section, cam, action1Lbl, action2Lbl)
   {
      this.sluiceGateMC.sectionMC.labelTF.text = section;
      this.sluiceGateMC.camMC.labelTF.text = cam;
      this.accessSwitchesMC.openSluiceBtnMC.highlightMC.titleMC.labelTF.text = action1Lbl;
      this.accessSwitchesMC.releaseSubBtnMC.highlightMC.titleMC.labelTF.text = action2Lbl;
   }
   function triggerFlash()
   {
      this.sluiceGateMC.noiseMC.gotoAndPlay("in");
   }
   function triggerWarning(num)
   {
      this.warningMC.gotoAndPlay("in");
      this.securityLayoutMC.mapMC.gotoAndStop(2);
   }
}
