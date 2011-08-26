package ciudaddeportiva;

/*
 *
 * @author Diego Antonio Lucena Pumar (dlucenap).
 * (C) 2010 para Diego Antonio Lucena Pumar.
 * License:
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */
import java.util.*;
import java.rmi.*;

public class CiudadDeportiva extends javax.swing.JFrame {

    static ArrayList<Deportista> arrayHilos;

    //Constructor
    public CiudadDeportiva() {
        initComponents();
    }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabelLogo = new javax.swing.JLabel();
        jLabelPistadeTenis = new javax.swing.JLabel();
        jLabelCampodeGolf = new javax.swing.JLabel();
        jLabelSaladeMusculacion = new javax.swing.JLabel();
        jLabelPiscina = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTextPistadeTenis = new javax.swing.JTextArea();
        jScrollPane2 = new javax.swing.JScrollPane();
        JTextColaPistadeTenis = new javax.swing.JTextArea();
        jScrollPane3 = new javax.swing.JScrollPane();
        JTextHoyo1 = new javax.swing.JTextArea();
        jScrollPane4 = new javax.swing.JScrollPane();
        jScrollPane5 = new javax.swing.JScrollPane();
        jTextPiscina = new javax.swing.JTextArea();
        jScrollPane7 = new javax.swing.JScrollPane();
        jTextSaladeMusculacion = new javax.swing.JTextArea();
        jScrollPane8 = new javax.swing.JScrollPane();
        JTextColaSaladeMusculacion = new javax.swing.JTextArea();
        jButtonDetener = new javax.swing.JButton();
        jButtonReanudar = new javax.swing.JButton();
        jScrollPane6 = new javax.swing.JScrollPane();
        JTextFinal = new javax.swing.JTextArea();
        jLabelFinaldeHilos = new javax.swing.JLabel();
        jScrollPane9 = new javax.swing.JScrollPane();
        JTextHoyo2 = new javax.swing.JTextArea();
        jScrollPane10 = new javax.swing.JScrollPane();
        JTextHoyo3 = new javax.swing.JTextArea();
        jScrollPane11 = new javax.swing.JScrollPane();
        JTextHoyo4 = new javax.swing.JTextArea();
        jLabelenPistadeTenis = new javax.swing.JLabel();
        jLabelenPiscina = new javax.swing.JLabel();
        jLabelColaPistadeTenis = new javax.swing.JLabel();
        jLabelColaSaladeMusculacion = new javax.swing.JLabel();
        jLabelHoyo1 = new javax.swing.JLabel();
        jLabelHoyo2 = new javax.swing.JLabel();
        jLabelHoyo3 = new javax.swing.JLabel();
        jLabelHoyo4 = new javax.swing.JLabel();
        jLabelColaCampodeGolf = new javax.swing.JLabel();
        jLabelenSaladeMusculacion = new javax.swing.JLabel();
        jLabelEstadoSala = new javax.swing.JLabel();
        JTextColaCampodeGolf = new javax.swing.JTextArea();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jLabelLogo.setFont(new java.awt.Font("Dialog", 1, 48));
        jLabelLogo.setText("Ciudad Deportiva");

        jLabelPistadeTenis.setFont(new java.awt.Font("Tahoma", 1, 18));
        jLabelPistadeTenis.setText("Pista de Tenis");

        jLabelCampodeGolf.setFont(new java.awt.Font("Tahoma", 1, 18));
        jLabelCampodeGolf.setText("Campo de Golf");

        jLabelSaladeMusculacion.setFont(new java.awt.Font("Tahoma", 1, 18));
        jLabelSaladeMusculacion.setText("Sala de Musculación");

        jLabelPiscina.setFont(new java.awt.Font("Tahoma", 1, 18));
        jLabelPiscina.setText("Piscina");

        jTextPistadeTenis.setColumns(20);
        jTextPistadeTenis.setEditable(false);
        jTextPistadeTenis.setRows(5);
        jScrollPane1.setViewportView(jTextPistadeTenis);

        JTextColaPistadeTenis.setColumns(20);
        JTextColaPistadeTenis.setEditable(false);
        JTextColaPistadeTenis.setRows(5);
        jScrollPane2.setViewportView(JTextColaPistadeTenis);

        JTextHoyo1.setColumns(20);
        JTextHoyo1.setEditable(false);
        JTextHoyo1.setRows(5);
        JTextHoyo1.setAutoscrolls(false);
        jScrollPane3.setViewportView(JTextHoyo1);

        jTextPiscina.setColumns(20);
        jTextPiscina.setEditable(false);
        jTextPiscina.setRows(5);
        jScrollPane5.setViewportView(jTextPiscina);

        jTextSaladeMusculacion.setColumns(20);
        jTextSaladeMusculacion.setEditable(false);
        jTextSaladeMusculacion.setRows(5);
        jScrollPane7.setViewportView(jTextSaladeMusculacion);

        JTextColaSaladeMusculacion.setColumns(20);
        JTextColaSaladeMusculacion.setEditable(false);
        JTextColaSaladeMusculacion.setRows(5);
        jScrollPane8.setViewportView(JTextColaSaladeMusculacion);

        jButtonDetener.setText("DETENER");
        jButtonDetener.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonDetenerActionPerformed(evt);
            }
        });

        jButtonReanudar.setText("REANUDAR");
        jButtonReanudar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButtonReanudarActionPerformed(evt);
            }
        });

        JTextFinal.setColumns(20);
        JTextFinal.setRows(5);
        jScrollPane6.setViewportView(JTextFinal);

        jLabelFinaldeHilos.setFont(new java.awt.Font("Tahoma", 0, 14));
        jLabelFinaldeHilos.setText("Hilos que terminan...");

        JTextHoyo2.setColumns(20);
        JTextHoyo2.setEditable(false);
        JTextHoyo2.setRows(5);
        JTextHoyo2.setAutoscrolls(false);
        jScrollPane9.setViewportView(JTextHoyo2);

        JTextHoyo3.setColumns(20);
        JTextHoyo3.setEditable(false);
        JTextHoyo3.setRows(5);
        JTextHoyo3.setAutoscrolls(false);
        jScrollPane10.setViewportView(JTextHoyo3);

        JTextHoyo4.setColumns(20);
        JTextHoyo4.setEditable(false);
        JTextHoyo4.setRows(5);
        jScrollPane11.setViewportView(JTextHoyo4);

        jLabelenPistadeTenis.setFont(new java.awt.Font("Tahoma", 0, 14));
        jLabelenPistadeTenis.setText("Deportistas en Sala:");

        jLabelenPiscina.setFont(new java.awt.Font("Tahoma", 0, 14));
        jLabelenPiscina.setText("Deportistas en Sala:");

        jLabelColaPistadeTenis.setFont(new java.awt.Font("Tahoma", 0, 14));
        jLabelColaPistadeTenis.setText("Deportistas en Cola:");

        jLabelColaSaladeMusculacion.setFont(new java.awt.Font("Tahoma", 0, 14));
        jLabelColaSaladeMusculacion.setText("Deportistas en Cola:");

        jLabelHoyo1.setText("Hoyo 1");

        jLabelHoyo2.setText("Hoyo 2");

        jLabelHoyo3.setText("Hoyo 3");

        jLabelHoyo4.setText("Hoyo 4");

        jLabelColaCampodeGolf.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
        jLabelColaCampodeGolf.setText("Deportistas en Cola:");

        jLabelenSaladeMusculacion.setFont(new java.awt.Font("Tahoma", 0, 14));
        jLabelenSaladeMusculacion.setText("Deportistas en Sala:");

        JTextColaCampodeGolf.setColumns(20);
        JTextColaCampodeGolf.setEditable(false);
        JTextColaCampodeGolf.setRows(5);
        JTextColaCampodeGolf.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addComponent(jLabelLogo, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 481, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addGroup(layout.createSequentialGroup()
                                        .addGap(427, 427, 427)
                                        .addComponent(jScrollPane4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGap(29, 29, 29)))
                                .addGap(248, 248, 248))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabelSaladeMusculacion)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 472, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabelEstadoSala, javax.swing.GroupLayout.DEFAULT_SIZE, 571, Short.MAX_VALUE)
                                .addGap(176, 176, 176))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addComponent(jLabelenPistadeTenis, javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabelPistadeTenis, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 169, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 509, Short.MAX_VALUE))
                            .addComponent(jLabelenSaladeMusculacion)
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addComponent(jScrollPane7, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 678, Short.MAX_VALUE)
                                    .addComponent(jScrollPane1, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 678, Short.MAX_VALUE)
                                    .addComponent(jLabelPiscina, javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabelenPiscina, javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jScrollPane5, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 678, Short.MAX_VALUE))
                                .addGap(69, 69, 69))
                            .addComponent(jLabelCampodeGolf))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabelHoyo1))
                        .addGap(24, 24, 24)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jScrollPane9, javax.swing.GroupLayout.PREFERRED_SIZE, 98, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabelHoyo2))
                        .addGap(31, 31, 31)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jScrollPane10, javax.swing.GroupLayout.PREFERRED_SIZE, 101, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabelHoyo3))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabelHoyo4)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 168, Short.MAX_VALUE)
                                .addComponent(jLabelColaCampodeGolf))
                            .addComponent(jScrollPane11, javax.swing.GroupLayout.PREFERRED_SIZE, 102, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)))
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(JTextColaCampodeGolf, javax.swing.GroupLayout.DEFAULT_SIZE, 349, Short.MAX_VALUE)
                    .addComponent(jScrollPane8, javax.swing.GroupLayout.DEFAULT_SIZE, 349, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jButtonReanudar, javax.swing.GroupLayout.PREFERRED_SIZE, 161, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jButtonDetener, javax.swing.GroupLayout.DEFAULT_SIZE, 170, Short.MAX_VALUE))
                    .addComponent(jLabelColaPistadeTenis)
                    .addComponent(jLabelColaSaladeMusculacion)
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 349, Short.MAX_VALUE)
                    .addComponent(jLabelFinaldeHilos)
                    .addComponent(jScrollPane6, javax.swing.GroupLayout.PREFERRED_SIZE, 83, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jLabelLogo, javax.swing.GroupLayout.PREFERRED_SIZE, 67, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(18, 18, 18)
                        .addComponent(jLabelPiscina))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(43, 43, 43)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jButtonReanudar, javax.swing.GroupLayout.PREFERRED_SIZE, 79, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jButtonDetener, javax.swing.GroupLayout.PREFERRED_SIZE, 81, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addGap(12, 12, 12)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabelenPiscina)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jScrollPane5, javax.swing.GroupLayout.PREFERRED_SIZE, 78, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabelFinaldeHilos)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jScrollPane6, javax.swing.GroupLayout.PREFERRED_SIZE, 48, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(33, 33, 33)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabelenPistadeTenis, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabelColaPistadeTenis)))
                    .addComponent(jLabelPistadeTenis))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 38, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabelSaladeMusculacion)
                        .addGap(18, 18, 18)
                        .addComponent(jLabelEstadoSala, javax.swing.GroupLayout.PREFERRED_SIZE, 26, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 89, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(5, 5, 5)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabelenSaladeMusculacion, javax.swing.GroupLayout.PREFERRED_SIZE, 27, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabelColaSaladeMusculacion))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(jScrollPane8)
                    .addComponent(jScrollPane7, javax.swing.GroupLayout.DEFAULT_SIZE, 96, Short.MAX_VALUE))
                .addGap(6, 6, 6)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabelCampodeGolf)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(jLabelHoyo3)
                                        .addComponent(jLabelHoyo4)
                                        .addComponent(jLabelColaCampodeGolf, javax.swing.GroupLayout.PREFERRED_SIZE, 17, javax.swing.GroupLayout.PREFERRED_SIZE))
                                    .addComponent(jLabelHoyo2))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                                    .addComponent(jScrollPane9, 0, 0, Short.MAX_VALUE)
                                    .addComponent(jScrollPane10, 0, 0, Short.MAX_VALUE)
                                    .addComponent(jScrollPane11, javax.swing.GroupLayout.PREFERRED_SIZE, 48, javax.swing.GroupLayout.PREFERRED_SIZE)))
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabelHoyo1)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 48, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(jScrollPane4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(JTextColaCampodeGolf, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.PREFERRED_SIZE, 98, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap())
        );

        java.awt.Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
        setBounds((screenSize.width-1130)/2, (screenSize.height-716)/2, 1130, 716);
    }// </editor-fold>//GEN-END:initComponents

    //Bonton para detener procesos
    private void jButtonDetenerActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonDetenerActionPerformed
        for (int cont = 0; cont < 49; cont++) {
            arrayHilos.get(cont).detener();
        }
    }//GEN-LAST:event_jButtonDetenerActionPerformed

    //Boton para reanudar procesos
    private void jButtonReanudarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButtonReanudarActionPerformed
        for (int cont = 0; cont < 49; cont++) {
            arrayHilos.get(cont).reanudar();
        }
    }//GEN-LAST:event_jButtonReanudarActionPerformed
    static Piscina piscina;
    static CampoGolf campodeGolf;
    static PistaTenis pistadeTenis;
    static SalaMusculacion saladeMusculacion;

    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {

            public void run() {
                new CiudadDeportiva().setVisible(true);
                arrayHilos = new ArrayList();
                piscina = new Piscina();
                campodeGolf = new CampoGolf();
                pistadeTenis = new PistaTenis();
                saladeMusculacion = new SalaMusculacion();

                //Iniciamos hilos
                for (int cont = 51; cont <= 99; cont++) {
                    Deportista c = new Deportista(cont);
                    arrayHilos.add(c);
                }
                //Ejecutamos hilos
                for (int cont = 0; cont < 49; cont++) {
                    arrayHilos.get(cont).start();
                }

                //Iniciamos el Objeto Remoto en local
                try {
                    CiudadRMI datosCiudad = new CiudadRMI();
                    Naming.rebind("//127.0.0.1/ObjetoRMI", datosCiudad);
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }

            }
        }
        );
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    static javax.swing.JTextArea JTextColaCampodeGolf;
    static javax.swing.JTextArea JTextColaPistadeTenis;
    static javax.swing.JTextArea JTextColaSaladeMusculacion;
    static javax.swing.JTextArea JTextFinal;
    static javax.swing.JTextArea JTextHoyo1;
    static javax.swing.JTextArea JTextHoyo2;
    static javax.swing.JTextArea JTextHoyo3;
    static javax.swing.JTextArea JTextHoyo4;
    private javax.swing.JButton jButtonDetener;
    private javax.swing.JButton jButtonReanudar;
    private javax.swing.JLabel jLabelCampodeGolf;
    private javax.swing.JLabel jLabelColaCampodeGolf;
    private javax.swing.JLabel jLabelColaPistadeTenis;
    private javax.swing.JLabel jLabelColaSaladeMusculacion;
    public static javax.swing.JLabel jLabelEstadoSala;
    private javax.swing.JLabel jLabelFinaldeHilos;
    private javax.swing.JLabel jLabelHoyo1;
    private javax.swing.JLabel jLabelHoyo2;
    private javax.swing.JLabel jLabelHoyo3;
    private javax.swing.JLabel jLabelHoyo4;
    private javax.swing.JLabel jLabelLogo;
    private javax.swing.JLabel jLabelPiscina;
    private javax.swing.JLabel jLabelPistadeTenis;
    private javax.swing.JLabel jLabelSaladeMusculacion;
    private javax.swing.JLabel jLabelenPiscina;
    private javax.swing.JLabel jLabelenPistadeTenis;
    private javax.swing.JLabel jLabelenSaladeMusculacion;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane10;
    private javax.swing.JScrollPane jScrollPane11;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JScrollPane jScrollPane4;
    private javax.swing.JScrollPane jScrollPane5;
    private javax.swing.JScrollPane jScrollPane6;
    private javax.swing.JScrollPane jScrollPane7;
    private javax.swing.JScrollPane jScrollPane8;
    private javax.swing.JScrollPane jScrollPane9;
    static javax.swing.JTextArea jTextPiscina;
    static javax.swing.JTextArea jTextPistadeTenis;
    static javax.swing.JTextArea jTextSaladeMusculacion;
    // End of variables declaration//GEN-END:variables
}
