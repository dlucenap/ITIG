input metauml;
beginfig(1);
Class.A("PlantillaDeportista")
        ("-varIdentificador: int", 
         "-estadoDetenido: boolean")
        ("+Deportista(int pIdentificador): void",
	 "+detener(): void",
	 "+synchronized reanudar(): void",
	 "+pararEjecucion(): void",
	 "+run: void");
drawObject(A);
endfig;
end