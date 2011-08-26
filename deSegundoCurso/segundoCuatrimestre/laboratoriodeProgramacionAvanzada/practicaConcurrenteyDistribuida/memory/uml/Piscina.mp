input metauml;
beginfig(1);
Class.A("Piscina")
        ("+varPiscina: ArrayList<PlantillaDeportista>")
        ("+Piscina(): void",
	 "+synchronized imprimirPiscina(): String",
         "+synchronized monitorPiscina(PlantillaDeportista pDeportista): void",
         "+synchronized productorPiscina(PlantillaDeportista pDeportista): void");
drawObject(A);
endfig;
end