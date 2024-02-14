package gui;

import controller.Controller;
import org.apache.commons.lang3.StringUtils;

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
	protected JLabel label;
	protected JTable table;
	protected JScrollPane scrollPane;
	protected String tmp;

	protected JPanel panelTeam;
	protected JPanel panelPlayer;


	public CompetitionEditionTrophyPanel(Controller controller, ResourceBundle currentLocale)
	{
		setLayout(new GridBagLayout());

		Font outputBoldFont = this.getFont().deriveFont(Font.BOLD);

		panelTeam = new JPanel(new GridBagLayout());
		panelTeam.setBackground(Color.white);

		GridBagConstraints gbc;
		Border labelBorder = new CompoundBorder(new EmptyBorder(4, 4, 4, 4),
			new MatteBorder(0, 0, 1, 0, Color.BLACK));


		//Trofei edition
		tmp = currentLocale.getString("teamTrophies")+ " ";
		tmp += "Serie A 2022-2023";

		label = new JLabel(tmp.toUpperCase(), SwingConstants.LEADING);
		label.setFont(outputBoldFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.weightx = 1.0;
		gbc.insets = new Insets(10, 0, 0, 0);

		panelTeam.add(label, gbc);

		//separatore

		label = new JLabel();
		label.setBorder(labelBorder);


		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.insets = new Insets(0, 0, 0, 0);

		panelTeam.add(label, gbc);


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
				}
			};

		table = new JTable(new ResultSearchTableModel("teamTrophy", data));

		table.setPreferredScrollableViewportSize(new Dimension(50, 150));
		table.setRowHeight(25);
		table.setFillsViewportHeight(true);
		table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		// scroll per la tabella
		scrollPane = new JScrollPane(table);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.insets = new Insets(10, 0, 0, 0);

		panelTeam.add(scrollPane, gbc);


		//Panel trofei giocatore
		panelPlayer = new JPanel(new GridBagLayout());

		//Trofei giocatore edition

		tmp = StringUtils.capitalize(currentLocale.getString("playerTrophies")) + " ";
		tmp += "Serie A 2022-2023";

		label = new JLabel(tmp.toUpperCase(), SwingConstants.LEADING);
		label.setFont(outputBoldFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.weightx = 1.0;
		gbc.insets = new Insets(10,0, 0, 0);

		panelPlayer.add(label, gbc);

		//separatore

		label = new JLabel();
		label.setBorder(labelBorder);


		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.insets = new Insets(0, 0, 0, 0);

		panelPlayer.add(label, gbc);

		data = new Object[][]
			{
				{
					"bestPlayer",
					"Osimhen",
					"SSC NAPOLI"
				},
				{
					"bestStriker",
					"Osimhen",
					"SSC NAPOLI"
				},
				{
					"bestMidfielder",
					"Osimhen",
					"SSC NAPOLI"
				},
				{
					"bestDefender",
					"Osimhen",
					"SSC NAPOLI"
				},
				{
					"bestGoalkeeper",
					"Osimhen",
					"SSC NAPOLI"
				},
				{
					"bestGoal",
					"Osimhen",
					"SSC NAPOLI"
				}
			};

		table = new JTable(new ResultSearchTableModel("playerTrophy", data));

		table.setPreferredScrollableViewportSize(new Dimension(50, 150));
		table.setRowHeight(25);
		table.setFillsViewportHeight(true);
		table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		// scroll per la tabella
		scrollPane = new JScrollPane(table);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.insets = new Insets(10, 0, 0, 0);

		panelPlayer.add(scrollPane, gbc);


		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.weightx = 0.4;
		gbc.insets = new Insets(0, 0, 0, 0);

		add(panelTeam, gbc);

		gbc = new GridBagConstraints();
		gbc.gridwidth= 1;
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.weightx = 0.6;
		gbc.insets = new Insets(0, 10, 0, 0);

		panelPlayer.setBackground(Color.white);

		add(panelPlayer, gbc);

	}
}
