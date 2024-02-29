package gui;

import javax.swing.*;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.table.DefaultTableCellRenderer;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

public class MyTable
			extends JTable
{
	private final JScrollPane scrollPane;
	public MyTable(Boolean sort, JLabel controlColumnLabel, JLabel controlRowLabel, JLabel controlMouseLabel)
	{
		super();

		this.setRowHeight(GuiConfiguration.getTableRowHeight());

		this.setPreferredScrollableViewportSize(this.getPreferredSize());
		this.setFillsViewportHeight(true);

		this.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		this.setAutoCreateRowSorter(sort);

		DefaultTableCellRenderer defaultRenderer = (DefaultTableCellRenderer) this.getTableHeader().getDefaultRenderer();

		defaultRenderer.setHorizontalAlignment(SwingConstants.CENTER);


		this.getColumnModel().getSelectionModel().addListSelectionListener(new ListSelectionListener() {
			@Override
			public void valueChanged(ListSelectionEvent e)
			{
				controlColumnLabel.setText(
					String.valueOf(MyTable.this.convertColumnIndexToModel(MyTable.this.getSelectedColumn()))
				);
			}
		});

		this.getSelectionModel().addListSelectionListener(new ListSelectionListener() {
			@Override
			public void valueChanged(ListSelectionEvent e)
			{
				controlRowLabel.setText(
					String.valueOf(MyTable.this.convertRowIndexToModel(MyTable.this.getSelectedRow()))
				);
			}
		});

		this.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e)
			{
				if (e.getClickCount() >= 1) {
					controlMouseLabel.setText("@click");
				}
			}
		});

		scrollPane = new JScrollPane(this);
	}


	public JScrollPane getScrollPane()
	{
		return scrollPane;
	}
}
