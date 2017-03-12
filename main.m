clear all,close all,clc;
a = imread('imagen.jpg');

b1=edge(a,'sobel','vertical'); 
b2=edge(a,'sobel','horizontal'); 
b3=a;
%b3=edge(a,'sobel'); 

%b3 = ~b3;
%figure(1);
%imshow(b3);


tamanoInicial = 300;
tamanoFinal = 60;
%a = imread('unacosa.png');
escala = tamanoFinal / tamanoInicial;
b3 = imresize(b3,escala);
figure(2); imshow(b3);

%b3=edge(b3,'sobel'); 

%b3 = ~b3;
b3 = im2bw(a,0.5);
b3 = imresize(b3,escala);
figure(3);
imshow(b3);
txt = string('');
state = 0; %cerp arriba 1 abajo
temp = string('');
threeCount = 0;
for i=1:60
   for j=1:60
       if(b3(i,j)==1) 
           if(state)
              state = 0;
              temp = string('2'); 
              txt = strcat(txt,temp);
           end
           
       else
           if(~state)
               state = 1;
               temp = string('4');
               txt = strcat(txt,temp);
           end
       end
       temp = string('3');        
       threeCount= threeCount+1;    
       txt = strcat(txt,temp);    
   end
      if(state==1)
          state = 0;
          temp = string('2');
          txt = strcat(txt,temp);
      end
   
   temp = string('5');
   txt = strcat(txt,temp);
   temp = string('');
   for i = 1:threeCount
       temp = strcat('1',temp);
   end
   threeCount = 0;
   txt = strcat(txt,temp);
   
end
f = fullfile('c:\','myfiles','salida.txt')
fi = fopen(f, 'w');
fprintf(fi, txt);
fclose(fi);
