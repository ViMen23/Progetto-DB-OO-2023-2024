/*
package gui;

import controller.Controller;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.MatteBorder;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.ResourceBundle;
*/
/**
 * TYPE : class - gui package
 * NAME : UserSearchCompetitionPanel
 *
 * DESC: TODO
 */
/*
public class SearchPlayerBornNationPanel
				extends JPanel
{
	protected JLabel label;
	protected JComboBox<String> comboBox;

	protected String string;

	public SearchPlayerBornNationPanel(Controller controller)
	{
		setLayout(new GridBagLayout());

		GridBagConstraints gbc;


		string = GuiConfiguration.getMessage("continent");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputFont());

		gbc = new GridBagConstraints
						(

										0, 0,
										1, 1,
										0, 0,
										GridBagConstraints.LINE_START, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(10,0,10,30),
										0, 0
						);

		add(label, gbc);

		comboBox = new JComboBox<String>();
		comboBox.setFont(GuiConfiguration.getOutputFont());

		gbc = new GridBagConstraints
						(

										1, 0,
										1, 1,
										0, 0,
										GridBagConstraints.CENTER, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(10,0,10,0),
										0, 0
						);

		add(comboBox, gbc);

		string = GuiConfiguration.getMessage("nation");
		string = StringUtils.capitalize(string);
		label.setFont(GuiConfiguration.getOutputFont());

		gbc = new GridBagConstraints
						(

										0, 1,
										1, 1,
										0, 0,
										GridBagConstraints.LINE_START, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(0,0,20,30),
										0, 0
						);

		add(label, gbc);

		comboBox = new JComboBox<String>();
		comboBox.setFont(GuiConfiguration.getOutputFont());

		gbc = new GridBagConstraints
						(

										1, 1,
										1, 1,
										0, 0,
										GridBagConstraints.CENTER, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(0,0,20,0),
										0, 0
						);

		add(comboBox, gbc);

	}

}
*/