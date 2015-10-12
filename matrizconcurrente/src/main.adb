with Ada.Integer_Text_IO, Ada.Text_IO;
use Ada.Integer_Text_IO, Ada.Text_IO;
procedure Main is
   tam :Integer:=400;
   valoresA : integer :=1;
   valoresB :Integer :=1;
   matrizA :array(1..tam,1..tam) of Integer;
   matrizB : array(1..tam,1..tam) of Integer;
   matrizC : array(1..tam,1..tam) of Integer;


   task llenarA;
   task llenarB;
   --task llenarC;
   task imprimirC is
      entry continuar ;
   end imprimirC;

   task type filas is
      entry rango(inicio,fin : Integer);
      end filas;

      task body llenarA is
   begin
      for i in 1..tam loop
         for j in 1..tam loop
            matrizA(i,j) := valoresA;
         end loop;
      end loop;
   end llenarA;

   task body llenarB is
      begin
      for i in 1..tam loop
         for j in 1..tam loop
            matrizB(i,j) := valoresB;
         end loop;
      end loop;
   end llenarB;

  ---- task body llenarC is
    --  for i in 1..500 loop
        -- for i in 1..500 loop
           -- matrizC(i,j) := 0;
        -- end loop;
      --end loop,
        --end llenarC;

      --cuerpo de l tarea
     -- j columnas y el i filas recorren
   task body filas  is
      begin
         accept rango (inicio : in Integer; fin : in Integer) do
            for j in inicio..fin loop
               for i in 1..tam  loop
                 matrizC(i,j):=0; --para llenar la matrizC
                  for k in 1..tam loop
                     matrizC(i,j):=matrizC(i,j) + (matrizA(i,k)* matrizB(k,j));
                  end loop;
               end loop;
            end loop;
          end rango;
   end filas;

      task body imprimirC is
         begin
            accept continuar do
         for i in 1..tam loop
            for j in 1..tam loop
               Put(matrizC(i,j));
            end loop;
              Put_Line("");
           end loop;
            end continuar;
         end imprimirC;

      tareas : array (1..10) of filas;-- defino el arreglo de tipo fila tareas10
     -- iMain : integer;
      delt : Integer;
      inicioRango :integer :=1;

   begin
      delt := tam / 10; --500/5->100
      for iMain in 1..10 loop
         tareas(iMain).rango(inicioRango,inicioRango+delt-1);
         inicioRango := inicioRango + delt;
      end loop;

         --delay 30.0;
        imprimirC.continuar;
         end Main;

