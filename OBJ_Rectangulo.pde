class OBJ_Rectangulo extends OBJ { 

  boolean ponto1 = false;
  boolean quadFeito = false;

  int r, g, b;
  int xi, yi, xf, yf;
  int OBJ_roundedCorners = 0;
  
  int[] vetor = new int[4];
  int[] OBJ_strokeColor = new int[3];
  //=================================================================


  // Construtor da class
  //=================================================================
  OBJ_Rectangulo(int[] _bgColor, int[] _strokeColor)
  {
    this.type="Retangulo";
    this.isvisible = true;

    r = _bgColor[0];
    g = _bgColor[1];
    b = _bgColor[2];
    
    this.OBJ_strokeColor = _strokeColor;
    
    stroke(this.OBJ_strokeColor[0], this.OBJ_strokeColor[1], this.OBJ_strokeColor[2]);
    fill(r, g, b);
  }
  //=================================================================


  // Construtor da class com mais parametros
  //=================================================================
  OBJ_Rectangulo(int[] _bgColor, int[] _strokeColor, int _roundedCorners)
  {
    this.type="Retangulo";
    this.isvisible = true;
    
    r = _bgColor[0];
    g = _bgColor[1];
    b = _bgColor[2];
    
    this.OBJ_strokeColor = _strokeColor;
    this.OBJ_roundedCorners = _roundedCorners;
    
    stroke(this.OBJ_strokeColor[0], this.OBJ_strokeColor[1], this.OBJ_strokeColor[2]);
    fill(r, g, b);
  }
  //=================================================================


  // Desenha o que tem na memória
  //=================================================================
  void myRedraw()
  {
    if (this.isvisible == true)
    {
      stroke(this.OBJ_strokeColor[0], this.OBJ_strokeColor[1], this.OBJ_strokeColor[2]);
      fill(r, g, b);
      rect(this.vetor[0],this.vetor[1],this.vetor[2],this.vetor[3], this.OBJ_roundedCorners);
    }
  }
  //=================================================================


  // Inicia o processo de desenhar
  //=================================================================
  boolean desenha()
  {
    if (this.quadFeito == false )
    {
      if(this.ponto1 == false) 
    {
        if (mousePressed && (mouseButton == LEFT))
        {
          this.xi = mouseX;
          this.yi = mouseY;         
          
      if(mouseX>78) 
          {      
        this.ponto1=true;  
          }      
        }
      }
          
      if(this.ponto1 == true && this.quadFeito == false)
      {
        strokeWeight(1);
        if(mouseX<78)
    {
      mouseX=78;
    }
    
        if (keyPressed &&(int(key) == 65535))
          rect(this.xi,this.yi,mouseX-this.xi,mouseX-this.xi, this.OBJ_roundedCorners); 
        else
          rect(this.xi,this.yi,mouseX-this.xi,mouseY-this.yi, this.OBJ_roundedCorners);    
      }
        
      if(this.ponto1 == true)
      {
        if (mousePressed == false)
    {
          this.xf = mouseX;
          this.yf = mouseY;  
             
          rect(this.xi,this.yi,this.xf-this.xi,this.yf-this.yi, this.OBJ_roundedCorners);
          this.quadFeito=true;
          this.vetor[0]=this.xi;
          this.vetor[1]=this.yi;
          this.vetor[2]=this.xf-this.xi;
          this.vetor[3]=this.yf-this.yi;

          this.ponto1=false;
          this.quadFeito=false;
          return true;
        }
      }
    }
  
    return false;
  }
}    
