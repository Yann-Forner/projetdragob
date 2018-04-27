/*
  ProjetDrago
    By Yann FORNER v1
*/

int menu=0;
boolean isEauChaudePleine=false;
boolean isEauChaude=false;
boolean isGlaconPlein=false;
boolean isGlacon=false;
int yRect=-1;
int xBarree=0;
int xBarree2=0;
int timerGlacon=0;


PImage fond1;
PImage buttonStart;

PImage schema;
PImage fond2;
PImage glacon1;
PImage glacon2;
PImage glacon3;



void setup(){
  size(750,600);
  frameRate(60);
  
  fond1=loadImage("fond1.png");
  buttonStart=loadImage("buttonStart.png");
  
  fond2=loadImage("fond2.png");
  schema=loadImage("schema.png");
  glacon1=loadImage("glacon1.png");
  glacon2=loadImage("glacon2.png");
  glacon3=loadImage("glacon3.png");
}//finSetup

void draw(){
  if (menu==0){
    image(fond1,0,0);
    image(buttonStart,275,250);
  }//menu
  if (menu==1){
    image(fond2,0,0);
    if(isEauChaude==true){
     RemplissageEau();
    }
    if(isGlacon==true){
     RemplissageGlacon(); 
    }
    image(schema,200,80);
  }//animation
  if (menu==2){
  }//Graphique
  if (menu==3){
  }//Tableau
 
}//finDraw
void RemplissageEau(){
  fill(43,152,245,125);
   rect(516,515,161,yRect);
   
   noStroke();
   if(yRect>=-180){
        yRect=yRect-5;
   }else{
     isEauChaudePleine=true;
   }
   if(isEauChaudePleine==true){
     barreeEnRouge(229);
     
   }
    
}//finRemplissageEau

void RemplissageGlacon(){
   ++timerGlacon;
   image(glacon1,304,452);
   if(timerGlacon>=25)image(glacon2,243,405);
   if(timerGlacon>=50){
     image(glacon3,245,380);
     isGlaconPlein=true;
   }
   if(isGlaconPlein==true){
     barreeEnRouge2(297);
     
   }
    
}//finRemplissageGlacon

void barreeEnRouge(int y){
   fill(255,0,0);
   noStroke();
     rect(24,y,xBarree,3);
     if(xBarree<=80)  
     {
       xBarree=xBarree+5;
     }
}//finBarreeEnRouge
void barreeEnRouge2(int y){
   fill(255,0,0);
   noStroke();
     rect(24,y,xBarree2,3);
     if(xBarree2<=80)  
     {
       xBarree2=xBarree2+5;
     }
}//finBarreeEnRouge2

void mousePressed(){
  if (menu==0){
    if(mouseX<=475 && mouseX>=275 && mouseY>=250 && mouseY<=350){
      menu=1;
    }//buttonStart
  }//menu
  if (menu==1){
    if(mouseX<=108 && mouseX>=25 && mouseY>=213 && mouseY<=252){
      isEauChaude=true;
    }//buttonEauChaude
    if(mouseX<=108 && mouseX>=25 && mouseY>=277 && mouseY<=315){
      isGlacon=true;
    }//buttonGlacons
  }//Schema
}//finMousePressed
