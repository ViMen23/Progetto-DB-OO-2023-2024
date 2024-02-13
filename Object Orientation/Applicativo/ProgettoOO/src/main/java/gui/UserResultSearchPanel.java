package gui;

import controller.Controller;

import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.MatteBorder;
import java.awt.*;
import java.util.HashMap;
import java.util.ResourceBundle;

public class UserResultSearchPanel
				extends JPanel
{
	protected JLabel label;
	protected JTable table;
	protected JScrollPane scrollPane;



	public static HashMap<String, String[]> columnsTable = new HashMap<String, String[]>();
	final static float outputFontSize = 22;
	final static float inputFontSize = 20;
	final static int columnNumber = 25;


	public UserResultSearchPanel(Controller controller, ResourceBundle currentLocale, String searchTable, Integer countSearch)
	{
		setLayout(new GridBagLayout());
		GridBagConstraints gbc;
		InitHashMap();

		Font outputFont = this.getFont().deriveFont(outputFontSize);
		Font inputFont = this.getFont().deriveFont(inputFontSize);
		Border labelBorder = new CompoundBorder(new EmptyBorder(4, 4, 4, 4),
			new MatteBorder(0, 0, 1, 0, Color.BLACK));

		//Intestazione risultati ricerca

		String tmp = currentLocale.getString("result") + " ";
		tmp += currentLocale.getString(searchTable) + " ";
		tmp += "- ";
		tmp += Integer.toString(countSearch) + " ";
		tmp += currentLocale.getString("countResult");

		label = new JLabel(tmp, SwingConstants.LEADING);
		label.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 3;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.anchor = GridBagConstraints.FIRST_LINE_START;
		gbc.weightx = 1.0;
		gbc.insets = new Insets(10, 0, 0, 0);

		add(label, gbc);

		//sottolineatura divisoria
		label = new JLabel();
		label.setBorder(labelBorder);
		label.setFont(outputFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.insets = new Insets(10, 0, 0, 0);

		add(label, gbc);

		Object[][] data =
						{
							{
								"Serie A",
								"FIGC",
								"Italia"
							},
							{
								"Premier League",
								"Confederazione inglese",
								"Inghilterra"
							},
							{
								"La liga",
								"Confederazione spagnola",
								"Spagna"
							},
							{
								"Bundesliga",
								"Confederazione tedesca",
								"Germania"
							},
							{
								"Ligue 1",
								"Confederazione Francese",
								"Francia"
							}
						};

		table = new JTable(new ResultSearchTableModel("competitions", data));
		//table.setPreferredScrollableViewportSize(table.getPreferredSize());
		table.setFillsViewportHeight(true);
		table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		scrollPane = new JScrollPane(table);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 0;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		gbc.insets = new Insets(10, 0, 0, 0);


		add(scrollPane, gbc);


		//setBackground(Color.GREEN);

	}


	public void InitHashMap()
	{
		String[] columnCompetition =
			{
				Main.currentLocale.getString("name"),
				Main.currentLocale.getString("confederation"),
				Main.currentLocale.getString("country")
			};

		columnsTable.put("competitions", columnCompetition);
	}


}
