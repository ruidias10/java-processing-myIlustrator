class OBJ_Circle extends OBJ { 

  boolean ponto1 = false;
  boolean circlFeito = false;

  int xi, yi, xf, yf, tempx, tempy;
  int defaultStrokeWeight, pointSelect, OBJ_strokeWeight;

  int OBJ_r, OBJ_g, OBJ_b;
  int OBJ_bgr, OBJ_bgg, OBJ_bgb;
  //=================================================================


  // Construtor da class
  //=================================================================
  OBJ_Circle(int[] _bgColor, int[] _strokeColor, int _strokeWeight, int _defaultStrokeWeight)
  { 
    this.type="Circulo";
    this.pointSelect = 0;
    this.isvisible = true;
    this.OBJ_vetor = new int[4];
    
    this.OBJ_r = _strokeColor[0];
    this.OBJ_g = _strokeColor[1];
    this.OBJ_b = _strokeColor[2];
    
    this.OBJ_bgr = _bgColor[0];
    this.OBJ_bgg = _bgColor[1];
    this.OBJ_bgb = _bgColor[2];
    
    this.OBJ_strokeWeight = _strokeWeight;
    this.defaultStrokeWeight = _defaultStrokeWeight;
    
    stroke(this.OBJ_r, this.OBJ_g, this.OBJ_b);
    fill(this.OBJ_bgr, this.OBJ_bgg, this.OBJ_bgb);
  }
  //=================================================================


  // Desenha o que tem na memória
  //=================================================================
  void myRedraw()
  {
    if (this.isvisible == true)
    {
      strokeWeight(this.OBJ_strokeWeight);
      stroke(this.OBJ_r, this.OBJ_g, this.OBJ_b);
      fill(this.OBJ_bgr, this.OBJ_bgg, this.OBJ_bgb);
      ellipse(this.OBJ_vetor[0],this.OBJ_vetor[1],this.OBJ_vetor[2],this.OBJ_vetor[3]);
      strokeWeight(this.defaultStrokeWeight);
    }
  }
  //=================================================================


  // Inicia o processo de desenhar
  //=================================================================
  boolean desenha()
  {   
    if (this.circlFeito==false )
    {
      ellipseMode(RADIUS);
      if(this.ponto1==false) 
      {
        if (mousePressed && (mouseButton == LEFT))
        {
          this.xi = mouseX;
          this.yi = mouseY;         
          
          if (this.isValidatePosition() == true)
            this.ponto1 = true;   
        }
      }
      
      if(this.ponto1==true && this.circlFeito==false)
      {
        this.validatePosition();

        this.tempx = mouseX - this.xi;
        this.tempy = mouseY - this.yi;        
        
        // faz a circunfrencia exata
        if (keyPressed &&(int(key) == 65535))
        {
          ellipse(this.xi,this.yi,this.tempx,this.tempx); 
        }
        else
        {
          ellipse(this.xi,this.yi,this.tempx,this.tempy); 
        }          
      }
    
      if(this.ponto1 == true)
      {
        if (mousePressed == false)
        {
          this.xf = this.tempx;
          this.yf = this.tempy;  

          this.OBJ_vetor[0] = this.xi;
          this.OBJ_vetor[1] = this.yi;
          this.OBJ_vetor[2] = this.xf;
          this.OBJ_vetor[3] = this.yf;
         
          return true;
        }
      }
    }
    return false;
  }     
  //=================================================================


  //  Inicia o processo de editar
  //================================================================= 
  boolean edita()
  {
     this.elementToEdit(this.OBJ_vetor[0],this.OBJ_vetor[1]);
     //this.elementToEdit(this.OBJ_vetor[2],this.OBJ_vetor[3]);
     this.elementToEdit(this.OBJ_vetor[0]+this.OBJ_vetor[2],this.OBJ_vetor[1]+this.OBJ_vetor[3]);
     
     if (mousePressed && (mouseButton == LEFT))
     {
       if (mouseX>this.OBJ_vetor[0]-20 && mouseX<this.OBJ_vetor[0]+20 && mouseY<this.OBJ_vetor[1]+20 && mouseY>this.OBJ_vetor[1]-20){
         this.pointSelect = 1;
       }
       
       //else if (mouseX>this.OBJ_vetor[2]-20 && mouseX<this.OBJ_vetor[2]+20 && mouseY<this.OBJ_vetor[3]+20 && mouseY>this.OBJ_vetor[3]-20)
       else if (mouseX>this.OBJ_vetor[0]+this.OBJ_vetor[2]-20 && mouseX<this.OBJ_vetor[0]+this.OBJ_vetor[2]+20 && mouseY<this.OBJ_vetor[1]+this.OBJ_vetor[3]+20 && mouseY>this.OBJ_vetor[1]+this.OBJ_vetor[3]-20){
         this.pointSelect = 2;
       }
     }
     else {
       this.pointSelect = 0;
     }
     
     if (this.pointSelect == 1){
        this.OBJ_vetor[0] = mouseX;
        this.OBJ_vetor[1] = mouseY;
     }
     else if (this.pointSelect == 2){
        this.OBJ_vetor[2] = mouseX-this.OBJ_vetor[0];
        this.OBJ_vetor[3] = mouseY-this.OBJ_vetor[1]; 
     }

     if (mouseButton == RIGHT)
     {
       return true;
     }
      
     return false;
  }
  //=================================================================


  // Desenha quadrados nos pontos para depois editar
  //=================================================================
  void elementToEdit(float px,float py)
  {
    stroke(79, 128, 255);
    fill(255, 255, 255);
    rect(px-3, py-3, 6,6);
    noFill();
    stroke(this.OBJ_r, this.OBJ_g, this.OBJ_b);    
    rect(OBJ_vetor[0]-OBJ_vetor[2], OBJ_vetor[1]-OBJ_vetor[3], OBJ_vetor[2] + OBJ_vetor[2], OBJ_vetor[3] + OBJ_vetor[3]);  
  }
}   
