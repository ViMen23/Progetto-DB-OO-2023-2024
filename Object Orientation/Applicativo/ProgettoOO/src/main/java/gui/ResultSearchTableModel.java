package gui;

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
					Main.currentLocale.getString("team") + Main.currentLocale.getString("winners"),
					Main.currentLocale.getString("player") + Main.currentLocale.getString("winners")
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
