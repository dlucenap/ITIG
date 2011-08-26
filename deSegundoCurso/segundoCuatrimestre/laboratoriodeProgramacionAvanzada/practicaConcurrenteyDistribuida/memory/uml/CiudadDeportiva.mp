input metauml;
beginfig(1);
Class.A("CiudadDeportiva")
        ("+arrayHilos: ArrayList<Deportista>",
	 "+piscina: Piscina",
	 "+campodegolf: CampoGolf",
	 "+pistadetenis: PistaTenis",
	 "+saladeMusculacion: SalaMusculacion")
        ("+CiudadDeportiva(): void",
	 "+jButtonDetenerActionPerformed(java.awt.event.ActionEvent evt):void",
         "+jButtonReanudarActionPerformed(java.awt.event.ActionEvent evt):void",
         "+static main(String args[]): void",
	 "+run(): void");
drawObject(A);
endfig;
end