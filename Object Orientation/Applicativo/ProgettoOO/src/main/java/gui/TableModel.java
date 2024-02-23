package gui;

import javax.swing.table.DefaultTableModel;
import java.util.Vector;


public class TableModel
				extends DefaultTableModel
{

	public TableModel(Vector<? extends Vector> data, Vector<?> columnNames){
		super(data, columnNames);
	}

	@Override
	public boolean isCellEditable(int row, int column) {
		return false;
	}
}