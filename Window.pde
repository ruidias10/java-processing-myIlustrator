class Window { 

  int[] bgColor = new int[3];
  int[] strokeColor = new int[3];
  int[] bgWindowColor = new int[3];
  
  //=================================================================
    
  DropdownList d1, d2, DLStrokeWeight, DLRounded;
  Button bbbb;
  
  //=================================================================
  
  boolean showGrid, showSnap;
  String actionText, defaultActionText;
  PImage leftMenu, topMenu, layers, btnSnap, btnSnapOk, btnGrid, btnGridOk;
  int Wwidth, Wheight, textSize, gridX, gridY, roundedCorners, defaultRoundedCorners, strokeWeight, defaultStrokeWeight;
  //=================================================================
  

  // Construtor da class
  //================================================================= 
  Window(ControlP5 cp5) 
  { 
    PFont p = createFont("Verdana",10);
    cp5.setControlFont(p);
    
    /*cria a DropdownList para a espessura do stroke*/
    this.DLStrokeWeight = cp5.addDropdownList("myList-DLStrokeWeight").setPosition(208, 60).setSize(70,200);     
    this.customizeDesignOptions(this.DLStrokeWeight);
    this.DLStrokeWeight.setValue(1); 
    this.DLStrokeWeight.setVisible(false);
    
    /*cria a DropdownList para rounded do quadrado*/
    this.DLRounded = cp5.addDropdownList("myList-DLRounded").setPosition(427, 60).setSize(70,200);       
    this.customizeDesignOptions(this.DLRounded);
    this.DLRounded.setValue(1); 
    this.DLRounded.setVisible(false);


    /*cria a DropdownList para a fonte e para o tamanho da fonte*/
    /*size*/
    this.d1 = cp5.addDropdownList("myList-d1").setPosition(440, 60).setSize(70,200);       
    this.customizeFontSize(this.d1);
    this.d1.setValue(10); 
    this.d1.setVisible(false);

    /*fonte*/
    this.d2 = cp5.addDropdownList("myList-d2").setPosition(175, 60).setSize(140,200);
    this.customize(this.d2);
    //this.d2.setIndex(10);
    this.d2.setValue(6); 
    this.d2.setVisible(false);
    
    
    /*cria os botões as acções gravar, sair, novo...*/
    this.bbbb = cp5.addButton("Novo").setValue(1).setPosition(3,6).setSize(43,19);
    this.customizeButton(bbbb);

    this.bbbb = cp5.addButton("Gravar PDF").setValue(2).setPosition(47,6).setSize(77,19);
    this.customizeButton(bbbb);
    
    this.bbbb = cp5.addButton("Gravar DXF").setValue(3).setPosition(128,6).setSize(77,19);
    this.customizeButton(bbbb);
    
    this.bbbb = cp5.addButton("Ajuda").setValue(4).setPosition(209,6).setSize(47,19);
    this.customizeButton(bbbb);
    
    this.bbbb = cp5.addButton("Sobre").setValue(5).setPosition(260,6).setSize(47,19);
    this.customizeButton(bbbb);
    
    this.bbbb = cp5.addButton("Sair").setValue(6).setPosition(313,6).setSize(37,19);
    this.customizeButton(bbbb);
    
    
    /*Stroke weight por defeito*/
    this.strokeWeight = 1;
    this.defaultStrokeWeight = 1;
    
    /*cantos arredondados*/
    this.roundedCorners = 0;
    this.defaultRoundedCorners = 0;
    
    /*Dados do snap*/
    this.showSnap = false;
    
    /*Dados da grid*/
    this.showGrid = false;
    this.gridX = 9;
    this.gridY = 9;
    
    /*Dados do texto*/
    this.textSize = 10;
    this.actionText = "Sem Seleção";
    this.defaultActionText = "Sem Seleção";
    
    /*Cor do background por defeito*/
    this.bgColor[0] = 237;
    this.bgColor[1] = 28;
    this.bgColor[2] = 36;
    
    /*Cor do stroke por defeito*/
    this.strokeColor[0] = 0;
    this.strokeColor[1] = 123;
    this.strokeColor[2] = 12;

    /*Cor de background da janela por defeito*/
    this.bgWindowColor[0] = 255;
    this.bgWindowColor[1] = 255;
    this.bgWindowColor[2] = 255;
    
    this.Wwidth = displayWidth - 15;
    this.Wheight = displayHeight - 70;
    
    this.configWindowDisplay(); 
    this.ConfigImagesMenus();
  }
  //=================================================================
  

  // Inicia o display da janela
  //================================================================= 
  void configWindowDisplay() 
  {
    size(this.Wwidth, this.Wheight);
  }
  //=================================================================
  

  // Inicia o display dos menus
  //================================================================= 
  void ConfigImagesMenus() 
  {
    this.topMenu = loadImage("topMenu.jpg");
    this.leftMenu = loadImage("leftMenu.jpg");
    this.layers = loadImage("Layers.jpg");
    
    this.btnSnap = loadImage("Select.jpg"); 
    this.btnSnapOk = loadImage("SelectOK.jpg"); 
    this.btnGrid = loadImage("Select.jpg");
    this.btnGridOk = loadImage("SelectOK.jpg");
  }
  //=================================================================
  

  // Faz o display do background
  //================================================================= 
  void cleanWindow()
  {
    background(this.bgWindowColor[0], this.bgWindowColor[1], this.bgWindowColor[2]);
  }
  //=================================================================
  

  // Inicia o display do menu
  //================================================================= 
  void displayStaticMenus()
  {
    if (this.showGrid == true){
      this.displayGrid();
    }
    
    image(this.topMenu, 0, 30);
    image(this.leftMenu, 0, 65);
    image(this.layers, this.Wwidth-243, 65);
    
    this.displayActionText();

    noStroke();
    
    fill(72, 72, 72);
    rect(0, 0, this.Wwidth, 30);
    
    
    stroke(255, 255, 255);
    fill(this.strokeColor[0], this.strokeColor[1], this.strokeColor[2]);
    rect(30, 463, 32, 32);
    
    fill(93, 93, 93);
    rect(37, 470, 18, 18);
    
    fill(this.bgColor[0], this.bgColor[1], this.bgColor[2]);
    rect(12, 445, 32, 32);
    
    //////////////////////////////
  }
  
  void setExtraMenus(String action)
  {
    fill(225, 223, 224);
    if (action == "select")
    {
      // EM DES
      this.d1.setVisible(false);
      this.d2.setVisible(false);
      this.DLStrokeWeight.setVisible(false);
      this.DLRounded.setVisible(false);
    }
    else if (action == "text")
    {
      text("Tipo de Letra", 100, 51);
      text("Tamanho da Letra", 340, 51);
      this.DLStrokeWeight.setVisible(false);
      this.DLRounded.setVisible(false);
      
      this.d1.setVisible(true);
      this.d2.setVisible(true);
    }
    else
    {
      text("Espessura do Stroke", 100, 51);
      text("Curvatura dos Cantos", 310, 51);
      this.d1.setVisible(false);
      this.d2.setVisible(false);
      
      this.DLStrokeWeight.setVisible(true);
      this.DLRounded.setVisible(true);
      
      text("Grid", 523, 51);
      text("Snap", 595, 51);
      
      this.btnSnap = loadImage("Select.jpg"); 
      this.btnSnapOk = loadImage("SelectOK.jpg"); 
      this.btnGrid = loadImage("Select.jpg");
      this.btnGridOk = loadImage("SelectOK.jpg");
      
      if (this.showGrid == true){
        image(this.btnGridOk, 550, 41);
      }
      else{
        image(this.btnGrid, 550, 41);
      }
      
      if (this.showSnap == true){
        image(this.btnSnapOk, 625, 41);
      }
      else{
        image(this.btnSnap, 625, 41);
      }
    }
  }
  //=================================================================
  

  // Actualiza campo de texto que indica a ação
  //================================================================= 
  String getDefaultActionText() { return this.defaultActionText; }
  
  void setActionText(String str) { this.actionText = str; }
  
  void displayActionText()
  {
    fill(225, 223, 224);
    textSize(this.textSize);
    text(this.actionText, 12, 51);
    
    //text("Grid", 113, 51);
    //text("Snap", 180, 51);
  }
  //=================================================================
  

  // Actualiza cor de fundo
  //================================================================= 
  int[] getGgColor() { 
    return this.bgColor; 
  }

  void setGgColor(int[] bg) { 
    this.bgColor[0] = bg[0];
    this.bgColor[1] = bg[1];
    this.bgColor[2] = bg[2];
  }
  //=================================================================
  

  // Actualiza cantos arredondados
  //================================================================= 
  int getRoundedCorners() {
    return this.roundedCorners;
  }
 
  void setRoundedCorners(int st) { 
    this.roundedCorners = st;
  }
  
  // Devolve defaultRoundedCorners
  int getDefaultRoundedCorners() {
    return this.defaultRoundedCorners;
  }
  //=================================================================
  

  // Actualiza cantos StrokeWeight
  //================================================================= 
  int getStrokeWeight() {
    return this.strokeWeight;
  }
 
  void setStrokeWeight(int st) { 
    this.strokeWeight = st;
  }

  int getDefaultStrokeWeight() {
    return this.defaultStrokeWeight;
  }
  //=================================================================
  

  // Actualiza cor de fundo
  //================================================================= 
  int[] getStrokeColor() {
    return this.strokeColor;
  }
 
  void setStrokeColor(int[] st) { 
    this.strokeColor[0] = st[0];
    this.strokeColor[1] = st[1];
    this.strokeColor[2] = st[2];
  }
  //=================================================================
  

  // Actualiza Snap
  //================================================================= 
  void setShowSnap() 
  { 
    if (this.showSnap == false) {
      this.showSnap = true;
    }
    else {
      this.showSnap = false;
    }
  } 
  boolean isSnapActive() 
  {
    return (this.showSnap && this.showGrid);
  }
  
  int getGridX() { return this.gridX; }
  int getGridY() { return this.gridY; }
  //=================================================================
  

  // Actualiza Grid
  //================================================================= 
  void setShowGrid() 
  { 
    if (this.showGrid == false) {
      this.showGrid = true;
    }
    else {
      this.showGrid = false;
    }
  } 
  
  void displayGrid()
  {
    //linhas horizontal
    int cnt = 0;
    for (int i = 65; i<=height; i=i+this.gridX)
    {
      line(0, i, width, i);
      
      cnt++;
      if (cnt> 8) 
      {
        cnt = 0;
        stroke(227, 227, 227);
      }
      else{
        stroke(244, 244, 244);
      }
    }

    //linhas verticais
    cnt = 0;
    for (int j= 78; j<=width; j=j+this.gridY)
    {
      line(j, 0, j, height);
      
      cnt++;
      if (cnt> 8) 
      {
        cnt = 0;
        stroke(227, 227, 227);
      }
      else{
        stroke(244, 244, 244);
      }
    }
  }
  //=================================================================
  


  

  // Customizar a DropdownList
  //================================================================= 
  void customize(DropdownList ddl) 
  {
    ddl.captionLabel().toUpperCase(false);
    ddl.setItemHeight(20);
    ddl.setBarHeight(22);
    ddl.captionLabel().set("Fonte");
    ddl.captionLabel().style().marginTop = 3;
    ddl.captionLabel().style().marginBottom = 3;
    ddl.captionLabel().style().marginLeft = 3;
    ddl.valueLabel().style().marginTop = 3;

    ddl.addItem("Verdana",   6);
    ddl.addItem("Times New Roman",   7);

    //ddl.scroll(0);
    ddl.setBackgroundColor(color(190));
    ddl.setColorBackground(color(49));
    ddl.setColorActive(color(88));
    ddl.setColorForeground(color(88)); 
  }
  //=================================================================
  

  // Customizar a DropdownList com o tamanho da fonte
  //================================================================= 
  void customizeFontSize(DropdownList ddl) 
  {
    ddl.captionLabel().toUpperCase(false);
    ddl.setItemHeight(20);
    ddl.setBarHeight(22);
    ddl.captionLabel().set("Fonte");
    ddl.captionLabel().style().marginTop = 3;
    ddl.captionLabel().style().marginBottom = 3;
    ddl.captionLabel().style().marginLeft = 3;
    ddl.valueLabel().style().marginTop = 3;

    ddl.addItem("8 pt",   8);
    ddl.addItem("9 pt",   9);
    ddl.addItem("10 pt", 10);
    ddl.addItem("11 pt", 11);
    ddl.addItem("12 pt", 12);
    ddl.addItem("14 pt", 14);
    ddl.addItem("18 pt", 18);
    ddl.addItem("21 pt", 21);

    ddl.setBackgroundColor(color(190));
    ddl.setColorBackground(color(49));
    ddl.setColorActive(color(88));
    ddl.setColorForeground(color(88)); 
  }
  //=================================================================
  

  // Customizar a customizeDesignOptions com o tamanho da fonte
  //================================================================= 
  void customizeDesignOptions(DropdownList ddl) 
  {
    ddl.captionLabel().toUpperCase(false);
    ddl.setItemHeight(20);
    ddl.setBarHeight(22);
    ddl.captionLabel().set("Opções");
    ddl.captionLabel().style().marginTop = 3;
    ddl.captionLabel().style().marginBottom = 3;
    ddl.captionLabel().style().marginLeft = 3;
    ddl.valueLabel().style().marginTop = 3;

    ddl.addItem("1 pt",   1);
    ddl.addItem("3 pt",   3);
    ddl.addItem("5 pt",   5);
    ddl.addItem("7 pt",   7);
    ddl.addItem("9 pt",   9);
    ddl.addItem("11 pt", 11);
    ddl.addItem("13 pt", 13);
    ddl.addItem("15 pt", 15);
    ddl.addItem("17 pt", 17);

    ddl.setBackgroundColor(color(190));
    ddl.setColorBackground(color(49));
    ddl.setColorActive(color(88));
    ddl.setColorForeground(color(88)); 
  }
  //=================================================================
  

  // Customizar Button
  //================================================================= 
  void customizeButton(Button bbbb) 
  {
    bbbb.captionLabel().toUpperCase(false);
    bbbb.setColorBackground(color(72));
    bbbb.setColorForeground(color(88));
    bbbb.setColorActive(color(49));
    bbbb.setColorCaptionLabel(color(225, 223, 224));  
    bbbb.captionLabel().style().marginLeft = 4;
    //bbbb.lock();
  }
}

