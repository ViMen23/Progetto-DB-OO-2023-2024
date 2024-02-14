package gui;

import controller.Controller;

import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.MatteBorder;
import java.awt.*;
import java.util.ResourceBundle;

public class CompetitionEditionTrophyPanel
				extends JPanel
{
	JLabel label;
	JTable table;
	JScrollPane scrollPane;

	final static float outputFontSize = 15;

	public CompetitionEditionTrophyPanel(Controller controller, ResourceBundle currentLocale)
	{
		setLayout(new GridBagLayout());

		setBackground(Color.white);

		Font outputFont = this.getFont().deriveFont(outputFontSize);
		Font outputBoldFont = outputFont.deriveFont(Font.BOLD);

		GridBagConstraints gbc;
		Border labelBorder = new CompoundBorder(new EmptyBorder(4, 4, 4, 4),
			new MatteBorder(0, 0, 1, 0, Color.BLACK));


		//Trofei edition

		String tmp = currentLocale.getString("teamTrophy") + " ";
		tmp += "22-23";
		label = new JLabel(tmp, SwingConstants.LEADING);
		label.setFont(outputBoldFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.weightx = 0.4;
		gbc.insets = new Insets(10, 0, 0, 0);

		add(label, gbc);

		//separatore

		label = new JLabel();
		label.setBorder(labelBorder);


		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.insets = new Insets(10, 0, 0, 0);

		add(label, gbc);

		Object data[][] = new Object[][]
			{
				{
					"firstPlace",
					"SSC NAPOLI"
				},
				{
					"secondPlace",
					"SSC NAPOLI"
				},
				{
					"thirdPlace",
					"SSC NAPOLI"
				},
				{
					"firstPlace",
					"SSC NAPOLI"
				},
				{
					"secondPlace",
					"SSC NAPOLI"
				},
				{
					"thirdPlace",
					"SSC NAPOLI"
				},
				{
					"firstPlace",
					"SSC NAPOLI"
				},
				{
					"secondPlace",
					"SSC NAPOLI"
				},
				{
					"thirdPlace",
					"SSC NAPOLI"
				},
				{
					"firstPlace",
					"SSC NAPOLI"
				},
				{
					"secondPlace",
					"SSC NAPOLI"
				},
				{
					"thirdPlace",
					"SSC NAPOLI"
				},
				{
					"firstPlace",
					"SSC NAPOLI"
				},
				{
					"secondPlace",
					"SSC NAPOLI"
				},
				{
					"thirdPlace",
					"SSC NAPOLI"
				},
				{
					"firstPlace",
					"SSC NAPOLI"
				},
				{
					"secondPlace",
					"SSC NAPOLI"
				},
				{
					"thirdPlace",
					"SSC NAPOLI"
				},
				{
					"firstPlace",
					"SSC NAPOLI"
				},
				{
					"secondPlace",
					"SSC NAPOLI"
				},
				{
					"thirdPlace",
					"SSC NAPOLI"
				},
				{
					"firstPlace",
					"SSC NAPOLI"
				},
				{
					"secondPlace",
					"SSC NAPOLI"
				},
				{
					"thirdPlace",
					"SSC NAPOLI"
				},
				{
					"firstPlace",
					"SSC NAPOLI"
				},
				{
					"secondPlace",
					"SSC NAPOLI"
				},
				{
					"thirdPlace",
					"SSC NAPOLI"
				},
				{
					"firstPlace",
					"SSC NAPOLI"
				},
				{
					"secondPlace",
					"SSC NAPOLI"
				},
				{
					"thirdPlace",
					"SSC NAPOLI"
				},
				{
					"firstPlace",
					"SSC NAPOLI"
				},
				{
					"secondPlace",
					"SSC NAPOLI"
				},
				{
					"thirdPlace",
					"SSC NAPOLI"
				},
				{
					"firstPlace",
					"SSC NAPOLI"
				},
				{
					"secondPlace",
					"SSC NAPOLI"
				},
				{
					"thirdPlace",
					"SSC NAPOLI"
				}
			};

		table = new JTable(new ResultSearchTableModel("teamTrophy", data));

		table.setFont(outputFont);
		table.getTableHeader().setFont(outputFont);

		table.setPreferredScrollableViewportSize(new Dimension(50, 100));
		table.setFillsViewportHeight(true);
		table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		// scroll per la tabella
		scrollPane = new JScrollPane(table);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.anchor = GridBagConstraints.FIRST_LINE_START;
		gbc.insets = new Insets(10, 0, 0, 0);

		add(scrollPane, gbc);


		//Trofei giocatore edition

		tmp = currentLocale.getString("playerTrophy") + " ";
		tmp += "22-23";
		label = new JLabel(tmp, SwingConstants.LEADING);
		label.setFont(outputBoldFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.weightx = 0.6;
		gbc.insets = new Insets(10, 0, 0, 0);

		add(label, gbc);

		//separatore

		label = new JLabel();
		label.setBorder(labelBorder);


		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 1;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.insets = new Insets(10, 0, 0, 0);

		add(label, gbc);

		data = new Object[][]
			{
				{
					"bestPlayer",
					"SSC NAPOLI",
					"Osimhen"
				},
				{
					"bestStriker",
					"SSC NAPOLI",
					"Osimhen"
				},
				{
					"bestMidfielder",
					"SSC NAPOLI",
					"Osimhen"
				},
				{
					"bestDefender",
					"SSC NAPOLI",
					"Osimhen"
				},
				{
					"bestGoalkeeper",
					"SSC NAPOLI",
					"Osimhen"
				},
				{
					"bestGoal",
					"SSC NAPOLI",
					"Osimhen"
				}
			};

		table = new JTable(new ResultSearchTableModel("playerTrophy", data));

		table.setFont(outputFont);
		table.getTableHeader().setFont(outputFont);

		table.setPreferredScrollableViewportSize(new Dimension(50, 100));
		table.setFillsViewportHeight(true);
		table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		// scroll per la tabella
		scrollPane = new JScrollPane(table);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 2;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.insets = new Insets(10, 0, 0, 0);

		add(scrollPane, gbc);

	}
}
