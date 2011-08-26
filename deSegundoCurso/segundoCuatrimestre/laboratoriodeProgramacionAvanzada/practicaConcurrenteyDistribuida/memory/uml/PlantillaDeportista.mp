input metauml;
beginfig(1);
Class.A("PlantillaDeportista")
        ("-identificador: int")
        ("+PlantillaDeportista(int pIdentificador): void",
	 "+getIdentificador(): int",
	 "+setIdentificador(int pIdentificador): void");
drawObject(A);
endfig;
end
