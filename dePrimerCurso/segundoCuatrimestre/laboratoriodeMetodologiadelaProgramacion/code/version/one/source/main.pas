PROGRAM cuenta_palabras;
USES basic, utils1, utils2, crt;
CONST
MINW = 4;
MAXW = 14;
n_fich_dest = 'fich_output.txt';
PROCEDURE menu1 (VAR opcion:STRING);
BEGIN
	WRITELN('- Welcome to WORDS GAME - ');
	WRITELN('Main Menu (press option, example 1 and push intro):');
	WRITELN('(1) Analyce font file:');
	WRITELN('(2) Leave:');
	READLN(opcion);
END;
PROCEDURE menu2 (VAR pathff:STRING);
BEGIN
	WRITELN('Diego Game Words');
	WRITELN('The game is startup...');
	WRITE('1. Please can you tell me the path system to font file for the analyce (example test.txt): ');
	READLN(pathff);
END;
PROCEDURE insertar_palabra_en_fich_output (VAR palabra:STRING;VAR fich_dest:tficht);
VAR 
	es_valida:BOOLEAN;
BEGIN
IF((esta_entre_min_y_max (MINW,MAXW,palabra)) AND (contiene_vocal(palabra)) AND (NOT(contiene_caract_no_alfab(palabra)))) THEN
				BEGIN
					es_valida_semanticamente (palabra, es_valida);
   					IF(NOT(es_valida))THEN
						eliminar_conso_val_rep_mas_de_dos_veces (palabra);
						eliminar_letras_rep(palabra);
   					(*ya es valida...*)
                                        WRITE(fich_dest,palabra + ':');
                                        WRITELN(palabra,' - ',LENGTH(palabra));

   				END;
END;
PROCEDURE preparar_para_cargar_lista(path_fich_dest:STRING;VAR fich_ori,fich_dest:tficht; VAR tot_words:INTEGER);
VAR
	
	pathff:STRING;
	es_correcto:BOOLEAN;
	(*valiables para formar las palabras*)
	car:CHAR;
	palabra:STRING;
BEGIN
	es_correcto := false;
        palabra := #0;
	tot_words := 0;
        REPEAT
	BEGIN

		menu2 (pathff);
		//abrimos los archivos
		abrir_fich_en_modo_lect (pathff, fich_ori, es_correcto);
	IF  (es_correcto) THEN
	BEGIN
		abrir_fich_en_modo_rw (path_fich_dest, fich_dest, es_correcto);
		(*INICIALIZAMOS*)
		IF  (es_correcto) THEN
			BEGIN
                		WRITELN('    word     - size');
				car := '0';
				delete(palabra,1,LENGTH(palabra));
				READ(fich_ori,car);
				WHILE(NOT(EOF(fich_ori))) DO
				BEGIN
					IF ((car = ' ') XOR (NOT(car = #10))) THEN
						palabra := palabra + car
					ELSE
					BEGIN
						limpiar_palabra(palabra);
						insertar_palabra_en_fich_output(palabra, fich_dest);
						INC(tot_words);
						delete(palabra,1,LENGTH(palabra));	
					END;(*ELSE*)
					READ(fich_ori,car);
				END;(*WHILE*)
				insertar_palabra_en_fich_output(palabra, fich_dest);
			END(*IF*)
		ELSE
		WRITELN('Error, open the file dest, please contact with the developer...');
	END
	ELSE
		WRITELN('Incorrect system path to file font...');
	END;
	UNTIL(es_correcto = true);
	CLOSE(fich_ori);
	CLOSE(fich_dest);
END;
PROCEDURE ordenar_eliminar_y_visualizar (VAR listp:tlistp);
VAR
	fdest:tfich;
	nodo_lista,nodo_ptr:tnodolistp;
	//ojo con esto
	es_correcto,encontrado:BOOLEAN;
BEGIN
		WRITELN('- ORDER LIST WITH BUBLE METHOD -');
		READKEY;
		//inicializamos
		nodo_lista := listp;
		WHILE (nodo_lista <> NIL) DO
		BEGIN
			ordenar_por_met_burbuja_sub(nodo_lista^.palabra);
			nodo_lista := nodo_lista^.psiguiente;
		END;
		READKEY;
		imprimir_lista (listp);
		//inicializamos
		nodo_lista := listp;
		WRITELN('- CONTENT OF LIST ON MODE RECURSIVE -');
		READKEY;
		imprimir_list_prin_rec (nodo_lista);
		WRITELN('Delete nodes with 1 aparition...');
		READKEY;
		abrir_fich_en_modo_rw ('fich_output2.txt', fdest, es_correcto);
		WRITELN('- LIST OF WORDS DELETED -');
		//inicializamos
		nodo_lista := listp;
		REPEAT
		BEGIN
			eliminar_palabras_q_apar_una_vez (nodo_lista^.palabra, fdest);
			//si el nodo no contiene palabras... lo eliminamos
			IF (nodo_lista^.palabra = NIL) THEN
			BEGIN
			encontrado := false;
			devolver_ptr_nodo_buscand_por_tam_si_existe (listp, nodo_ptr, MINW, (nodo_lista^.size - 1), encontrado);
			IF encontrado THEN
				nodo_ptr^.psiguiente := nodo_lista^.psiguiente
			ELSE //significa que el el primero de la lista principal
				listp := listp^.psiguiente;
			END;
				nodo_lista := nodo_lista^.psiguiente;
		END
		UNTIL (nodo_lista = NIL);
		WRITELN('End of delete nodes... printing new list...');
		CLOSE(fdest);
		nodo_lista := listp;
		imprimir_list_prin_rec (nodo_lista);
END;
PROCEDURE inicializar_nodo_lista(VAR nodo_lista:tnodolistp; palabra:STRING);
BEGIN
	NEW(nodo_lista);
	NEW(nodo_lista^.palabra);
	nodo_lista^.palabra^.palabra := palabra;
	nodo_lista^.palabra^.napariciones := 1;
	nodo_lista^.palabra^.psiguiente := NIL;
	nodo_lista^.size := LENGTH(palabra);
END;
PROCEDURE cargar_lista(VAR listp:tlistp;VAR fich_ori:tficht);
VAR
	nodo_lista:tnodolistp;
	car:CHAR;
	palabra:STRING; 
BEGIN
		palabra := '';
		READ(fich_ori,car);
		WHILE(NOT(EOF(fich_ori))) DO
		BEGIN
			IF (car <> ':') THEN
				palabra := palabra + car
			ELSE
			BEGIN
				inicializar_nodo_lista(nodo_lista,palabra);
				insertar_palabra_en_lista (listp, nodo_lista, MINW);
				delete(palabra,1,LENGTH(palabra));
				END;
			READ(fich_ori,car);
		END;(*WHILE*)
		inicializar_nodo_lista(nodo_lista,palabra);
		insertar_palabra_en_lista (listp, nodo_lista, MINW);
END;
{------------------------------------------------------------------------------------------------------------------------------}
{main properly}
VAR
	
	listp:tlistp;
	fich_ori,fich_dest:tficht;
	tot_words:INTEGER;
	opcion:STRING;
	es_correcto:BOOLEAN;
	letra:CHAR;
BEGIN
menu1(opcion);
IF (opcion = '1') THEN
BEGIN
	preparar_para_cargar_lista(n_fich_dest,fich_ori,fich_dest,tot_words);
	abrir_fich_en_modo_lect ('fich_output.txt', fich_ori, es_correcto);
	IF (es_correcto) THEN
	BEGIN
		NEW(listp);
		listp^.size := 0;
		cargar_lista(listp,fich_ori);
		WRITELN('Volcate of dates complete... on principal list...');
		WRITELN('- CONTENT OF LIST AFTER VOLCATE OF DATES ON MODE SECUENCIAL -');
		imprimir_lista (listp);
		ordenar_eliminar_y_visualizar (listp);
		letra := #0;
		WRITE('Please tell me a letter to search the coincidence on list (example P):');
		READLN(letra);
		UPCASE(letra);
		buscar_palabras_por_letra_en_listp(listp,letra,tot_words);
		WRITELN('FINISH... BYE');
	END
	ELSE
	WRITELN('Incorrect system path to file font...');
	CLOSE(fich_ori)
END
ELSE IF (opcion = '2') THEN
	WRITELN('BYE...')
ELSE
	WRITELN('Error chossing the option... the program is shutdown');
	READKEY;
END.
