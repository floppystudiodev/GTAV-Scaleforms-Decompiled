class com.rockstargames.gtav.levelDesign.heists.HEISTMAP_MP extends com.rockstargames.ui.core.BaseScriptUI
{
   var CONTENT;
   var zoomedOutMap;
   var zoomedInMap;
   function HEISTMAP_MP()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      var _loc3_ = this.CONTENT.mapZoomedIn.map;
      var _loc5_ = 500 / _loc3_.mapCenter._width;
      var _loc4_ = 500 / _loc3_.mapCenter._height;
      var _loc6_ = _loc3_._x - 7;
      var _loc7_ = _loc3_._y - 116;
      _loc3_._visible = false;
      var _loc9_ = flash.display.BitmapData.loadBitmap("HEIST_map_composite");
      this.zoomedOutMap = new com.rockstargames.gtav.levelDesign.heists.HeistMap(this.CONTENT.mapZoomedOut,_loc9_,_loc3_._x,_loc3_._y,_loc5_,_loc4_,_loc6_,_loc7_,false);
      var _loc8_ = flash.display.BitmapData.loadBitmap("HEIST_map_foreground");
      this.zoomedInMap = new com.rockstargames.gtav.levelDesign.heists.HeistMap(this.CONTENT.mapZoomedIn,_loc8_,_loc3_._x,_loc3_._y,_loc5_,_loc4_,_loc6_,_loc7_,true);
      this.zoomedInMap.hideAssets();
      this.zoomedOutMap.drawScrolledMap();
   }
   function RESET_ALL_DEPTHS()
   {
      this.zoomedInMap.resetAllDepths();
      this.zoomedOutMap.resetAllDepths();
   }
   function BRING_PIN_TO_FRONT(pinEnum)
   {
      this.zoomedInMap.bringPinToFront(pinEnum);
      this.zoomedOutMap.bringPinToFront(pinEnum);
   }
   function ADD_PIN(pinEnum, iconEnum, Xpos, Ypos, Scale, colR, colG, colB, colA)
   {
      this.zoomedInMap.addPin(pinEnum,iconEnum,Xpos,Ypos,Scale,colR,colG,colB,colA);
      this.zoomedOutMap.addPin(pinEnum,iconEnum,Xpos,Ypos,Scale,colR,colG,colB,colA);
   }
   function REMOVE_PIN(pinEnum)
   {
      this.zoomedInMap.removePin(pinEnum);
      this.zoomedOutMap.removePin(pinEnum);
   }
   function REMOVE_ALL_PINS()
   {
      this.zoomedInMap.removeAllPins();
      this.zoomedOutMap.removeAllPins();
   }
   function COLOUR_PIN(pinEnum, colR, colG, colB, colA, iconEnum)
   {
      this.zoomedInMap.colourPin(pinEnum,colR,colG,colB,colA,iconEnum);
      this.zoomedOutMap.colourPin(pinEnum,colR,colG,colB,colA,iconEnum);
   }
   function BRING_AREA_TO_FRONT(areaEnum)
   {
      this.zoomedInMap.bringAreaToFront(areaEnum);
      this.zoomedOutMap.bringAreaToFront(areaEnum);
   }
   function ADD_AREA(areaEnum, Xpos, Ypos, Diameter, colR, colG, colB, colA)
   {
      this.zoomedInMap.addArea(areaEnum,Xpos,Ypos,Diameter,colR,colG,colB,colA);
      this.zoomedOutMap.addArea(areaEnum,Xpos,Ypos,Diameter,colR,colG,colB,colA);
   }
   function REMOVE_AREA(areaEnum)
   {
      this.zoomedInMap.removeArea(areaEnum);
      this.zoomedOutMap.removeArea(areaEnum);
   }
   function REMOVE_ALL_AREAS()
   {
      this.zoomedInMap.removeAllAreas();
      this.zoomedOutMap.removeAllAreas();
   }
   function COLOUR_AREA(areaEnum, colR, colG, colB, colA)
   {
      this.zoomedInMap.colourArea(areaEnum,colR,colG,colB,colA);
      this.zoomedOutMap.colourArea(areaEnum,colR,colG,colB,colA);
   }
   function BRING_TEXT_TO_FRONT(textEnum)
   {
      this.zoomedInMap.bringTextToFront(textEnum);
      this.zoomedOutMap.bringTextToFront(textEnum);
   }
   function ADD_TEXT(textEnum, textString, Xpos, Ypos, textAngle, fontSize, textWidth, textAlpha, dropShadow)
   {
      this.zoomedInMap.addText(textEnum,textString,Xpos,Ypos,textAngle,fontSize,textWidth,textAlpha,dropShadow);
      this.zoomedOutMap.addText(textEnum,textString,Xpos,Ypos,textAngle,fontSize,textWidth,textAlpha,dropShadow);
   }
   function REMOVE_TEXT(textEnum)
   {
      this.zoomedInMap.removeText(textEnum);
      this.zoomedOutMap.removeText(textEnum);
   }
   function REMOVE_ALL_TEXT()
   {
      this.zoomedInMap.removeAllText();
      this.zoomedOutMap.removeAllText();
   }
   function COLOUR_TEXT(textEnum, colR, colG, colB, colA)
   {
      this.zoomedInMap.colourText(textEnum,colR,colG,colB,colA);
      this.zoomedOutMap.colourText(textEnum,colR,colG,colB,colA);
   }
   function HIDE_ALL_TEXT()
   {
      this.zoomedInMap.hideAllText();
      this.zoomedOutMap.hideAllText();
   }
   function SHOW_ALL_TEXT()
   {
      this.zoomedInMap.showAllText();
      this.zoomedOutMap.showAllText();
   }
   function BRING_POSTIT_TO_FRONT(postitEnum)
   {
      this.zoomedInMap.bringPostItToFront(postitEnum);
      this.zoomedOutMap.bringPostItToFront(postitEnum);
   }
   function ADD_POSTIT(postitEnum, textNumber, Xpos, Ypos)
   {
      this.zoomedInMap.addPostIt(postitEnum,textNumber,Xpos,Ypos);
      this.zoomedOutMap.addPostIt(postitEnum,textNumber,Xpos,Ypos);
   }
   function REMOVE_POSTIT(postitEnum)
   {
      this.zoomedInMap.removePostIt(postitEnum);
      this.zoomedOutMap.removePostIt(postitEnum);
   }
   function REMOVE_ALL_POSTITS()
   {
      this.zoomedInMap.removeAllPostIts();
      this.zoomedOutMap.removeAllPostIts();
   }
   function COLOUR_POSTIT(postitEnum, colR, colG, colB, colA)
   {
      this.zoomedInMap.colourPostIt(postitEnum,colR,colG,colB,colA);
      this.zoomedOutMap.colourPostIt(postitEnum,colR,colG,colB,colA);
   }
   function SCALE_POSTIT(postitEnum, scale)
   {
      this.zoomedInMap.scalePostIt(postitEnum,scale);
      this.zoomedOutMap.scalePostIt(postitEnum,scale);
   }
   function BRING_ARROW_TO_FRONT(arrowEnum)
   {
      this.zoomedInMap.bringArrowToFront(arrowEnum);
      this.zoomedOutMap.bringArrowToFront(arrowEnum);
   }
   function ADD_ARROW(arrowEnum, fromX, fromY, toX, toY, curve)
   {
      this.zoomedInMap.addArrow(arrowEnum,fromX,fromY,toX,toY,curve);
      this.zoomedOutMap.addArrow(arrowEnum,fromX,fromY,toX,toY,curve);
   }
   function REMOVE_ARROW(arrowEnum)
   {
      this.zoomedInMap.removeArrow(arrowEnum);
      this.zoomedOutMap.removeArrow(arrowEnum);
   }
   function REMOVE_ALL_ARROWS()
   {
      this.zoomedInMap.removeAllArrows();
      this.zoomedOutMap.removeAllArrows();
   }
   function COLOUR_ARROW(arrowEnum, colR, colG, colB, colA)
   {
      this.zoomedInMap.colourArrow(arrowEnum,colR,colG,colB,colA);
      this.zoomedOutMap.colourArrow(arrowEnum,colR,colG,colB,colA);
   }
   function BRING_HIGHLIGHT_TO_FRONT(highlightEnum)
   {
      this.zoomedInMap.bringHighlightToFront(highlightEnum);
      this.zoomedOutMap.bringHighlightToFront(highlightEnum);
   }
   function ADD_HIGHLIGHT(highlightEnum, Xpos, Ypos, Size, colR, colG, colB, colA)
   {
      this.zoomedInMap.addHighlight(highlightEnum,Xpos,Ypos,Size,colR,colG,colB,colA);
      this.zoomedOutMap.addHighlight(highlightEnum,Xpos,Ypos,Size,colR,colG,colB,colA);
   }
   function REMOVE_HIGHLIGHT(highlightEnum)
   {
      this.zoomedInMap.removeHighlight(highlightEnum);
      this.zoomedOutMap.removeHighlight(highlightEnum);
   }
   function REMOVE_ALL_HIGHLIGHTS()
   {
      this.zoomedInMap.removeAllHighlights();
      this.zoomedOutMap.removeAllHighlights();
   }
   function COLOUR_HIGHLIGHT(highlightEnum, colR, colG, colB, colA)
   {
      this.zoomedInMap.colourHighlight(highlightEnum,colR,colG,colB,colA);
      this.zoomedOutMap.colourHighlight(highlightEnum,colR,colG,colB,colA);
   }
   function ZOOM_MAP(zoom)
   {
      if(zoom)
      {
         if(this.zoomedInMap.checkIfIsDrawing)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,0.1,{onComplete:this.checkIfMapIsStillDrawing,onCompleteScope:this});
         }
         else
         {
            this.executeZoomTrue();
         }
      }
      else
      {
         this.zoomedOutMap.scrollIn();
      }
   }
   function CLEANUP()
   {
      this.zoomedInMap.cleanup();
      this.zoomedInMap = null;
      this.zoomedOutMap.cleanup();
      this.zoomedOutMap = null;
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this);
   }
   function checkIfMapIsStillDrawing()
   {
      if(this.zoomedInMap.checkIfIsDrawing)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,0.1,{onComplete:this.checkIfMapIsStillDrawing,onCompleteScope:this});
      }
      else
      {
         this.executeZoomTrue();
      }
   }
   function executeZoomTrue()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT);
      this.zoomedInMap.draw();
      this.zoomedInMap.showAssets();
      this.zoomedOutMap.scrollOut();
   }
}
