class com.rockstargames.gtav.pc.applications.App_Antivirus extends com.rockstargames.gtav.pc.applications.App_Base
{
   var instructionMC;
   var continueMC;
   var debugMC;
   var actionBtn;
   var windowBtn;
   var bgMC;
   var scanbarMC;
   var logoMC;
   var debugList;
   var ref;
   var isWindowOpen = false;
   var isRepairing = false;
   var isRepaired = false;
   var isAnimating = false;
   var t = 100;
   function App_Antivirus()
   {
      super();
      this._visible = this.isWindowOpen = false;
   }
   function ready(fText)
   {
      delete this.instructionMC.onEnterFrame;
      this.flashText(fText);
      if(!this.isWindowOpen)
      {
         this.localizeContinueButton("LES1A_ANTVI_SCAN");
         this.continueMC._visible = true;
         this.debugMC._visible = false;
         this.actionBtn = new com.rockstargames.gtav.pc.PCButtonBase();
         this.actionBtn.init(this.continueMC,com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS_START[0],{depth:5000});
         this.desktopRef.addButtons(this.actionBtn,true);
         this._visible = this.isWindowOpen = true;
         this.windowBtn = new com.rockstargames.gtav.pc.PCButtonBase();
         this.windowBtn.init(this.bgMC,com.rockstargames.gtav.constants.PCAppLUT.PC_WINDOW[0],{depth:4999});
         this.desktopRef.addButtons(this.windowBtn,true);
      }
   }
   function notReady(fText)
   {
      delete this.instructionMC.onEnterFrame;
      this.flashText(fText);
      if(this.isRepairing == false && this.isRepaired == false)
      {
         this.localizeContinueButton("LES1A_ANTVI_CLOSE");
         this.continueMC._visible = true;
         this.debugMC._visible = false;
         this.actionBtn = new com.rockstargames.gtav.pc.PCButtonBase();
         this.actionBtn.init(this.continueMC,com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS_CLOSE[0],{depth:5000});
         this.desktopRef.addButtons(this.actionBtn,true);
         this._visible = this.isWindowOpen = true;
         this.windowBtn = new com.rockstargames.gtav.pc.PCButtonBase();
         this.windowBtn.init(this.bgMC,com.rockstargames.gtav.constants.PCAppLUT.PC_WINDOW[0],{depth:4999});
         this.desktopRef.addButtons(this.windowBtn,true);
      }
   }
   function setScanBar(num)
   {
      this.scanbarMC.barMC._xscale = num;
   }
   function playScanAnim(bool)
   {
      if(bool)
      {
         this.scanbarMC.frameMC.play();
      }
      else
      {
         this.scanbarMC.frameMC.stop();
      }
      this.isAnimating = Boolean(bool);
   }
   function scanAntiVirus(secs)
   {
      this.desktopRef.removeButtons(this.actionBtn);
      this.desktopRef.resetUnderCursor();
      this.continueMC._visible = false;
      this.logoMC._visible = false;
      this.debugMC._visible = true;
      this.scanbarMC.barMC._alpha = 100;
      this.scanbarMC.barMC._xscale = 1;
      this.instructionMC._alpha = 0;
      this.scanbarMC._alpha = 100;
      this.isRepairing = this.isAnimating = true;
      this.startDebug();
   }
   function scanComplete()
   {
      this.flashText("");
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.instructionMC.labelTF,"LES1A_ANTVI_COMP");
      this.scanbarMC._alpha = 0;
      this.instructionMC._alpha = 100;
      this.logoMC._visible = true;
      this.debugMC._visible = false;
      this.isRepairing = this.isAnimating = false;
      this.isRepaired = true;
      this.stopDebug();
      this.continueMC._visible = true;
      this.localizeContinueButton("LES1A_ANTVI_EXTER");
      this.actionBtn.init(this.continueMC,com.rockstargames.gtav.constants.PCAppLUT.PC_ANTIVIRUS_CLEAN[0],{depth:5050});
      this.desktopRef.addButtons(this.actionBtn,true);
      this.desktopRef.checkUnderCursor();
   }
   function closeButtons()
   {
      this.desktopRef.removeButtons(this.actionBtn);
      this.desktopRef.removeButtons(this.windowBtn);
      this.desktopRef.resetUnderCursor();
      this._visible = this.isWindowOpen = false;
   }
   function startDebug()
   {
      this.debugList = ["Sixfiguretemps.exe","Internet eyeFind 6","G235Virus","ActualizeYourself.exe","Ring Worm A23","T44Virus","Virtiga714","MonetaryScience.us","iFruit Park X","Lifeinvader.exe","Cashfordeaddreams.exe","Epsilon Program","Rav Mon.exe"];
      this.debugMC.ref = this;
      this.debugMC.onEnterFrame = function()
      {
         this.ref.updateDebug();
      };
   }
   function stopDebug()
   {
      delete this.debugMC.onEnterFrame;
   }
   function updateDebug()
   {
      if(this.isAnimating)
      {
         if(Math.random() * 100 > 50)
         {
            var _loc2_ = this.debugList[Math.floor(Math.random() * this.debugList.length)];
            this.debugMC.labelTF.text = "";
            this.debugMC.labelTF.text = _loc2_;
         }
      }
   }
   function flashText(str)
   {
      this.t = 100;
      this.instructionMC.labelTF.text = str;
      this.instructionMC.ref = this;
      this.instructionMC.onEnterFrame = function()
      {
         this.ref.update();
      };
   }
   function update()
   {
      this.t = this.t - 1;
      if(this.t < 0)
      {
         this.instructionMC._visible = true;
         delete this.instructionMC.onEnterFrame;
      }
      else if(this.t > 20 && this.t < 40 || this.t > 60 && this.t < 80 || this.t > 100 && this.t < 120)
      {
         this.instructionMC._visible = false;
      }
      else
      {
         this.instructionMC._visible = true;
      }
   }
   function localizeContinueButton(stringTable)
   {
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.continueMC.labelTF,stringTable);
   }
}
