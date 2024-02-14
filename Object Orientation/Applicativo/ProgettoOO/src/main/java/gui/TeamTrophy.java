package gui;

import controller.Controller;
import model.Team;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.MatteBorder;
import java.awt.*;
import java.util.HashMap;
import java.util.ResourceBundle;

public class TeamTrophy
				extends JPanel
{

	protected JLabel label;
	protected JPanel panelSquad;
	protected JPanel panelParticipation;
	protected JPanel panelAward;
	protected JPanel panelTrophy;
	protected JPanel panelPrize;
	protected JTable table;
	protected JScrollPane scrollPane;
	protected JButton button;


	protected String tmp;



	public TeamTrophy(Controller controller, ResourceBundle currentLocale)
	{
		setLayout(new GridBagLayout());

		Font outputBoldFont = this.getFont().deriveFont(Font.BOLD);


		panelSquad = new JPanel(new GridBagLayout());
		panelSquad.setBackground(Color.white);

		GridBagConstraints gbc;
		Border labelBorder = new CompoundBorder(new EmptyBorder(4, 4, 4, 4),
			new MatteBorder(0, 0, 1, 0, Color.BLACK));


		tmp = currentLocale.getString("squad").toUpperCase()+ " ";
		tmp += "SCC Napoli ";
		tmp += currentLocale.getString("season").toUpperCase() + " ";
		tmp += "2022-2023";

		label = new JLabel(tmp, SwingConstants.LEADING);
		label.setFont(outputBoldFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.weightx = 1.0;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(10, 10, 0, 0);

		panelSquad.add(label,gbc);

		//separatore

		label = new JLabel();
		label.setBorder(labelBorder);


		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.insets = new Insets(0, 0, 0, 0);

		panelSquad.add(label, gbc);

		Object data[][] = new Object[][]
			{
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				},
				{
					"Alex",
					"Meret",
					"Portiere",
					"Portiere"
				}
			};

		//tabella rosa
		table = new JTable(new ResultSearchTableModel("squad", data));

		table.setPreferredScrollableViewportSize(new Dimension(50, 550));
		table.setRowHeight(25);
		table.setFillsViewportHeight(true);
		table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		// scroll per la tabella
		scrollPane = new JScrollPane(table);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.weighty = 1.0;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.insets = new Insets(10, 0, 0, 0);

		panelSquad.add(scrollPane, gbc);


		// panel partecipazione
		panelParticipation = new JPanel(new GridBagLayout());
		panelParticipation.setBackground(Color.white);

		// label trofei squadra
		tmp = currentLocale.getString("participations").toUpperCase()+ " ";
		tmp += "SCC Napoli ";
		tmp += currentLocale.getString("season").toUpperCase() + " ";
		tmp += "2022-2023";

		label = new JLabel(tmp, SwingConstants.LEADING);
		label.setFont(outputBoldFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.weightx = 1.0;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(10, 10, 0, 0);

		panelParticipation.add(label,gbc);

		//separatore

		label = new JLabel();
		label.setBorder(labelBorder);


		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.insets = new Insets(0, 0, 0, 0);

		panelParticipation.add(label, gbc);

		data = new Object[][]
			{
				{
					"Serie A",
				},
				{
					"Champhions League",
				},
				{
					"Coppa Italia",
				},
				{
					"Supercoppa Italiana",
				}
			};


		//tabella partecipazioni
		table = new JTable(new ResultSearchTableModel("competitionParticipation", data));

		table.setPreferredScrollableViewportSize(new Dimension(50, 100));
		table.setRowHeight(25);
		table.setFillsViewportHeight(true);
		table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		//scroll per la tabella

		scrollPane = new JScrollPane(table);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.insets = new Insets(10, 0, 0, 0);

		panelParticipation.add(scrollPane, gbc);


		// panel trofeo
		panelTrophy = new JPanel(new GridBagLayout());
		panelTrophy.setBackground(Color.white);


		// label trofei squadra
		tmp = currentLocale.getString("trophies").toUpperCase()+ " ";
		tmp += "SCC Napoli ";
		tmp += currentLocale.getString("season").toUpperCase() + " ";
		tmp += "2022-2023";

		label = new JLabel(tmp, SwingConstants.LEADING);
		label.setFont(outputBoldFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.weightx = 1.0;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(10, 10, 0, 0);

		panelTrophy.add(label,gbc);

		//separatore

		label = new JLabel();
		label.setBorder(labelBorder);


		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.insets = new Insets(0, 0, 0, 0);

		panelTrophy.add(label, gbc);


		data = new Object[][]
			{
				{
					"Primo Posto",
					"Serie A",
				},
				{
					"Primo Posto",
					"Serie A",
				},
				{
					"Primo Posto",
					"Serie A",
				},
				{
					"Primo Posto",
					"Serie A",
				}
			};

		//tabella trofei squadra
		table = new JTable(new ResultSearchTableModel("trophyTeam", data));

		table.setPreferredScrollableViewportSize(new Dimension(50, 100));
		table.setRowHeight(25);
		table.setFillsViewportHeight(true);
		table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		// scroll per la tabella
		scrollPane = new JScrollPane(table);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 3;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.insets = new Insets(10, 0, 0, 0);

		panelTrophy.add(scrollPane, gbc);

		//pannello premi
		panelPrize = new JPanel(new GridBagLayout());
		panelPrize.setBackground(Color.white);

		// label trofei squadra
		tmp = currentLocale.getString("prizes").toUpperCase()+ " ";
		tmp += "SCC Napoli ";
		tmp += currentLocale.getString("season").toUpperCase() + " ";
		tmp += "2022-2023";

		label = new JLabel(tmp, SwingConstants.LEADING);
		label.setFont(outputBoldFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.weightx = 1.0;
		gbc.anchor = GridBagConstraints.LINE_START;
		gbc.insets = new Insets(10, 10, 0, 0);

		panelPrize.add(label,gbc);

		//separatore

		label = new JLabel();
		label.setBorder(labelBorder);


		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.insets = new Insets(0, 0, 0, 0);

		panelPrize.add(label, gbc);


		data = new Object[][]
			{
				{
					"Targa Europa",
				},
			};


		//tabella premi squadra
		table = new JTable(new ResultSearchTableModel("prizeTeam", data));

		table.setPreferredScrollableViewportSize(new Dimension(50, 30));
		table.setRowHeight(25);
		table.setFillsViewportHeight(true);
		table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		// scroll per la tabella
		scrollPane = new JScrollPane(table);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridheight = 3;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.insets = new Insets(10, 0, 0, 0);

		panelPrize.add(scrollPane, gbc);

		tmp = StringUtils.capitalize(currentLocale.getString("go")) + " ";
		tmp += currentLocale.getString("to") + " ";
		tmp += StringUtils.capitalize(currentLocale.getString("case"));

		button = new JButton(tmp);
		button.setActionCommand("case");
		button.setCursor(new Cursor(Cursor.HAND_CURSOR));


		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 5;
		gbc.anchor = GridBagConstraints.LINE_END;
		gbc.insets = new Insets(30, 0, 0, 0);

		panelPrize.add(button, gbc);


		//aggiunta al pannello principale

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridheight = 4;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.weightx = 0.6;
		gbc.weighty = 1.0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.insets = new Insets(10, 0, 0, 10);



		add(panelSquad, gbc);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.weightx = 0.2;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.insets = new Insets(10, 0, 0, 0);

		add(panelParticipation, gbc);


		panelAward = new JPanel(new GridBagLayout());
		panelAward.setBackground(Color.white);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.weightx = 0.8;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.insets = new Insets(0, 0, 0, 0);



		panelAward.add(panelTrophy, gbc);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.weightx = 0.2;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.insets = new Insets(30, 0, 0, 0);



		panelAward.add(panelPrize, gbc);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 1;
		gbc.weightx = 0.2;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.insets = new Insets(50, 0, 0, 0);


		add(panelAward, gbc);




	}


}
