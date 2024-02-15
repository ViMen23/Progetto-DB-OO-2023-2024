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


/**
 * TYPE : class - gui package
 * NAME : ChoosePanel
 *
 * DESC: Pannello per costruire un'interfaccia con nome campo da scegliere
 * 			 e lista di elementi tra cui scegliere
 */
public class ChoosePanel
				extends JPanel
				implements ActionListener, CaretListener, ItemListener
{
	protected JLabel label;
	protected JComboBox<String> comboBox;

	protected Font font;

	public ChoosePanel(Controller controller, String toChoose)
	{
		setLayout(new GridBagLayout());

		font = (Font) UIManager.get("defaultFont");

		GridBagConstraints gbc;

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Nome campo da scegliere
		 */
		label = new JLabel(toChoose, SwingConstants.LEADING);
		label.setFont(font);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.insets = new Insets(10, 0, 20, 30);
		gbc.anchor = GridBagConstraints.LINE_START;

		add(label, gbc);
		/*------------------------------------------------------------------------------------------------------*/

		//////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		 * Lista elementi da cui scegliere
		 */
		comboBox = new JComboBox<String>();
		comboBox.setFont(font);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.insets = new Insets(10, 0, 20, 0);

		add(comboBox, gbc);
		/*------------------------------------------------------------------------------------------------------*/
	}

	@Override
	public void actionPerformed(ActionEvent e)
	{

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
