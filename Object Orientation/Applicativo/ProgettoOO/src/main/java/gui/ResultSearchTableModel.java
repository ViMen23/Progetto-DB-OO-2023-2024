package gui;

import org.apache.commons.lang3.StringUtils;

import javax.swing.event.TableModelListener;
import javax.swing.table.AbstractTableModel;

public class ResultSearchTableModel extends AbstractTableModel
{

	private String[] columnNames;
	private Object[][] data;
	public ResultSearchTableModel(String tableName, Object[][] resultQuery)
	{
		super();

		if (tableName.equalsIgnoreCase("competitions"))
		{
			this.columnNames = UserResultSearchPanel.columnsTable.get(tableName);
		}
		else if (tableName.equalsIgnoreCase("teamTrophyMaybe"))
		{
			this.columnNames = new String[]
				{
					Main.currentLocale.getString("firstPlace"),
					Main.currentLocale.getString("secondPlace"),
					Main.currentLocale.getString("thirdPlace")
				};
		}
		else if(tableName.equalsIgnoreCase("playerTrophyMaybe"))
		{
			this.columnNames = new String[]
				{
					Main.currentLocale.getString("mostValuablePlayer"),
					Main.currentLocale.getString("bestStriker"),
					Main.currentLocale.getString("bestMidfielder"),
					Main.currentLocale.getString("bestDefender"),
					Main.currentLocale.getString("bestGoalkeeper"),
					Main.currentLocale.getString("goalOfTheSeason")
				};
		}
		else if(tableName.equalsIgnoreCase("teamTrophy"))
		{
			this.columnNames = new String[]
				{
					Main.currentLocale.getString("trophy"),
					Main.currentLocale.getString("winners")
				};
		}
		else if(tableName.equalsIgnoreCase("playerTrophy"))
		{
			this.columnNames = new String[]
				{
					Main.currentLocale.getString("trophy"),
					Main.currentLocale.getString("player") + " " + Main.currentLocale.getString("winners"),
					Main.currentLocale.getString("team") + " " + Main.currentLocale.getString("winners")
				};
		}
		else if(tableName.equalsIgnoreCase("partecipant"))
		{
			this.columnNames = new String[]
				{
					StringUtils.capitalize(Main.currentLocale.getString("shortName")),
					StringUtils.capitalize(Main.currentLocale.getString("longName")),
					StringUtils.capitalize(Main.currentLocale.getString("country")),
					StringUtils.capitalize(Main.currentLocale.getString("go")) + " " +
						Main.currentLocale.getString("to")
				};
		}
		else if(tableName.equalsIgnoreCase("squad"))
		{
			this.columnNames = new String[]
				{
					StringUtils.capitalize(Main.currentLocale.getString("name")),
					StringUtils.capitalize(Main.currentLocale.getString("surname")),
					StringUtils.capitalize(Main.currentLocale.getString("role")),
					StringUtils.capitalize(Main.currentLocale.getString("mainPosition"))
				};
		}
		else if(tableName.equalsIgnoreCase("trophyTeam"))
		{
			this.columnNames = new String[]
				{
					StringUtils.capitalize(Main.currentLocale.getString("trophy")),
					StringUtils.capitalize(Main.currentLocale.getString("competition")),
				};
		}
		else if(tableName.equalsIgnoreCase("prizeTeam"))
		{
			this.columnNames = new String[]
				{
					StringUtils.capitalize(Main.currentLocale.getString("prize")),

				};
		}
		else if(tableName.equalsIgnoreCase("competitionParticipation"))
		{
			this.columnNames = new String[]
				{
					StringUtils.capitalize(Main.currentLocale.getString("competition")),
				};
		}

		this.data = resultQuery;

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
}