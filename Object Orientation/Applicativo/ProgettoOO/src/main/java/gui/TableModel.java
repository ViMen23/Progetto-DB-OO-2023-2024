
package gui;

import model.Country;
import org.apache.commons.lang3.StringUtils;

import javax.swing.table.AbstractTableModel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


public class TableModel
				extends AbstractTableModel
{

	private List<String> columnNames;
	private List<List<String>> data;

	private static HashMap<String, Object[][]> hashMap = new HashMap<>();
	
	public TableModel(String tableName)
	{
		super();

		//initData();

		if (tableName.equalsIgnoreCase("countries")) {
			this.columnNames = new ArrayList<String>();

			this.columnNames.add(StringUtils.capitalize(GuiConfiguration.getMessage("name")));
			this.columnNames.add(StringUtils.capitalize(GuiConfiguration.getMessage("code")));
			this.columnNames.add(StringUtils.capitalize(GuiConfiguration.getMessage("type")));
		}

		data = new ArrayList<List<String>>();
		for (Country country : Country.getCountryList()) {
			List<String> innerData = new ArrayList<String>();

			innerData.add(country.getName());
			innerData.add(country.getCode());
			innerData.add(country.getType());

			data.add(innerData);
		}

	}
	@Override
	public int getRowCount() {
		return data.size();
	}

	@Override
	public int getColumnCount() {
		return columnNames.size();
	}

	public String getColumnName(int col) {
		return columnNames.get(col);
	}

	@Override
	public Object getValueAt(int rowIndex, int columnIndex)
	{
		return data.get(rowIndex).get(columnIndex);
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


		tmp = new Object[][]
			{
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				},
				{
					"FLAG",
					"ITALIA",
					"ITA",
					"NATION"
				}
			};

		hashMap.put("countries", tmp);

		tmp = new Object[][]
			{
				{
					"Federazione giuco calcio",
					"FIGC",
					"Nazionale",
					"ITALIA"
				},
				{
					"Federazione giuco calcio",
					"FIGC",
					"Nazionale",
					"ITALIA"
				},
				{
					"Federazione giuco calcio",
					"FIGC",
					"Nazionale",
					"ITALIA"
				},
				{
					"Federazione giuco calcio",
					"FIGC",
					"Nazionale",
					"ITALIA"
				},
				{
					"Federazione giuco calcio",
					"FIGC",
					"Nazionale",
					"ITALIA"
				},
				{
					"Federazione giuco calcio",
					"FIGC",
					"Nazionale",
					"ITALIA"
				},
				{
					"Federazione giuco calcio",
					"FIGC",
					"Nazionale",
					"ITALIA"
				},
				{
				"Federazione giuco calcio",
				"FIGC",
				"Nazionale",
				"ITALIA"
				}
			};

		hashMap.put("confederations", tmp);


	}
}
