class Document { 

  Window win;
  ColorPicker pic;
  Select sel;
  OBJ[] _OBJ_ = new OBJ[100];
  
  String action;
  int Wwidth, Wheight, textSize, _OBJ_SIZE_, selectElementByID;
  PImage olho = loadImage("olho.jpg");
  //=================================================================
  

  // Construtor da Class 
  //================================================================= 
  Document(Window winx) 
  { 
    win = winx;
    pic = new ColorPicker();
    
    _OBJ_SIZE_ = 0;
    this.selectElementByID = -1;
  }
  //=================================================================
  

  // Apaga todo o array
  //=================================================================
  void cleanOBJ()
  {
    this._OBJ_ = null;
    this._OBJ_ = new OBJ[100];
  }
  //=================================================================
  

  // verifica se há ações persistentes
  //=================================================================
  void checkActions()
  {
    if (this.action == "select")
    {
      //sel.search();
      //println(this.selectElementByID);
      if (this.selectElementByID < 0)
      {
        this.selectElementByID = sel.search();
      }
      else
      {
        if (_OBJ_[selectElementByID].edita()){
          this.action = "";
        }
      }
      
    } 
    else if (this.action == "text")
    {
      //this.selectElementByID = -1;
      if (_OBJ_[_OBJ_SIZE_-1].desenha()){
        this.action = "";
      }
    }  
    else if (this.action == "bezier")
    {
      //this.selectElementByID = -1;
      println("bezier");
    } 
    else if (this.action == "freehand")
    {
      //this.selectElementByID = -1;
      println("freehand");
    }
    else if (this.action == "point")
    {
      if (_OBJ_[_OBJ_SIZE_-1].desenha(win.isSnapActive(), win.getGridX(), win.getGridY())){
        this.action = "";
      }
    }  
    else if (this.action == "triangle")
    {
      if (_OBJ_[_OBJ_SIZE_-1].desenha()){
        this.action = "";
      }
    } 
    else if (this.action == "rounded")
    {
      //this.selectElementByID = -1;
      if (_OBJ_[_OBJ_SIZE_-1].desenha()){
        this.action = "";
      }
    }
    else if (this.action == "rectangle")
    {
      //this.selectElementByID = -1;
      if (_OBJ_[_OBJ_SIZE_-1].desenha()){
        this.action = "";
      }
    }
    else if (this.action == "arc")
    {
      //this.selectElementByID = -1;
      if (_OBJ_[_OBJ_SIZE_-1].desenha(win.isSnapActive(), win.getGridX(), win.getGridY())){
        this.action = "";
      }
    }
    else if (this.action == "circle")
    {
      //this.selectElementByID = -1;
      if (_OBJ_[_OBJ_SIZE_-1].desenha()){
        this.action = "";
      }
    } 
    else if (this.action == "line")
    {
      //this.selectElementByID = -1;
      if (_OBJ_[_OBJ_SIZE_-1].desenha(win.isSnapActive(), win.getGridX(), win.getGridY())){
        this.action = "";
      }
    }
    else if (this.action == "polyline")
    {
      //this.selectElementByID = -1;
      if (_OBJ_[_OBJ_SIZE_-1].desenha(win.isSnapActive(), win.getGridX(), win.getGridY())){
        this.action = "";
      }
    }
    
    //===========================================================================
    else if (this.action == "pickerBg")
    {
      //this.selectElementByID = -1;
      int[] aux = new int[3];
      aux = pic.Stratr(win.getGgColor());
      
      if (aux[0] > -1) {
        win.setGgColor(aux);
        this.action = "";
      }
    }
    else if (this.action == "pickerStroke")
    {
      //this.selectElementByID = -1;
      int[] aux = new int[3];
      aux = pic.Stratr(win.getStrokeColor());
      
      if (aux[0] > -1) {
        win.setStrokeColor(aux);
        this.action = "";
      }
    } 
  }
  //=================================================================
  

  // verifica se há alguma ação associada ao click do rato
  //=================================================================
  boolean setMouseClicked(int mX, int mY)
  {
    // select
    //=========================     
    if (((mX>=6) && (mX<=39)) && ((mY>=90) && (mY<=115))) 
    {
      win.setActionText("Select");
      this.action = "select";
    
      sel = new Select(_OBJ_, _OBJ_SIZE_);
      
      return true;
    }
    
    // Texto
    //=========================  
    else if (((mX>=42) && (mX<=71)) && ((mY>=90) && (mY<=115))) 
    {
      win.setActionText("Texto");
      this.action = "text";

      _OBJ_[_OBJ_SIZE_] = new OBJ_Text(win.getStrokeColor()); 
      _OBJ_SIZE_++;
      
      return true;
    }
    
    // Curva Bezier
    //=========================     
    else if (((mX>=6) && (mX<=39)) && ((mY>=123) && (mY<=143))) 
    {
      win.setActionText("Curva Bezier");
      this.action = "bezier";
    
      return true;
    }
    
    // Caneta
    //=========================  
    else if (((mX>=42) && (mX<=71)) && ((mY>=123) && (mY<=143))) 
    {
      win.setActionText("Mão Livre");
      this.action = "freehand";
      
      return true;
    }
    
    // Ponto
    //=========================     
    else if (((mX>=6) && (mX<=39)) && ((mY>=147) && (mY<=162))) 
    {
      win.setActionText("Ponto");
      this.action = "point";
    
      _OBJ_[_OBJ_SIZE_] = new OBJ_Point(); 
      _OBJ_SIZE_++;
      
      return true;
    }
    
    // Triângulo 
    //=========================  
    else if (((mX>=42) && (mX<=71)) && ((mY>=147) && (mY<=162))) 
    {
      win.setActionText("Triângulo");
      this.action = "triangle";
      _OBJ_[_OBJ_SIZE_] = new OBJ_Triangle(win.getGgColor(), win.getStrokeColor()); 
      _OBJ_SIZE_++;
      
      return true;
    }
    
    // quadrado cantos redondos
    //=========================     
    else if (((mX>=6) && (mX<=39)) && ((mY>=170) && (mY<=185))) 
    {
      win.setActionText("Rounded");
      this.action = "rounded";
      _OBJ_[_OBJ_SIZE_] = new OBJ_Rectangulo(win.getGgColor(), win.getStrokeColor(), win.getRoundedCorners()); 
      _OBJ_SIZE_++;       

      return true;
    }
    
    // Quadrado
    //=========================   
    else if (((mX>=42) && (mX<=71)) && ((mY>=170) && (mY<=185))) 
    {
      win.setActionText("Rectangulo");
      this.action = "rectangle";
      _OBJ_[_OBJ_SIZE_] = new OBJ_Rectangulo(win.getGgColor(), win.getStrokeColor()); 
      _OBJ_SIZE_++;
      
      return true;
    }
    
    // Arco
    //=========================     
    else if (((mX>=6) && (mX<=39)) && ((mY>=186) && (mY<=212))) 
    {
      win.setActionText("Arco");
      this.action = "arc";  
      _OBJ_[_OBJ_SIZE_] = new OBJ_Arc(win.getStrokeColor(), win.getStrokeWeight(), win.getDefaultStrokeWeight()); 
      _OBJ_SIZE_++;    

      return true;
    }

    // Circulo
    //=========================   
    else if (((mX>=40) && (mX<=70)) && ((mY>=186) && (mY<=212))) 
    {
      win.setActionText("Circulo");
      this.action = "circle";
      _OBJ_[_OBJ_SIZE_] = new OBJ_Circle(win.getGgColor(), win.getStrokeColor(), win.getStrokeWeight(), win.getDefaultStrokeWeight()); 
      _OBJ_SIZE_++;
      
      return true;
    }

    // Linha
    //=========================     
    else if (((mX>=6) && (mX<=39)) && ((mY>=216) && (mY<=235))) 
    {   
      win.setActionText("Linha");
      this.action = "line";
      _OBJ_[_OBJ_SIZE_] = new OBJ_Line(win.getStrokeColor(), win.getStrokeWeight(), win.getDefaultStrokeWeight()); 
      _OBJ_SIZE_++;
      
      return true;
    }   
     
    // Polilinha
    //=========================     
    else if (((mX>=40) && (mX<=70)) && ((mY>=216) && (mY<=235))) 
    { 
      win.setActionText("Polilinha");
      this.action = "polyline";
      _OBJ_[_OBJ_SIZE_] = new OBJ_PoliLine(win.getGgColor(), win.getStrokeColor(), win.getStrokeWeight(), win.getDefaultStrokeWeight());
      _OBJ_SIZE_++;
      
      return true;
    }        

    //===========================================================================
    
    // Cor de fundo
    //=========================     
    else if (((mX>=12) && (mX<=44)) && ((mY>=445) && (mY<=477))) 
    {
      this.action = "pickerBg";
      win.setActionText(win.getDefaultActionText());
      
      return true;
    }
    
    // Cor do stroke
    //=========================     
    else if (((mX >= 29) && (mX <= 62)) && ((mY >= 464) && (mY <= 495))) 
    {
      this.action = "pickerStroke";
      win.setActionText(win.getDefaultActionText());
      
      return true;
    }
    
    //===========================================================================
    
    // Grid
    //=========================    
    else if (((mX >= 550) && (mX <= 563)) && ((mY >= 40) && (mY <= 55))) 
    {
      win.setShowGrid();
      return true;
    }
    
    // Snap
    //=========================     
    else if (((mX >= 625) && (mX <= 638)) && ((mY >= 40) && (mY <= 55))) 
    {
      win.setShowSnap();
      return true;
    }
    else
    {
      return false;
    }
  }
  //=================================================================
  

  // Redraw do documento
  //================================================================= 
  void documentRedraw()
  {
    for (int i=0; i<=_OBJ_SIZE_; i++)
    {
      if (_OBJ_[i] != null) {
        _OBJ_[i].myRedraw();
      }
    }
  }
  //=================================================================
  

  // Redraw dos layeres
  //================================================================= 
  void drawLayer()
  {
    win.setExtraMenus(this.action);
    
    int cnt=4;
    int heightSize = 22;
    int position = 90 - heightSize;
    
    stroke(0);
    
    for (int i=0; i<=_OBJ_SIZE_; i++)
    {

      int coiso = ((position-heightSize-heightSize)*cnt)-cnt*2;
      
      if (_OBJ_[i] != null) {
          fill(91, 101, 116);
          rect(width-237, coiso, 229, 22);
          
          if (_OBJ_[i].isVisible_())
            image(this.olho, width-234, coiso+6);
          
          line( width-214, coiso, width-214, coiso+22);
          
          fill(225, 223, 224);
          text("Layer " + (i +1), width-205, coiso+16);
          text(_OBJ_[i].getType(), width-100, coiso+16);
      }
      
      cnt++;
    }
  }
  //=================================================================
}
