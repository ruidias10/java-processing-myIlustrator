class OBJ_Arc extends OBJ { 

  boolean ponto1 = false;
  boolean linhaFeita = false;
  
  float tempx, tempy;
  int x1, y1, x2, y2, xf, yf; 
  int defaultStrokeWeight, pointSelect;
   
  int OBJ_strokeWeight;
  int OBJ_r, OBJ_g, OBJ_b;
  //=================================================================


  // Construtor da class
  //=================================================================
  OBJ_Arc(int[] _strokeColor, int _strokeWeight, int _defaultStrokeWeight)
  {
    this.type="Arco";
    this.pointSelect = 0;
    this.isvisible = true;
    this.OBJ_vetor = new int[6];
    
    this.OBJ_r = _strokeColor[0];
    this.OBJ_g = _strokeColor[1];
    this.OBJ_b = _strokeColor[2];
    
    this.OBJ_strokeWeight = _strokeWeight;
    this.defaultStrokeWeight = _defaultStrokeWeight;
    
    stroke(this.OBJ_r, this.OBJ_g, this.OBJ_b);
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
      arc(this.OBJ_vetor[0],this.OBJ_vetor[1],this.OBJ_vetor[2],this.OBJ_vetor[3],this.OBJ_vetor[4],this.OBJ_vetor[5]);
      strokeWeight(this.defaultStrokeWeight);
    }
  }
  //=================================================================


  // Inicia o processo de desenhar
  //=================================================================
  boolean desenha(boolean snap, int gridX, int gridY)
  {
    if (this.linhaFeita==false )
    {
      ellipseMode(RADIUS);
      if(this.ponto1==false) 
      {
        if (mousePressed && (mouseButton == LEFT))
        {
          this.x1 = mouseX;
          this.y1 = mouseY;         
          
          if (this.isValidatePosition() == true)
            this.ponto1=true;
            
          this.tempx=PI/2;
          this.tempy=PI;  
        }
      }
    
      if(this.ponto1==true && this.linhaFeita==false)
      {
        this.validatePosition();
        arc(this.x1,this.y1,mouseX-this.x1,mouseY-this.y1,(int)this.tempx,(int)this.tempy); 
      }
    
      if(this.ponto1==true)
      {
        if (mousePressed==false)
        {
          this.xf = mouseX;
          this.yf = mouseY;  

          arc(this.x1,this.y1,this.xf-this.x1,this.yf-this.y1,this.tempx,this.tempy);

          this.OBJ_vetor[0]=this.x1;
          this.OBJ_vetor[1]=this.y1;
          this.OBJ_vetor[2]=this.xf-this.x1;
          this.OBJ_vetor[3]=this.yf-this.y1;
          this.OBJ_vetor[4]=(int)this.tempx;
          this.OBJ_vetor[5]=(int)this.tempy;
          
          return true;
        }
      }
    }
    return false;
   } 
  //=================================================================


  //  Inicia o processo de desenhar
  //================================================================= 
  boolean edita()
  {
    return false;
  }
  //=================================================================


  // Desenha quadrados nos pontos para depois editar
  //=================================================================
  void elementToEdit(float px,float py)
  {
   
  }
}   
