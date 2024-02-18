
package gui;

import org.apache.commons.lang3.StringUtils;

import javax.swing.table.AbstractTableModel;
import java.util.HashMap;


public class TableModel extends AbstractTableModel
{

	private String[] columnNames;
	private Object[][] data;

	private static HashMap<String, Object[][]> hashMap = new HashMap<>();
	
	public TableModel(String tableName)
	{
		super();

		initData();

		if (tableName.equalsIgnoreCase("competitions")) {
			this.columnNames = new String[]
				{
					StringUtils.capitalize(GuiConfiguration.getMessage("name")),
					StringUtils.capitalize(GuiConfiguration.getMessage("confederation")),
					StringUtils.capitalize(GuiConfiguration.getMessage("country"))
				};
		}
		else if(tableName.equalsIgnoreCase("teamTrophy")) {
			this.columnNames = new String[]
				{
					StringUtils.capitalize(GuiConfiguration.getMessage("trophy")),
					StringUtils.capitalize(GuiConfiguration.getMessage("winner"))
				};
		}
		else if(tableName.equalsIgnoreCase("playerTrophy")) {
			this.columnNames = new String[]
				{
					StringUtils.capitalize(GuiConfiguration.getMessage("trophy")),
					StringUtils.capitalize(GuiConfiguration.getMessage("player") + " " + GuiConfiguration.getMessage("winner")),
					StringUtils.capitalize(GuiConfiguration.getMessage("team") + " " + GuiConfiguration.getMessage("winner"))
				};
		}
		else if(tableName.equalsIgnoreCase("partecipant")) {
			this.columnNames = new String[]
				{
					StringUtils.capitalize(GuiConfiguration.getMessage("shortName")),
					StringUtils.capitalize(GuiConfiguration.getMessage("longName")),
					StringUtils.capitalize(GuiConfiguration.getMessage("country"))
				};
		}
		else if(tableName.equalsIgnoreCase("squad")) {
			this.columnNames = new String[]
				{
					StringUtils.capitalize(GuiConfiguration.getMessage("name")),
					StringUtils.capitalize(GuiConfiguration.getMessage("surname")),
					StringUtils.capitalize(GuiConfiguration.getMessage("role")),
					StringUtils.capitalize(GuiConfiguration.getMessage("mainPosition"))
				};
		}
		else if(tableName.equalsIgnoreCase("trophyTeam")) {
			this.columnNames = new String[]
				{
					StringUtils.capitalize(GuiConfiguration.getMessage("trophy")),
					StringUtils.capitalize(GuiConfiguration.getMessage("competition")),
				};
		}
		else if(tableName.equalsIgnoreCase("prizeTeam")) {
			this.columnNames = new String[]
				{
					StringUtils.capitalize(GuiConfiguration.getMessage("prize")),

				};
		}
		else if(tableName.equalsIgnoreCase("competitionParticipation")) {
			this.columnNames = new String[]
				{
					StringUtils.capitalize(GuiConfiguration.getMessage("competition")),
				};
		}

		data = hashMap.get(tableName);

	}
	@Override
	public int getRowCount() {
		return data.length;
	}

	@Override
	public int getColumnCount() {
		return columnNames.length;
	}

	public String getColumnName(int col) {
		return columnNames[col];
	}

	@Override
	public Object getValueAt(int rowIndex, int columnIndex) {
		return data[rowIndex][columnIndex];
	}

	public Class getColumnClass(int c) {
		return getValueAt(0, c).getClass();
	}




	public static void initData()
	{
		Object tmp[][] = new Object[][]
			{
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
				}
			};


		hashMap.put("partecipant", tmp);

		tmp = new Object[][]
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


		hashMap.put("teamTrophy", tmp);

		tmp = new Object[][]
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
				},
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
				},
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

		hashMap.put("playerTrophy", tmp);

		tmp = new Object[][]
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
				},
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
				},
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
				},
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
				},
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

		hashMap.put("competitions", tmp);

		tmp = new Object[][]
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

		hashMap.put("squad", tmp);

		tmp = new Object[][]
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

		hashMap.put("competitionParticipation", tmp);

		tmp = new Object[][]
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

		hashMap.put("trophyTeam", tmp);

		tmp = new Object[][]
			{
				{
					"Targa Europa",
				},
			};

		hashMap.put("prizeTeam", tmp);





	}
}
