package gui;

import javax.swing.table.AbstractTableModel;

public class ResultSearchTableModel extends AbstractTableModel
{

	private final String[] columnNames;
	private Object[][] data;
	public ResultSearchTableModel(String tableName, Object[][] resultQuery)
	{
		super();
		this.columnNames = UserResultSearchPanel.columnsTable.get(tableName);
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
