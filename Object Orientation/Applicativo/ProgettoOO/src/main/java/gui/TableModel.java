package gui;

import javax.swing.table.DefaultTableModel;
import java.util.Vector;


public class TableModel
				extends DefaultTableModel
{
	private final int columnSize;
	private boolean adminDelete = false;

	public TableModel(Vector<? extends Vector> data,
										Vector<?> columnNames)
	{
		super(data, columnNames);
		columnSize = columnNames.size();
	}

	public TableModel(Vector<? extends Vector> data,
										Vector<?> columnNames,
										boolean adminDelete)
	{
		this(data, columnNames);
		this.adminDelete = adminDelete;
	}


	@Override
	public boolean isCellEditable(int row,
																int column)
	{
		return (adminDelete && column == columnSize);
	}

	@Override
	public Class getColumnClass(int c)
	{
		if (!(dataVector.isEmpty()) && super.getValueAt(0, c) != null) {
			return super.getValueAt(0, c).getClass();
		} else {
			return Object.class;
		}
	}
}