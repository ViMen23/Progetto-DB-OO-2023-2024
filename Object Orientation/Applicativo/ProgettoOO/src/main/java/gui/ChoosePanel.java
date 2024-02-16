/*
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
*/

/**
 * TYPE : class - gui package
 * NAME : ChoosePanel
 *
 * DESC: Pannello per costruire un'interfaccia con nome campo da scegliere
 * 			 e lista di elementi tra cui scegliere
 */
/*
public class ChoosePanel
				extends JPanel
{
	protected JLabel label;
	protected JComboBox<String> comboBox;

	public ChoosePanel(Controller controller, String toChoose)
	{
		setLayout(new GridBagLayout());

		GridBagConstraints gbc;


		label = new JLabel(toChoose, SwingConstants.LEADING);
		label.setFont(GuiConfiguration.getOutputFont());

		gbc = new GridBagConstraints
						(

										0, 0,
										1, 1,
										0, 0,
										GridBagConstraints.LINE_START, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(10,0,20,30),
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
										GridBagConstraints.LINE_START, // anchor
										GridBagConstraints.NONE, // fill
										new Insets(10,0,20,0),
										0, 0
						);

		add(comboBox, gbc);

	}

}
*/