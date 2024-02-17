
package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;
import javax.swing.*;
import java.awt.*;


public class SampleTable
				extends JPanel
{
	JLabel label;
	JTable table;
	JScrollPane scrollPane;

	public SampleTable(Controller controller, String title, String tableName)
	{

		MigLayout migLayout;

		migLayout = new MigLayout
			(
				"debug, flowy, fill",
				"[fill]",
				"10[]0[]10[]10"
			);

		setLayout(migLayout);
		setBackground(Color.white);

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo titolo:  stampa
		 */


		label = new JLabel(title, SwingConstants.CENTER);
		label.setFont(GuiConfiguration.getOutputBoldFont());

		add(label);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo separatore titolo:  bordo
		 */

		label = new JLabel();
		label.setBorder(GuiConfiguration.getLabelBorder());

		add(label);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo tabella:  table
		 */

		table = new JTable(new TableModel(tableName));

		table.setFillsViewportHeight(true);
		table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo barra di scorrimento:  jScrollPane
		 */

		scrollPane = new JScrollPane(table);

		add(scrollPane);
		/*------------------------------------------------------------------------------------------------------*/

	}
}
