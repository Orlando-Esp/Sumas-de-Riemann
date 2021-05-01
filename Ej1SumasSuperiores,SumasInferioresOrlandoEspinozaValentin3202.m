% Octave Script
% Title			:Sumatoria de Riemann_supeiores_e_inferiores.
% Description		:Script para desarrrollar el ejericio 1 de la actividad Sumatoria de Riemann_supeiores_e_inferiores.
% Author		:Orlando Espinoza Valentin (Orlando-Esp) espinozaorlando978@gmail.com
% Date			:20210429
% sion		        :1
% Usage			:octave> /path/SumasSuperiores,SumasInferioresOrlandoEspinozaValentin3202
% Notes			:Requiere aplicacion octave-online usar en consola preferentemente. 
%program execution page :https://octave-online.net
 
syms x 
f = @(x) x^2 + 2
%intervalos
desde = 1
hasta = 4
%numero de rectangulos
cant = 40
h = (hasta - desde)/cant
%calculando xi
xi = linspace(desde, hasta, cant+2)
%almacenamiento de x 
for i = 1 : cant+1
    yi(i) = f(xi(i));
end
%mostrar en pantalla   
Rn = h* sum(double(yi(1 : cant)))
Ln = h* sum(double(yi(2 : cant+1)))

ezplot(f,[desde hasta]);
hold on;

plot([xi(1) xi(end)],[0 0],'b')

for i = 1 : cant+1
    if(f(xi(i)) >= 0)

        plot([xi(i) xi(i)],[0 double(f(fminbnd(f,xi(i),xi(i+1))))],'g')
        plot([xi(i) xi(i+1)],[double(f(fminbnd(f,xi(i),xi(i+1)))) double(f(fminbnd(f,xi(i),xi(i+1))))],'g')
        plot([xi(i+1) xi(i+1)],[double(f(fminbnd(f,xi(i),xi(i+1)))) 0],'g')
    
        g = @(x) -f(x);
    
        plot([xi(i) xi(i)],[0 double(f(fminbnd(g,xi(i),xi(i+1))))],'r')
        plot([xi(i) xi(i+1)],[double(f(fminbnd(g,xi(i),xi(i+1)))) double(f(fminbnd(g,xi(i),xi(i+1))))],'r')
        plot([xi(i+1) xi(i+1)],[double(f(fminbnd(g,xi(i),xi(i+1)))) 0],'r')
    else

        plot([xi(i) xi(i)],[0 double(f(fminbnd(f,xi(i),xi(i+1))))],'r')
        plot([xi(i) xi(i+1)],[double(f(fminbnd(f,xi(i),xi(i+1)))) double(f(fminbnd(f,xi(i),xi(i+1))))],'r')
        plot([xi(i+1) xi(i+1)],[double(f(fminbnd(f,xi(i),xi(i+1)))) 0],'r')
    
        g = @(x) -f(x);
    
        plot([xi(i) xi(i)],[0 double(f(fminbnd(g,xi(i),xi(i+1))))],'g')
        plot([xi(i) xi(i+1)],[double(f(fminbnd(g,xi(i),xi(i+1)))) double(f(fminbnd(g,xi(i),xi(i+1))))],'g')
        plot([xi(i+1) xi(i+1)],[double(f(fminbnd(g,xi(i),xi(i+1)))) 0],'g')
    end
end
