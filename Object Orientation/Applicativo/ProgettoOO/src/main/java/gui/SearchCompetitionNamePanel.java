
package gui;

import controller.Controller;

import javax.swing.*;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.ResourceBundle;

import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

/**
 * TYPE : class - gui package
 * NAME : UserSearchCompetitionPanel
 *
 * DESC: TODO
 */

public class SearchCompetitionNamePanel
				extends JPanel
				implements ActionListener, CaretListener, ItemListener
{

	protected JLabel label;
	protected JTextField textField;


	public SearchCompetitionNamePanel()
	{
		MigLayout migLayout;
		String string;

		migLayout = new MigLayout
			(
				"debug, flowx",
				"[]30[]",
				"10[]20"
			);

		setLayout(migLayout);


		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo nome: stampa
		 */

		string = GuiConfiguration.getMessage("name");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		add(label);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Campo nome: textfield
		 */

		textField = new JTextField(GuiConfiguration.getInputColumn());

		add(textField);
		/*------------------------------------------------------------------------------------------------------*/
	}

	@Override
	public void actionPerformed(ActionEvent e)
	{
		/*
		if (e.getActionCommand() == "search"){
			JPanel resultPanel = new UserResultSearchPanel(Controller.getControllerInstance(), Main.currentLocale, "competitions", 5);
			JOptionPane.showMessageDialog(null, resultPanel);
		}

		 */
	}

	@Override
	public void itemStateChanged(ItemEvent e)
	{

	}

	@Override
	public void caretUpdate(CaretEvent e)
	{

	}

}
