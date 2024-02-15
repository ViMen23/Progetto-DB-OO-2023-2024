package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;

public class test
{
	JPanel panel;

	public test()
	{
		panel = new JPanel();
		panel.setLayout(new MigLayout());

		panel.add(new JButton("ciao"), "wrap");
		panel.add(new JButton("ciao1"));
	}
}
